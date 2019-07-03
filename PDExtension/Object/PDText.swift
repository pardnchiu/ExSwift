//
//  PDText.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public struct PDButtonText {
    public enum body {
        case textNormal;
        case textHighlight;
        case textDisable;
        case colorNormal;
        case colorHighlight;
        case colorDisable;
        case font;
        case breakMode;
        case line;
    }
    public var key: body, value: Any;
    public init(_ key: body,_ value: Any) {
        self.key   = key;
        self.value = value;
    };
};

public struct PDLabelText {
    public enum body {
        case text;
        case textColor;
        case font;
        case breakMode;
        case line;
        case textAlignment;
    };
    public var key: body, value: Any;
    public init(_ key: body,_ value: Any) {
        self.key   = key;
        self.value = value;
    };
};

public func bText(textNormal value: String)      -> PDButtonText { return PDButtonText(.textNormal, value) };
public func bText(textHighlight value: String)   -> PDButtonText { return PDButtonText(.textHighlight, value) };
public func bText(textDisable value: String)     -> PDButtonText { return PDButtonText(.textDisable, value) };
public func bText(colorNormal value: UIColor)    -> PDButtonText { return PDButtonText(.colorNormal, value) };
public func bText(colorHighlight value: UIColor) -> PDButtonText { return PDButtonText(.colorHighlight, value) };
public func bText(colorDisable value: UIColor)   -> PDButtonText { return PDButtonText(.colorDisable, value) };
public func bText(breakMode value: UIFont)       -> PDButtonText { return PDButtonText(.breakMode, value) };
public func bText(font value: UIFont)            -> PDButtonText { return PDButtonText(.font, value) };
public func bText(line value: UIFont)            -> PDButtonText { return PDButtonText(.line, value) };

public func lText(text value: String)                   -> PDLabelText { return PDLabelText(.text, value) };
public func lText(textColor value: UIColor)             -> PDLabelText { return PDLabelText(.textColor, value) };
public func lText(textAlignment value: NSTextAlignment) -> PDLabelText { return PDLabelText(.textAlignment, value) };
public func lText(breakMode value: NSLineBreakMode)     -> PDLabelText { return PDLabelText(.breakMode, value) };
public func lText(font value: UIFont)                   -> PDLabelText { return PDLabelText(.font, value) };
public func lText(line value: Int)                      -> PDLabelText { return PDLabelText(.line, value) };

public extension UIButton {
    func PDText(_ values: [PDButtonText]) {
        values.forEach {
            switch $0.key {
            case .textNormal    : if let value = $0.value as? String { self.setTitle(value, for: .normal) };
            case .textHighlight : if let value = $0.value as? String { self.setTitle(value, for: .highlighted) };
            case .textDisable   : if let value = $0.value as? String { self.setTitle(value, for: .disabled) };
            case .colorNormal   : if let value = $0.value as? UIColor { self.setTitleColor(value, for: .normal) };
            case .colorHighlight: if let value = $0.value as? UIColor { self.setTitleColor(value, for: .highlighted) };
            case .colorDisable  : if let value = $0.value as? UIColor { self.setTitleColor(value, for: .disabled) };
            case .breakMode     : if let value = $0.value as? NSLineBreakMode { self.titleLabel?.lineBreakMode = value };
            case .font          : if let value = $0.value as? UIFont { self.titleLabel?.font = value };
            case .line          : if let value = $0.value as? Int { self.titleLabel?.numberOfLines = value };
            };
        };
    };
};

public extension UILabel {
    func PDText(_ values: [PDLabelText]) {
        values.forEach {
            switch $0.key {
            case .text         : if let value = $0.value as? String { self.text = value };
            case .textColor    : if let value = $0.value as? UIColor { self.textColor = value };
            case .textAlignment: if let value = $0.value as? NSTextAlignment { self.textAlignment = value };
            case .breakMode    : if let value = $0.value as? NSLineBreakMode { self.lineBreakMode = value };
            case .font         : if let value = $0.value as? UIFont { self.font = value };
            case .line         : if let value = $0.value as? Int { self.numberOfLines = value };
            };
        };
    };
};

public extension UITextField {
    func PDText(_ values: [PDLabelText]) {
        values.forEach {
            switch $0.key {
            case .text         : if let value = $0.value as? String { self.text = value };
            case .textColor    : if let value = $0.value as? UIColor { self.textColor = value };
            case .textAlignment: if let value = $0.value as? NSTextAlignment { self.textAlignment = value };
            case .font         : if let value = $0.value as? UIFont { self.font = value };
            default: break;
            };
        };
    };
};

public extension UITextView {
    func PDText(_ values: [PDLabelText]) {
        values.forEach {
            switch $0.key {
            case .text         : if let value = $0.value as? String { self.text = value };
            case .textColor    : if let value = $0.value as? UIColor { self.textColor = value };
            case .textAlignment: if let value = $0.value as? NSTextAlignment { self.textAlignment = value };
            case .font         : if let value = $0.value as? UIFont { self.font = value };
            default: break;
            };
        };
    };
};
