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
    
    var _text: String  { return (self.titleLabel?.text ?? "") };
    var _textColor: colors {
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
}

public extension UIButton {
    
    func set(enable: Bool) { self.isEnabled = enable };
    
    func set(text value: String?,_ state: UIControl.State) { self.setTitle(value, for: state) };
    func set(alignment horizon: UIControl.ContentHorizontalAlignment,_ vertical: UIControl.ContentVerticalAlignment) {
        self.contentHorizontalAlignment = horizon;
        self.contentVerticalAlignment   = vertical;
    };
    func set(breakMode value: NSLineBreakMode) { self.titleLabel?.lineBreakMode = value };
    func set(font value: CGFloat,_ weight: UIFont.Weight) { self.titleLabel?.font = .systemFont(ofSize: value, weight: weight) };
    func set(line value: Int) { self.titleLabel?.numberOfLines = value };
    func set(fitWidth value: Bool) { self.titleLabel?.adjustsFontSizeToFitWidth = value };
    
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
};
