import UIKit
import AVFoundation
import PDExtension

public class PDCamera: NSObject {
    
    public var session: AVCaptureSession?
    public var front  : AVCaptureDevice?
    public var rear   : AVCaptureDevice?
    public var video = AVCaptureDevice.default(for: AVMediaType.video)
    public var audio = AVCaptureDevice.default(for: AVMediaType.audio)
    public var input_front: AVCaptureDeviceInput?
    public var input_rear : AVCaptureDeviceInput?
    public var input_video: AVCaptureDeviceInput?
    public var input_audio: AVCaptureDeviceInput?
    public var output_video = AVCaptureMovieFileOutput()
    public var output_photo = AVCapturePhotoOutput()
    public var preview: AVCaptureVideoPreviewLayer?
    public var flashMode = AVCaptureDevice.FlashMode.off
    public var currentCameraPosition: CameraPosition?
    public var photoCaptureCompletionBlock:((UIImage?,Error?) -> Void)?
}

extension PDCamera {
    
    public func set(_ completion: @escaping (Error?) -> Void) {
        DispatchQueue(label: "prepare").async {
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
                    throw CameraControllerError.captureSessionIsMissing
                };
                
                if let rearCamera = self.rear {
                    self.input_rear = try AVCaptureDeviceInput(device: rearCamera);
                    if captureSession.canAddInput(self.input_rear!){
                        captureSession.addInput(self.input_rear!)
                    };
                    self.currentCameraPosition = .rear;
                } else if let frontCamera = self.front {
                    self.input_front = try AVCaptureDeviceInput(device: frontCamera);
                    if captureSession.canAddInput(self.input_front!) {
                        captureSession.addInput(self.input_front!)
                    };
                    self.currentCameraPosition = .front;
                };
                
                if let videoInput = self.video {
                    self.input_video = try AVCaptureDeviceInput(device: videoInput);
                    if captureSession.canAddInput(self.input_video!) {
                        captureSession.addInput(self.input_video!)
                    };
                };
                
                if let audioInput = self.audio {
                    self.input_audio = try AVCaptureDeviceInput(device: audioInput);
                    if captureSession.canAddInput(self.input_audio!) {
                        captureSession.addInput(self.input_audio!)
                    };
                };
                
                self.output_photo.setPreparedPhotoSettingsArray([
                    AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
                ], completionHandler: nil);
                self.output_video.maxRecordedDuration = CMTime(seconds: 20, preferredTimescale: 600);
                self.output_video.movieFragmentInterval = CMTime.invalid;
                if captureSession.canAddOutput(self.output_video) {
                    captureSession.addOutput(self.output_video);
                };
                if captureSession.canAddOutput(self.output_photo) {
                    captureSession.addOutput(self.output_photo);
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
    
    public func show(_ view: UIView) throws {
        guard
            let captureSession = self.session, captureSession.isRunning
            else {
            throw CameraControllerError.captureSessionIsMissing;
        };
        self.preview = AVCaptureVideoPreviewLayer(session: captureSession)
        self.preview?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.preview?.connection?.videoOrientation = .portrait
        view.layer.insertSublayer(self.preview!, at: 0)
        self.preview?.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    public func change() throws {
        guard
            let currenCameraPoisition = currentCameraPosition,
            let captureSession = self.session, captureSession.isRunning
            else {
                throw CameraControllerError.captureSessionIsMissing;
        };
        captureSession.beginConfiguration()
        
        switch (currenCameraPoisition) {
        case .front:
            let inputs = captureSession.inputs
            guard
                let frontCameraInput = self.input_front, inputs.contains(frontCameraInput),
                let rearCamera = self.rear
                else {
                    throw CameraControllerError.captureSessionIsMissing;
            };
            
            self.input_rear = try AVCaptureDeviceInput(device: rearCamera)
            captureSession.removeInput(frontCameraInput)
            if captureSession.canAddInput(self.input_rear!) {
                captureSession.addInput(self.input_rear!)
                self.currentCameraPosition = .rear
            } else {
                throw CameraControllerError.invalidOperation
            }
        case .rear:
            let inputs = captureSession.inputs
            guard
                let rearCameraInput = self.input_rear, inputs.contains(rearCameraInput),
                let frontCamera = self.front
                else {
                    throw CameraControllerError.captureSessionIsMissing;
            }
    
            self.input_front = try AVCaptureDeviceInput(device: frontCamera)
    
            captureSession.removeInput(rearCameraInput)
    
            if captureSession.canAddInput(self.input_front!) {
                captureSession.addInput(self.input_front!)
                self.currentCameraPosition = .front
            } else {
                throw CameraControllerError.invalidOperation;
            }
        }
        
        captureSession.commitConfiguration()
        
    }
    
    public func get(_ completion: @escaping (UIImage?, Error?) -> Void) {
        guard
            let captureSession = session, captureSession.isRunning
            else {
                completion(nil, CameraControllerError.captureSessionIsMissing);
                return
        }
        
        let settings = AVCapturePhotoSettings()
        settings.flashMode = self.flashMode
        
        self.output_photo.capturePhoto(with: settings, delegate: self)
        self.photoCaptureCompletionBlock = completion
    }
}

extension PDCamera: AVCapturePhotoCaptureDelegate {
    
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let error = error {
            self.photoCaptureCompletionBlock!(nil, error)
        } else if let buffer = photoSampleBuffer, let data = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: buffer, previewPhotoSampleBuffer: nil) {
            
            let image = UIImage(data: data)
            self.photoCaptureCompletionBlock!(image, nil)
        }else{
            self.photoCaptureCompletionBlock!(nil, CameraControllerError.unknown)
        }
    }
}

extension PDCamera {
    
    public enum CameraControllerError: Swift.Error {
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
}
