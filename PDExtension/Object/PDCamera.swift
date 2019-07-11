import UIKit
import AVFoundation

public class PDCamera: NSObject {
    
    public enum ERROR: Swift.Error {
        case captureSessionAlreadyRunning
        case captureSessionIsMissing
        case inputsAreInvalid
        case invalidOperation
        case noCamerasAvailable
        case unknown
    }
    
    public enum CameraPosition {
        case front
        case rear
    }
    
    public var session: AVCaptureSession?
    public var front  : AVCaptureDevice?
    public var rear   : AVCaptureDevice?
    public var frontInput: AVCaptureDeviceInput?
    public var rearInput : AVCaptureDeviceInput?
    public var videoInput: AVCaptureDeviceInput?
    public var audioInput: AVCaptureDeviceInput?
    public var videoOutput = AVCaptureMovieFileOutput()
    public var photoOutput = AVCapturePhotoOutput()
    public var previewLayer: AVCaptureVideoPreviewLayer?
    public var flashMode = AVCaptureDevice.FlashMode.auto
    public var currentCameraPosition: CameraPosition?
    public var photoCaptureCompletionBlock:((UIImage?,Error?) -> Void)?
}

extension PDCamera {
    
    public func set(_ completion: @escaping (Error?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do{
                self.session = AVCaptureSession();
                
                let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .unspecified);
                let cameras = (session.devices.compactMap { $0 });
                for camera in cameras {
                    if camera.position == .front {
                        self.front = camera;
                    };
                    if camera.position == .back {
                        self.rear = camera;
                        try camera.lockForConfiguration();
                        camera.focusMode = .continuousAutoFocus;
                        camera.unlockForConfiguration();
                    };
                };
                
                guard let captureSession = self.session else {
                    throw ERROR.captureSessionIsMissing
                };
                
                if let rearCamera = self.rear {
                    self.rearInput = try AVCaptureDeviceInput(device: rearCamera);
                    if captureSession.canAddInput(self.rearInput!){
                        captureSession.addInput(self.rearInput!)
                    };
                    self.currentCameraPosition = .rear;
                } else if let frontCamera = self.front {
                    self.frontInput = try AVCaptureDeviceInput(device: frontCamera);
                    if captureSession.canAddInput(self.frontInput!) {
                        captureSession.addInput(self.frontInput!)
                    };
                    self.currentCameraPosition = .front;
                };
                
                if let videoInput = AVCaptureDevice.default(for: .video) {
                    self.videoInput = try AVCaptureDeviceInput(device: videoInput);
                    if captureSession.canAddInput(self.videoInput!) {
                        captureSession.addInput(self.videoInput!)
                    };
                };
                
                if let audioInput = AVCaptureDevice.default(for: .audio) {
                    self.audioInput = try AVCaptureDeviceInput(device: audioInput);
                    if captureSession.canAddInput(self.audioInput!) {
                        captureSession.addInput(self.audioInput!)
                    };
                };
                
                self.photoOutput.setPreparedPhotoSettingsArray([
                    AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
                ], completionHandler: nil);
                self.videoOutput.maxRecordedDuration = CMTime(seconds: 20, preferredTimescale: 600);
                self.videoOutput.movieFragmentInterval = CMTime.invalid;
                if captureSession.canAddOutput(self.videoOutput) {
                    captureSession.addOutput(self.videoOutput);
                };
                if captureSession.canAddOutput(self.photoOutput) {
                    captureSession.addOutput(self.photoOutput);
                };
                captureSession.startRunning();
            } catch {
                DispatchQueue.main.async {
                    completion(error);
                };
                return;
            };
            DispatchQueue.main.async {
                completion(nil);
            };
        };
    };
    
    public func set(preview view: UIView) throws {
        guard
            let captureSession = self.session, captureSession.isRunning
            else { throw ERROR.captureSessionIsMissing };
        self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.previewLayer?.connection?.videoOrientation = .portrait
        self.previewLayer?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.layer.insertSublayer(self.previewLayer!, at: 0)
    }
    
    public func change() throws {
        guard
            let currenCameraPoisition = currentCameraPosition,
            let captureSession = self.session, captureSession.isRunning
            else {
                throw ERROR.captureSessionIsMissing;
        };
        captureSession.beginConfiguration()
        
        switch (currenCameraPoisition) {
        case .front:
            let inputs = captureSession.inputs
            guard
                let frontCameraInput = self.frontInput, inputs.contains(frontCameraInput),
                let rearCamera = self.rear
                else {
                    throw ERROR.captureSessionIsMissing;
            };
            
            self.rearInput = try AVCaptureDeviceInput(device: rearCamera)
            captureSession.removeInput(frontCameraInput)
            if captureSession.canAddInput(self.rearInput!) {
                captureSession.addInput(self.rearInput!)
                self.currentCameraPosition = .rear
            } else {
                throw ERROR.invalidOperation
            }
        case .rear:
            let inputs = captureSession.inputs
            guard
                let rearCameraInput = self.rearInput, inputs.contains(rearCameraInput),
                let frontCamera = self.front
                else {
                    throw ERROR.captureSessionIsMissing;
            }
    
            self.frontInput = try AVCaptureDeviceInput(device: frontCamera)
    
            captureSession.removeInput(rearCameraInput)
    
            if captureSession.canAddInput(self.frontInput!) {
                captureSession.addInput(self.frontInput!)
                self.currentCameraPosition = .front
            } else {
                throw ERROR.invalidOperation;
            }
        }
        
        captureSession.commitConfiguration()
        
    }
    
    public func set(flash value: AVCaptureDevice.FlashMode) throws {
        switch value {
        case .auto: self.flashMode = .on;
        case .on  : self.flashMode = .off;
        case .off : self.flashMode = .auto;
        @unknown default:
            throw ERROR.unknown;
        }
    }
    
    public func get(_ completion: @escaping (UIImage?, Error?) -> Void) {
        guard
            let captureSession = session, captureSession.isRunning
            else {
                completion(nil, ERROR.captureSessionIsMissing);
                return
        }
        
        let settings = AVCapturePhotoSettings()
        settings.flashMode = self.flashMode
        
        self.photoOutput.capturePhoto(with: settings, delegate: self)
        self.photoCaptureCompletionBlock = completion
    }
}

extension PDCamera: AVCapturePhotoCaptureDelegate {
    
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            self.photoCaptureCompletionBlock?(nil, error)
        } else if let data = photo.fileDataRepresentation() {
            let image = UIImage(data: data)
            self.photoCaptureCompletionBlock?(image, nil)
        } else{
            self.photoCaptureCompletionBlock?(nil, ERROR.unknown)
        }
    }
    
//    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
//
//        if let error = error {
//            self.photoCaptureCompletionBlock!(nil, error)
//        } else if let buffer = photoSampleBuffer, let data = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: buffer, previewPhotoSampleBuffer: nil) {
//            //AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: buffer, previewPhotoSampleBuffer: nil)
//            let image = UIImage(data: data)
//            self.photoCaptureCompletionBlock!(image, nil)
//        }else{
//            self.photoCaptureCompletionBlock!(nil, CameraControllerError.unknown)
//        }
//    }
}
