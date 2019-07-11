//
//  UIProgressView.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/11.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UIProgressView {
    
    convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ style: UIProgressView.Style) {
        self.init(progressViewStyle: style);
        self.set(frame: x, y, w, h);
    };
    
    convenience init(_ frame: CGRect,_ style: UIProgressView.Style) {
        self.init(progressViewStyle: style);
        switch frame {
        case .zero: self.autolayout();
        default   : self.frame = frame;
        };
    };
    
    func set(color front: UIColor, color back: UIColor) {
        self.progressTintColor = front;
        self.trackTintColor    = back;
    };
};
