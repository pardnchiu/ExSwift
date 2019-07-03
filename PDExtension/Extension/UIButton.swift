//
//  UIButton.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    func set(image: UIImage?,_ state: UIControl.State) { self.setImage(image, for: state) };
    func set(enable: Bool) { self.isEnabled = enable };
    func set(alignment horizon: UIControl.ContentHorizontalAlignment,_ vertical: UIControl.ContentVerticalAlignment) {
        self.contentHorizontalAlignment = horizon;
        self.contentVerticalAlignment   = vertical;
    };
    
    func text(normal value: String,_ color: UIColor) {
        self.setTitle(value, for: UIControl.State.normal)
        self.setTitleColor(color, for: UIControl.State.normal)
    };
    func text(highlight value: String,_ color: UIColor) {
        self.setTitle(value, for: UIControl.State.highlighted)
        self.setTitleColor(color, for: UIControl.State.normal)
        
    };
    func text(disabled value: String,_ color: UIColor) {
        self.setTitle(value, for: UIControl.State.disabled)
        self.setTitleColor(color, for: UIControl.State.normal)
    };
    
    func tap(upIn target: Any?,_ action: Selector) { self.addTarget(target, action: action, for: .touchUpInside) };
    func tap(upOut target: Any?,_ action: Selector) { self.addTarget(target, action: action, for: .touchUpOutside) };
    func tap(down target: Any?,_ action: Selector) { self.addTarget(target, action: action, for: .touchDown) };
    func tap(cancel target: Any?,_ action: Selector) { self.addTarget(target, action: action, for: .touchCancel) };
};
