//
//  PDRequest.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/4.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import Photos

public struct PDAsset {
    public enum body {
        case asset;
        case size;         // 設定大小
        case version;
        case resize;       // 照片縮放
        case deliveryMode; // 照片質量
        case networkAllow; // 允許從iColud 下載照片
        case synchronous;  // 同步請求照片
        case contentMode;
    }
    public var key: body, value: Any;
    public init(_ key: body,_ value: Any) {
        self.key   = key;
        self.value = value;
    };
};

public func iAsset(asset value: PHAsset)                                  -> PDAsset { return PDAsset(.asset, value) };
public func iAsset(size value: CGSize)                                    -> PDAsset { return PDAsset(.size, value) };
public func iAsset(version value: PHImageRequestOptionsVersion)           -> PDAsset { return PDAsset(.version, value) };
public func iAsset(resize value: PHImageRequestOptionsResizeMode)         -> PDAsset { return PDAsset(.resize, value) };
public func iAsset(deliveryMode value: PHImageRequestOptionsDeliveryMode) -> PDAsset { return PDAsset(.deliveryMode, value) };
public func iAsset(networkAllow value: Bool)                              -> PDAsset { return PDAsset(.networkAllow, value) };
public func iAsset(synchronous value: Bool)                               -> PDAsset { return PDAsset(.synchronous, value) };
public func iAsset(contentMode value: PHImageContentMode)                 -> PDAsset { return PDAsset(.contentMode, value) };

public struct PDAVAsset {
    public enum body {
        case asset;
        case version;
        case deliveryMode; // 照片質量
        case networkAllow; // 允許從iColud 下載照片
    }
    public var key: body, value: Any;
    public init(_ key: body,_ value: Any) {
        self.key   = key;
        self.value = value;
    };
};

public func vAsset(asset value: PHAsset)                                  -> PDAVAsset { return PDAVAsset(.asset, value) };
public func vAsset(version value: PHVideoRequestOptionsVersion)           -> PDAVAsset { return PDAVAsset(.version, value) };
public func vAsset(deliveryMode value: PHVideoRequestOptionsDeliveryMode) -> PDAVAsset { return PDAVAsset(.deliveryMode, value) };
public func vAsset(networkAllow value: Bool)                              -> PDAVAsset { return PDAVAsset(.networkAllow, value) };

public func albumPermission(_ root: UIViewController,_ completion: @escaping ()->Void) {
    PHPhotoLibrary.requestAuthorization({ (status) in
        DispatchQueue.main.async {
            switch status {
            case .authorized:
                completion()
            default:
                PDAlert(alert: root, title: "通知", message: "您尚未開啟存取相簿的權限\n請至手機的設定>NEEDS>照片>改為允許讀取和寫入", actions: [
                    PDAction(title: "是", style: .default, action: { (action) in
                        if let settingsURL = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
                            UIApplication.shared.open(settingsURL as URL);
                        };
                    }),
                    PDAction(title: "否", style: .cancel, action: nil)
                    ]);
            };
        };
    });
};

public extension PHImageManager {
    
    func PDRequest(avasset values: [PDAVAsset],_ completion: @escaping (AVAsset?) -> ()) {
        let options = PHVideoRequestOptions()
        var asset: PHAsset?
        values.forEach {
            switch $0.key {
            case .asset       : if let value = $0.value as? PHAsset { asset = value; };
            case .version     : if let value = $0.value as? PHVideoRequestOptionsVersion { options.version = value };
            case .deliveryMode: if let value = $0.value as? PHVideoRequestOptionsDeliveryMode { options.deliveryMode = value };
            case .networkAllow: if let value = $0.value as? Bool { options.isNetworkAccessAllowed = value };
            };
        };
        guard let target = asset else { completion(nil); return };
        self.requestAVAsset(forVideo: target, options: options) { (video, mix, nfo) in
            completion(video)
        };
    }
    
    func PDRequest(asset values: [PDAsset],_ completion: @escaping (UIImage?) -> ()) {
        let options = PHImageRequestOptions()
        var asset: PHAsset?
        var size : CGSize?
        var contentMode: PHImageContentMode = .aspectFit
        values.forEach {
            switch $0.key {
            case .asset       : if let value = $0.value as? PHAsset { asset = value; };
            case .size        : if let value = $0.value as? CGSize { size = value }
            case .version     : if let value = $0.value as? PHImageRequestOptionsVersion { options.version = value };
            case .resize      : if let value = $0.value as? PHImageRequestOptionsResizeMode { options.resizeMode = value };
            case .deliveryMode: if let value = $0.value as? PHImageRequestOptionsDeliveryMode { options.deliveryMode = value };
            case .networkAllow: if let value = $0.value as? Bool { options.isNetworkAccessAllowed = value };
            case .synchronous : if let value = $0.value as? Bool { options.isSynchronous = value };
            case .contentMode : if let value = $0.value as? PHImageContentMode { contentMode = value };
            };
        };
        guard let target = asset else { completion(nil); return };
        self.requestImage(for: target, targetSize: size ?? CGSize(target.pixelWidth._cgflt, target.pixelHeight._cgflt), contentMode: contentMode, options: options, resultHandler: { (image, info) in
            completion(image);
        });
    };
};
