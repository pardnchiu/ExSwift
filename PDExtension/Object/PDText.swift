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
        case color;
        case alignment;
        case font;
        case breakMode;
        case line;
    };
    public var key: body, value: Any;
    public init(_ key: body,_ value: Any) {
        self.key   = key;
        self.value = value;
    };
};

public struct PDTextInuptText {
    public enum body {
        case text;
        case color;
        case alignment;
        case placeholder;
        case font;
        case secureTextEntry;
    };
    public var key: body, value: Any;
    public init(_ key: body,_ value: Any) {
        self.key   = key;
        self.value = value;
    };
};

// button text
public func bText(textNormal value: String)    -> PDButtonText { return PDButtonText(.textNormal, value) };
public func bText(textHighlight value: String) -> PDButtonText { return PDButtonText(.textHighlight, value) };
public func bText(textDisable value: String)   -> PDButtonText { return PDButtonText(.textDisable, value) };

public func bText(colorNormal value: UIColor)    -> PDButtonText { return PDButtonText(.colorNormal, value) };
public func bText(colorHighlight value: UIColor) -> PDButtonText { return PDButtonText(.colorHighlight, value) };
public func bText(colorDisable value: UIColor)   -> PDButtonText { return PDButtonText(.colorDisable, value) };

public func bText(colorNormal r: CGFloat,_ g: CGFloat,_ b: CGFloat)    -> PDButtonText { return PDButtonText(.colorNormal, UIColor(rgb: r, g, b)) };
public func bText(colorHighlight r: CGFloat,_ g: CGFloat,_ b: CGFloat) -> PDButtonText { return PDButtonText(.colorHighlight, UIColor(rgb: r, g, b)) };
public func bText(colorDisable r: CGFloat,_ g: CGFloat,_ b: CGFloat)   -> PDButtonText { return PDButtonText(.colorDisable, UIColor(rgb: r, g, b)) };

public func bText(colorNormal r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat)    -> PDButtonText { return PDButtonText(.colorNormal, UIColor(rgb: r, g, b, a)) };
public func bText(colorHighlight r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) -> PDButtonText { return PDButtonText(.colorHighlight, UIColor(rgb: r, g, b, a)) };
public func bText(colorDisable r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat)   -> PDButtonText { return PDButtonText(.colorDisable, UIColor(rgb: r, g, b, a)) };

public func bText(colorNormal hex: String)    -> PDButtonText { return PDButtonText(.colorNormal, UIColor(hex: hex)) };
public func bText(colorHighlight hex: String) -> PDButtonText { return PDButtonText(.colorHighlight, UIColor(hex: hex)) };
public func bText(colorDisable hex: String)   -> PDButtonText { return PDButtonText(.colorDisable, UIColor(hex: hex)) };

public func bText(colorNormal hex: String, a: CGFloat)    -> PDButtonText { return PDButtonText(.colorNormal, UIColor(hex: hex, a)) };
public func bText(colorHighlight hex: String, a: CGFloat) -> PDButtonText { return PDButtonText(.colorHighlight, UIColor(hex: hex, a)) };
public func bText(colorDisable hex: String, a: CGFloat)   -> PDButtonText { return PDButtonText(.colorDisable, UIColor(hex: hex, a)) };

public func bText(font value: UIFont)                         -> PDButtonText { return PDButtonText(.font, value) };
public func bText(font size: CGFloat,_ weight: UIFont.Weight) -> PDButtonText { return PDButtonText(.font, UIFont.systemFont(ofSize: size, weight: weight)) };
public func bText(font size: CGFloat,_ name: String)          -> PDButtonText { return PDButtonText(.font, UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)) };
public func bText(fontItalic size: CGFloat)                   -> PDButtonText { return PDButtonText(.font, UIFont.italicSystemFont(ofSize: size)) };

public func bText(breakMode value: NSLineBreakMode) -> PDButtonText { return PDButtonText(.breakMode, value) };
public func bText(line value: Int)                  -> PDButtonText { return PDButtonText(.line, value) };

// label text
public func lText(text value: String)               -> PDLabelText { return PDLabelText(.text, value) };
public func lText(alignment value: NSTextAlignment) -> PDLabelText { return PDLabelText(.alignment, value) };
public func lText(breakMode value: NSLineBreakMode) -> PDLabelText { return PDLabelText(.breakMode, value) };
public func lText(line value: Int)                  -> PDLabelText { return PDLabelText(.line, value) };

