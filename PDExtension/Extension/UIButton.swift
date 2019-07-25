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
    
    struct colors {
        public var normal: UIColor, highlight: UIColor, disable: UIColor;
        public init(_ normal: UIColor,_ highlight: UIColor,_ disable: UIColor) {
            self.normal    = normal;
            self.highlight = highlight;
            self.disable   = disable;
        };
    };
    
    struct images {
        public var normal: UIImage, highlight: UIImage, disable: UIImage;
        public init(_ normal: UIImage,_ highlight: UIImage,_ disable: UIImage) {
            self.normal    = normal;
            self.highlight = highlight;
            self.disable   = disable;
        };
    };
    
    var _str: String  { return (self.titleLabel?.text ?? "") };
    var _strColor: colors {
        let normal    = (self.titleColor(for: .disabled) ?? .clear);
        let highlight = (self.titleColor(for: .highlighted) ?? .clear);
        let disable   = (self.titleColor(for: .disabled) ?? .clear);
        return colors(normal, highlight, disable);
    }
    var _image: images {
        let normal    = (self.image(for: .normal) ?? UIImage());
        let highlight = (self.image(for: .highlighted) ?? UIImage());
        let disable   = (self.image(for: .disabled) ?? UIImage());
        return images(normal, highlight, disable);
    }
    var _top    : CGFloat { return self.contentEdgeInsets.top };
    var _left   : CGFloat { return self.contentEdgeInsets.left };
    var _bottom : CGFloat { return self.contentEdgeInsets.bottom };
    var _right  : CGFloat { return self.contentEdgeInsets.right };
}

public extension UIButton {
    
    func t(_ value: CGFloat) { self.contentEdgeInsets.top = value };
    func l(_ value: CGFloat) { self.contentEdgeInsets.left = value };
    func b(_ value: CGFloat) { self.contentEdgeInsets.bottom = value };
    func r(_ value: CGFloat) { self.contentEdgeInsets.right = value };
    
    func set(top value: CGFloat) { self.t(value) };
    func set(left value: CGFloat) { self.l(value) };
    func set(bottom value: CGFloat) { self.b(value) };
    func set(right value: CGFloat) { self.r(value) };
    func set(top: CGFloat, left: CGFloat)   { self.t(top); self.l(left) };
    func set(top: CGFloat, bottom: CGFloat) { self.t(top); self.b(bottom) };
    func set(top: CGFloat, right: CGFloat)  { self.t(top); self.r(right) };
    func set(left: CGFloat, bottom: CGFloat) { self.l(left); self.b(bottom) };
    func set(left: CGFloat, right: CGFloat)  { self.l(left); self.r(right) };
    func set(bottom: CGFloat, right: CGFloat)  { self.b(bottom); self.r(right) };
    func set(top: CGFloat, left: CGFloat, bottom: CGFloat) { self.set(padding: top, left, bottom, self._right) };
    func set(top: CGFloat, left: CGFloat, right: CGFloat)  { self.set(padding: top, left, self._bottom, right) };
    func set(top: CGFloat, bottom: CGFloat, right: CGFloat)  { self.set(padding: top, self._left, bottom, right) };
    func set(left: CGFloat, bottom: CGFloat, right: CGFloat)  { self.set(padding: self._top, left, bottom, right) };
    func set(padding top: CGFloat,_ left: CGFloat,_ bottom: CGFloat,_ right: CGFloat) {
        self.contentEdgeInsets = UIEdgeInsets(top, left, bottom, right);
    };
    
    func set(text value: String?,_ state: UIControl.State) { self.setTitle(value, for: state) };
    func set(alignment horizon: UIControl.ContentHorizontalAlignment,_ vertical: UIControl.ContentVerticalAlignment) {
        self.contentHorizontalAlignment = horizon;
        self.contentVerticalAlignment   = vertical;
    };
    func set(breakMode value: NSLineBreakMode) { self.titleLabel?.lineBreakMode = value };
    func set(line value: Int) { self.titleLabel?.numberOfLines = value };
    func set(fitWidth value: Bool) { self.titleLabel?.adjustsFontSizeToFitWidth = value };
    
    func set(font value: UIFont) { self.titleLabel?.font = value };
    func set(font size: CGFloat,_ name: String) { self.titleLabel?.font = UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size) };
    func set(font size: CGFloat,_ weight: UIFont.Weight) { self.titleLabel?.font = .systemFont(ofSize: size, weight: weight) };
    func set(fontItalic size: CGFloat) { self.titleLabel?.font = UIFont.italicSystemFont(ofSize: size) };
    
    func set(textColor value: UIColor?,_ state: UIControl.State) { self.setTitleColor(value, for: state) };
    func set(textColor r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ state: UIControl.State) { self.setTitleColor(UIColor(rgb: r, g, b), for: state) };
    func set(textColor r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat,_ state: UIControl.State) { self.setTitleColor(UIColor(rgb: r, g, b, a), for: state) };
    func set(textColor hex: String,_ state: UIControl.State) { self.setTitleColor(UIColor(hex: hex), for: state) };
    func set(textColor hex: String,_ a: CGFloat,_ state: UIControl.State) { self.setTitleColor(UIColor(hex: hex, a), for: state) };
    
    func set(image value: UIImage?,_ state: UIControl.State) { self.setImage(value, for: state) }
    func set(image url: URL?,_ state: UIControl.State) { get(image: url) { self.set(image: $0, state) } }
    func set(image filename: String,_ state: UIControl.State) { get(image: filename) { self.set(image: $0, state) } }
    
    func set(tapUpIn target: Any?,_ action: Selector) { self.addTarget(target, action: action, for: .touchUpInside) };
    func set(tapUpOut target: Any?,_ action: Selector) { self.addTarget(target, action: action, for: .touchUpOutside) };
    func set(tapDown target: Any?,_ action: Selector) { self.addTarget(target, action: action, for: .touchDown) };
    func set(tapCancel target: Any?,_ action: Selector) { self.addTarget(target, action: action, for: .touchCancel) };

    func set(enable: Bool) { self.isEnabled = enable; self.set(a: enable ? 1 : 0.5) };
    
    func set(attributeText value: String) {
        let newAttributedString = NSMutableAttributedString(attributedString: self.attributedTitle(for: .normal)!)
        newAttributedString.mutableString.setString(value)
        self.setAttributedTitle(newAttributedString, for: .normal)
        //mutableString.setString(value)
    }
};
