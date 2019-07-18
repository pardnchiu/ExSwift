//
//  UIImageView.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/9.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UIImageView {
    
    // set frame
    convenience init(_ frame: CGRect,_ image: UIImage?) {
        self.init(frame: frame);
        self.set(autolayout: frame != .zero);
        self.image = image;
        self.contentMode = .scaleAspectFit;
        self.clipsToBounds = true;
    };
    
    convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ image: UIImage?) {
        let rect = CGRect(x: x, y: y, width: w, height: h);
        self.init(frame: rect);
        self.image = image;
        self.contentMode = .scaleAspectFit;
        self.clipsToBounds = true;
    };
    
    convenience init(_ frame: CGRect,_ img: UIImage?,_ mode: UIView.ContentMode) {
        self.init(frame: frame);
        self.set(autolayout: frame != .zero);
        self.image = img;
        self.contentMode = mode;
        self.clipsToBounds = true;
    };
    
    convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ img: UIImage?,_ mode: UIView.ContentMode) {
        let rect = CGRect(x: x, y: y, width: w, height: h);
        self.init(frame: rect);
        self.image = img;
        self.contentMode = mode;
        self.clipsToBounds = true;
    };
    
    func set(image value: UIImage?) {
        self.image = value;
        self.contentMode = .scaleAspectFit;
        self.clipsToBounds = true;
        
    };
    func set(image value: UIImage?,_ mode: UIView.ContentMode) {
        self.image = value;
        self.contentMode = mode;
        self.clipsToBounds = true;
    };
    
    func set(image url: URL?) {
        get(image: url) {
            self.image = $0
            self.contentMode = .scaleAspectFit;
            self.clipsToBounds = true;
        };
    };
    func set(image url: URL?,_ mode: UIView.ContentMode) {
        get(image: url) {
            self.image = $0
            self.contentMode = mode;
            self.clipsToBounds = true;
        };
    };
};
