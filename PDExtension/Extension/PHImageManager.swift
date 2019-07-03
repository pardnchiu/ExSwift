//
//  PHImageManagerExtension.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/1.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import Photos
import PDExtension

public extension PHImageManager {
    
    func get(image asset: PHAsset,_ size: CGSize,_ completion: @escaping (UIImage?) -> ()) {
        let options = PHImageRequestOptions()
        options.isNetworkAccessAllowed = true
        options.version      = .current
        options.deliveryMode = .opportunistic
        options.resizeMode   = .exact
        self.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: options, resultHandler: { (image, info) in
            completion(image)
        });
    }
    
    func get(video asset: PHAsset,_ completion: @escaping (AVAsset?) -> ()) {
        let options = PHVideoRequestOptions()
        options.isNetworkAccessAllowed = true
        options.version      = .current
        options.deliveryMode = .automatic
        self.requestAVAsset(forVideo: asset, options: options) { (video, mix, nfo) in
            completion(video)
        };
    }
}
