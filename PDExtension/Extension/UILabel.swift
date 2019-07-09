//
//  UILabel.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UILabel {
    
    var _text: String { return (self.text ?? "") };
    var _textColor: UIColor { return (self.textColor) };
};

public extension UILabel {
    
    @objc func padding(_ t: CGFloat,_ l: CGFloat,_ b: CGFloat,_ r: CGFloat) {
        let inset = UIEdgeInsets(top: t, left: l, bottom: b, right: r);
        self.frame = self.frame.inset(by: inset);
    };
    
    func clear() { self.text = nil };
    
    func set(text value: String) { self.text = value };
    func set(textColor value: UIColor) { self.textColor = value };
    func set(textColor r: CGFloat,_ g: CGFloat,_ b: CGFloat) { self.textColor = UIColor(rgb: r, g, b) };
    func set(textColor r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) { self.textColor = UIColor(rgb: r, g, b, a) };
    func set(textColor hex: String) { self.textColor = UIColor(hex: hex) };
    func set(textColor hex: String,_ a: CGFloat) { self.textColor = UIColor(hex: hex, a) };
    func set(textAlignment value: NSTextAlignment) { self.textAlignment = value };
    func set(font value: UIFont) { self.font = value };
    func set(font size: CGFloat,_ weight: UIFont.Weight) { self.font = .systemFont(ofSize: size, weight: weight) };
    func set(breakMode value: NSLineBreakMode) { self.lineBreakMode = value };
    func set(line value: Int) { self.numberOfLines = value };
    func set(fitWidth value: Bool) { self.adjustsFontSizeToFitWidth = value };
};
