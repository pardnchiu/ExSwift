//
//  PDText.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension PD {
    
    struct bText {
        public enum body {
            case textNormal
            case textHighlight
            case textDisable
            case colorNormal
            case colorHighlight
            case colorDisable
            case font
            case breakMode
            case line
        }
        public var  key: body, value: Any;
        public init(key: body, value: Any) {
            self.key   = key
            self.value = value;
        };
    };
    
    struct lText {
        public enum body {
            case text
            case color
            case font
            case breakMode
            case line
            case alignment
        }
        public var  key: body, value: Any
        public init(key: body, value: Any) {
            self.key   = key
            self.value = value;
        };
    };
};

public func bText(textNormal value: String)      -> PD.bText { return PD.bText(key: .textNormal, value: value) };
public func bText(textHighlight value: String)   -> PD.bText { return PD.bText(key: .textHighlight, value: value) };
public func bText(textDisable value: String)     -> PD.bText { return PD.bText(key: .textDisable, value: value) };
public func bText(colorNormal value: UIColor)    -> PD.bText { return PD.bText(key: .colorNormal, value: value) };
public func bText(colorHighlight value: UIColor) -> PD.bText { return PD.bText(key: .colorHighlight, value: value) };
public func bText(colorDisable value: UIColor)   -> PD.bText { return PD.bText(key: .colorDisable, value: value) };
public func bText(font value: UIFont)            -> PD.bText { return PD.bText(key: .font, value: value) };
public func bText(breakMode value: UIFont)       -> PD.bText { return PD.bText(key: .breakMode, value: value) };
public func bText(line value: UIFont)            -> PD.bText { return PD.bText(key: .line, value: value) };

public extension UIButton {
    
    func text(_ values: [PD.bText]) {
        values.forEach {
            switch $0.key {
            case .textNormal    : if let value = $0.value as? String { self.setTitle(value, for: .normal) };
            case .textHighlight : if let value = $0.value as? String { self.setTitle(value, for: .highlighted) };
            case .textDisable   : if let value = $0.value as? String { self.setTitle(value, for: .disabled) };
            case .colorNormal   : if let value = $0.value as? UIColor { self.setTitleColor(value, for: .normal) };
            case .colorHighlight: if let value = $0.value as? UIColor { self.setTitleColor(value, for: .highlighted) };
            case .colorDisable  : if let value = $0.value as? UIColor { self.setTitleColor(value, for: .disabled) };
            case .font          : if let value = $0.value as? UIFont { self.titleLabel?.font = value };
            case .breakMode     : if let value = $0.value as? NSLineBreakMode { self.titleLabel?.lineBreakMode = value };
            case .line          : if let value = $0.value as? Int { self.titleLabel?.numberOfLines = value };
            };
        };
    };
};

public func lText(text value: String)               -> PD.lText { return PD.lText(key: .text, value: value) };
public func lText(color value: UIColor)             -> PD.lText { return PD.lText(key: .color, value: value) };
public func lText(font value: UIFont)               -> PD.lText { return PD.lText(key: .font, value: value) };
public func lText(breakMode value: NSLineBreakMode) -> PD.lText { return PD.lText(key: .breakMode, value: value) };
public func lText(line value: Int)                  -> PD.lText { return PD.lText(key: .line, value: value) };
public func lText(alignment value: NSTextAlignment) -> PD.lText { return PD.lText(key: .alignment, value: value) };

public extension UILabel {
    
    func text(_ values: [PD.lText]) {
        values.forEach {
            switch $0.key {
            case .text     : if let value = $0.value as? String { self.text = value };
            case .color    : if let value = $0.value as? UIColor { self.textColor = value };
            case .font     : if let value = $0.value as? UIFont { self.font = value };
            case .breakMode: if let value = $0.value as? NSLineBreakMode { self.lineBreakMode = value };
            case .line     : if let value = $0.value as? Int { self.numberOfLines = value };
            case .alignment: if let value = $0.value as? NSTextAlignment { self.textAlignment = value };
            }
        }
    }
}
