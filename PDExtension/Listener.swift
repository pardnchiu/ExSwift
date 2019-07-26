//
//  Listener.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/14.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public func listener(add observer: Any,_ tag: String,_ selector: Selector,_ object: Any?) {
    switch (tag) {
    case "keyboardWillAppear":
        NotificationCenter.default.addObserver(observer, selector: selector, name: UIResponder.keyboardWillShowNotification, object: nil);
    default:
        NotificationCenter.default.addObserver(observer, selector: selector, name: NSNotification.Name(rawValue: tag), object: object)
    }
}

public func listener(set tag: String,_ dic: [String:Any]) {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: tag), object: nil, userInfo: dic)
}

public func listener(delete observer: Any,_ tag: String) {
    NotificationCenter.default.removeObserver(observer, name: NSNotification.Name(rawValue: tag), object: nil)
}
