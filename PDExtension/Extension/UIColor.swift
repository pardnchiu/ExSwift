//
//  UIColor.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/14.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation

public extension UIColor {
    
    @objc convenience init(rgb red: CGFloat,_ green: CGFloat,_ blue: CGFloat) {
        self.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1);
    };
    
    @objc convenience init(rgb red: CGFloat,_ green: CGFloat,_ blue: CGFloat,_ alpha: CGFloat) {
        self.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha);
    };
    
    @objc convenience init(hex value: String) {
        var str: String = value.trimmingCharacters(in: .whitespaces).replace(["#":""]),
        rgb: UInt32 = 0;
        switch (str.count != 6) {
        case true: self.init(rgb: 0.5, 0.5, 0.5);
        case false: Scanner(string: str).scanHexInt32(&rgb);
        self.init(rgb: CGFloat((rgb & 0xFF0000) >> 16), CGFloat((rgb & 0x00FF00) >> 8), CGFloat(rgb & 0x0000FF));
        print("rgb", CGFloat(rgb & 0xFF0000), CGFloat((rgb & 0x00FF00) >> 8), CGFloat(rgb & 0x0000FF))
        };
    };
    
    @objc convenience init(hex value: String,_ a: CGFloat) {
        var str: String = value.trimmingCharacters(in: .whitespaces).replace(["#":""]),
        rgb: UInt32 = 0;
        switch (str.count != 6) {
        case true : Scanner(string: str).scanHexInt32(&rgb);
        self.init(rgb: CGFloat((rgb & 0xFF0000) >> 16), CGFloat((rgb & 0x00FF00) >> 8), CGFloat(rgb & 0x0000FF), a);
        case false: self.init(rgb: 0.5, 0.5, 0.5, a);
        };
    };
    
    var _ciColor: CIColor { return CIColor(color: self) };
    var _red: CGFloat { return (self._ciColor.red*255._cgflt) };
    var _green: CGFloat { return (self._ciColor.green*255._cgflt) };
    var _blue: CGFloat { return (self._ciColor.blue*255._cgflt) };
    var _alpha: CGFloat { return (self._ciColor.alpha) };
};
