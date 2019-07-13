//
//  Permission.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/14.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit
import Photos

public func permission(album root: UIViewController,_ completion: @escaping (Bool)->Void) {
    func alert() {
        PDAlert(alert: root, title: "通知", message: "您尚未開啟相簿權限\n前往設定→\(Bundle.main.displayName)→照片→允許讀取和寫入", actions: [
            PDAction(title: "是", style: .default, action: { (action) in
                if let settingsURL = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
                    UIApplication.shared.open(settingsURL as URL);
                };
            }),
            PDAction(title: "否", style: .cancel, action: nil)
            ]);
        completion(false);
    };
    switch (PHPhotoLibrary.authorizationStatus())  {
    case .authorized   : completion(true);
    case .notDetermined:
        PHPhotoLibrary.requestAuthorization {
            switch ($0) {
            case .authorized: completion(true);
            default         : alert()
            };
        };
    default: alert()
    };
};

public func permission(camera root: UIViewController,_ completion: @escaping (Bool)->Void) {
    func alert() {
        PDAlert(alert: root, title: "通知", message: "您尚未開啟相機權限\n前往設定→\(Bundle.main.displayName)→相機→設為開啟", actions: [
            PDAction(title: "是", style: .default, action: { (action) in
                if let settingsURL = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
                    UIApplication.shared.open(settingsURL as URL);
                };
            }),
            PDAction(title: "否", style: .cancel, action: nil)
            ]);
        completion(false);
    };
    switch (AVCaptureDevice.authorizationStatus(for: AVMediaType.video)) {
    case .authorized   : completion(true);
    case .notDetermined:
        AVCaptureDevice.requestAccess(for: AVMediaType.video) {
            switch ($0) {
            case true : completion(true);
            case false: alert()
            };
        };
    default: alert()
    };
};

public func permission(albumCamera root: UIViewController,_ completion: @escaping (Bool)->Void) {
    enum body {
        case album
        case camera
        case both
    }
    func alert(_ body: body) {
        var message: String = ""
        switch body {
        case .album : message = "您尚未開啟相簿權限\n前往設定→\(Bundle.main.displayName)→照片→允許讀取和寫入"
        case .camera: message = "您尚未開啟相機權限\n前往設定→\(Bundle.main.displayName)→相機→設為開啟"
        case .both  : message = "您尚未開啟相簿/相機權限\n前往設定→\(Bundle.main.displayName)→更改設定"
        }
        PDAlert(alert: root, title: "通知", message: message, actions: [
            PDAction(title: "是", style: .default, action: { (action) in
                if let settingsURL = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
                    UIApplication.shared.open(settingsURL as URL);
                };
            }),
            PDAction(title: "否", style: .cancel, action: nil)
            ]);
        completion(false);
    };
    let album = PHPhotoLibrary.authorizationStatus();
    let camera = AVCaptureDevice.authorizationStatus(for: AVMediaType.video);
    switch (album, camera) {
    case (.authorized, .authorized): completion(true);
    case (.notDetermined, .authorized), (.denied, .authorized), (.restricted, .authorized):
        PHPhotoLibrary.requestAuthorization {
            switch ($0) {
            case .authorized: completion(true);
            default         : alert(.album);
            };
        };
    case (.authorized, .notDetermined), (.authorized, .denied), (.authorized, .restricted):
        AVCaptureDevice.requestAccess(for: AVMediaType.video) {
            switch ($0) {
            case true : completion(true);
            case false: alert(.camera);
            };
        };
    case (.notDetermined, .notDetermined):
        PHPhotoLibrary.requestAuthorization {
            switch ($0) {
            case .authorized:
                AVCaptureDevice.requestAccess(for: AVMediaType.video) {
                    switch ($0) {
                    case true : completion(true);
                    case false: alert(.camera);
                    };
                };
            default: alert(.album);
            };
        };
    default: alert(.both);
    };
};