public func lText(color value: UIColor)                                    -> PDLabelText { return PDLabelText(.color, value) };
public func lText(color r: CGFloat,_ g: CGFloat,_ b: CGFloat)              -> PDLabelText { return PDLabelText(.color, UIColor(rgb: r, g, b)) };
public func lText(color r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) -> PDLabelText { return PDLabelText(.color, UIColor(rgb: r, g, b, a)) };
public func lText(color hex: String)                                       -> PDLabelText { return PDLabelText(.color, UIColor(hex: hex)) };
public func lText(color hex: String, a: CGFloat)                           -> PDLabelText { return PDLabelText(.color, UIColor(hex: hex, a)) };

public func lText(font value: UIFont)                         -> PDLabelText { return PDLabelText(.font, value) };
public func lText(font size: CGFloat,_ weight: UIFont.Weight) -> PDLabelText { return PDLabelText(.font, UIFont.systemFont(ofSize: size, weight: weight)) };
public func lText(font size: CGFloat,_ name: String)          -> PDLabelText { return PDLabelText(.font, UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)) };
public func lText(fontItalic size: CGFloat)                   -> PDLabelText { return PDLabelText(.font, UIFont.italicSystemFont(ofSize: size)) };

// fextfield text, textview text
public func iText(text value: String)               -> PDTextInuptText { return PDTextInuptText(.text, value) };
public func iText(alignment value: NSTextAlignment) -> PDTextInuptText { return PDTextInuptText(.alignment, value) };
public func iText(placeholder value: String)        -> PDTextInuptText { return PDTextInuptText(.placeholder, value) };
public func iText(secureTextEntry value: Bool)      -> PDTextInuptText { return PDTextInuptText(.secureTextEntry, value) };

public func iText(color value: UIColor)                                    -> PDTextInuptText { return PDTextInuptText(.color, value) };
public func iText(color r: CGFloat,_ g: CGFloat,_ b: CGFloat)              -> PDTextInuptText { return PDTextInuptText(.color, UIColor(rgb: r, g, b)) };
public func iText(color r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) -> PDTextInuptText { return PDTextInuptText(.color, UIColor(rgb: r, g, b, a)) };
public func iText(color hex: String)                                       -> PDTextInuptText { return PDTextInuptText(.color, UIColor(hex: hex)) };
public func iText(color hex: String, a: CGFloat)                           -> PDTextInuptText { return PDTextInuptText(.color, UIColor(hex: hex, a)) };

public func iText(font value: UIFont)                         -> PDTextInuptText { return PDTextInuptText(.font, value) };
public func iText(font size: CGFloat,_ weight: UIFont.Weight) -> PDTextInuptText { return PDTextInuptText(.font, UIFont.systemFont(ofSize: size, weight: weight)) };
public func iText(font size: CGFloat,_ name: String)          -> PDTextInuptText { return PDTextInuptText(.font, UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)) };
public func iText(fontItalic size: CGFloat)                   -> PDTextInuptText { return PDTextInuptText(.font, UIFont.italicSystemFont(ofSize: size)) };

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
            switch ($0.key) {
            case .text     : if let value = $0.value as? String { self.text = value };
            case .color    : if let value = $0.value as? UIColor { self.textColor = value };
            case .alignment: if let value = $0.value as? NSTextAlignment { self.textAlignment = value };
            case .breakMode: if let value = $0.value as? NSLineBreakMode { self.lineBreakMode = value };
            case .font     : if let value = $0.value as? UIFont { self.font = value };
            case .line     : if let value = $0.value as? Int { self.numberOfLines = value };
            };
        };
    };
};

public extension UITextField {
    func PDText(_ values: [PDTextInuptText]) {
        values.forEach {
            switch ($0.key) {
            case .text               : if let value = $0.value as? String { self.text = value };
            case .color              : if let value = $0.value as? UIColor { self.textColor = value };
            case .alignment          : if let value = $0.value as? NSTextAlignment { self.textAlignment = value };
            case .font               : if let value = $0.value as? UIFont { self.font = value };
            case .placeholder        : if let value = $0.value as? String { self.placeholder = value };
            case .secureTextEntry    : if let value = $0.value as? Bool { self.isSecureTextEntry = value };
            };
        };
    };
};

public extension UITextView {
    func PDText(_ values: [PDTextInuptText]) {
        values.forEach {
            switch $0.key {
            case .text               : if let value = $0.value as? String { self.text = value };
            case .color              : if let value = $0.value as? UIColor { self.textColor = value };
            case .alignment          : if let value = $0.value as? NSTextAlignment { self.textAlignment = value };
            case .font               : if let value = $0.value as? UIFont { self.font = value };
            case .placeholder        : break;
            case .secureTextEntry    : if let value = $0.value as? Bool { self.isSecureTextEntry = value };
            };
        };
    };
};
