
//  PHImageManagerExtension.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/1.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.


import Foundation
import Photos

public extension PHAsset {
    
    var isVideo: Bool { return self.mediaType == .video };
    var isImage: Bool { return self.mediaType == .image };
    
    func get(data completion: @escaping (Data, String)->Void) {
        PHImageManager.default().requestAVAsset(forVideo: self, options: nil, resultHandler: { (asset, audioMix, info) in
            DispatchQueue.main.async {
                switch self.isVideo {
                case true:
                    if
                        let asset = asset as? AVURLAsset,
                        let data  = try? Data(contentsOf: asset.url) {
                        let url = URL(fileURLWithPath: "\(asset.url)");
                        let mimetype = mimeType(pathExtension: url.pathExtension);
                        switch mimetype {
                        case "video/mp4"      : completion(data, ".mp4")
                        case "video/quicktime": completion(data, ".mov")
                        default               : completion(data, mimetype)
                        }
                    };
                case false:
                    // 原檔上傳不壓縮
                    let options = PHImageRequestOptions().set {
                        $0.version      = .current
                        $0.deliveryMode = .highQualityFormat
                        $0.resizeMode   = .exact
                        $0.isNetworkAccessAllowed = true
                        $0.isSynchronous          = true
                    }
                    PHImageManager.default().requestImage(for: self, targetSize: CGSize(CGFloat(self.pixelWidth), CGFloat(self.pixelHeight)), contentMode: .aspectFill, options: options, resultHandler: { (image, info) in
                        if let data = image?.jpegData(compressionQuality: 1) {
                            completion(data, ".jpg")
                        };
                    });
                };
            };
        });
    }
}
//public struct PDAsset {
//    public enum body {
//        case asset;
//        case size;         // 設定大小
//        case version;
//        case resize;       // 照片縮放
//        case deliveryMode; // 照片質量
//        case networkAllow; // 允許從iColud 下載照片
//        case synchronous;  // 同步請求照片
//        case contentMode;
//    }
//    public var key: body, value: Any;
//    public init(_ key: body,_ value: Any) {
//        self.key   = key;
//        self.value = value;
//    };
//};
//
//public func iAsset(asset value: PHAsset)                                  -> PDAsset { return PDAsset(.asset, value) };
//public func iAsset(size value: CGSize)                                    -> PDAsset { return PDAsset(.size, value) };
//public func iAsset(version value: PHImageRequestOptionsVersion)           -> PDAsset { return PDAsset(.version, value) };
//public func iAsset(resize value: PHImageRequestOptionsResizeMode)         -> PDAsset { return PDAsset(.resize, value) };
//public func iAsset(deliveryMode value: PHImageRequestOptionsDeliveryMode) -> PDAsset { return PDAsset(.deliveryMode, value) };
//public func iAsset(networkAllow value: Bool)                              -> PDAsset { return PDAsset(.networkAllow, value) };
//public func iAsset(synchronous value: Bool)                               -> PDAsset { return PDAsset(.synchronous, value) };
//public func iAsset(contentMode value: PHImageContentMode)                 -> PDAsset { return PDAsset(.contentMode, value) };
//
//public extension PHImageManager {
//    
//    func get(image asset: PHAsset,_ size: CGSize?,_ completion: @escaping (UIImage?) -> ()) {
//        let options = PHImageRequestOptions()
//        options.isNetworkAccessAllowed = true
//        options.isSynchronous = true
//        options.version      = .current
//        options.deliveryMode = .opportunistic
//        options.resizeMode   = .exact
//        let targetSize = size ?? CGSize(asset.pixelWidth._cgflt, asset.pixelHeight._cgflt)
//        self.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options, resultHandler: { (image, info) in
//            completion(image)
//        });
//    }
//    
//    func get(video asset: PHAsset,_ completion: @escaping (AVAsset?) -> ()) {
//        let options = PHVideoRequestOptions()
//        options.isNetworkAccessAllowed = true
//        options.version      = .current
//        options.deliveryMode = .automatic
//        self.requestAVAsset(forVideo: asset, options: options) { (video, mix, nfo) in
//            completion(video)
//        };
//    }
//    
//    func PDRequest(asset values: [PDAsset],_ completion: @escaping (UIImage?) -> ()) {
//        let options = PHImageRequestOptions()
//        var asset: PHAsset?
//        var size : CGSize?
//        var contentMode: PHImageContentMode = .aspectFit
//        values.forEach {
//            switch $0.key {
//            case .asset       : if let value = $0.value as? PHAsset { asset = value; };
//            case .size        : if let value = $0.value as? CGSize { size = value }
//            case .version     : if let value = $0.value as? PHImageRequestOptionsVersion { options.version = value };
//            case .resize      : if let value = $0.value as? PHImageRequestOptionsResizeMode { options.resizeMode = value };
//            case .deliveryMode: if let value = $0.value as? PHImageRequestOptionsDeliveryMode { options.deliveryMode = value };
//            case .networkAllow: if let value = $0.value as? Bool { options.isNetworkAccessAllowed = value };
//            case .synchronous : if let value = $0.value as? Bool { options.isSynchronous = value };
//            case .contentMode : if let value = $0.value as? PHImageContentMode { contentMode = value };
//            };
//        };
//        guard let target = asset else { completion(nil); return };
//        self.requestImage(for: target, targetSize: size ?? CGSize(target.pixelWidth._cgflt, target.pixelHeight._cgflt), contentMode: contentMode, options: options, resultHandler: { (image, info) in
////            print("asset info:", info ?? [:]);
//            completion(image);
//        });
//    };
//};
