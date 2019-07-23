//
//  PDAttributed.swift
//  PDExtension
//
//  Created by Pardn Co., Ltd on 2019/6/9.
//  Copyright © 2016-2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public struct PDAttributed {
    public enum body {
        case text;
        case color;
        case alignment;        // 對齊
        case font;
        case charSpacing;
        case line;
        case lineBreakMode;    // 斷行
        case lineSpacing;      // 行間距
        case lineMinHeight;    // 最低行高
        case lineMaxHeight;    // 最高行高
        case paragraphSpacing; // 段间距
        case firstLineIndent;  // 首行縮進
        case headIndent;       // 整體縮進
        case tailIndent;
        case direction;        // 書寫方向
    };
    public var key: body, value: Any
    public init(_ key: body,_ value: Any) {
        self.key   = key;
        self.value = value;
    };
};
public func aText(text value: String) -> PDAttributed { return PDAttributed(.text, value) };
public func aText(color value: UIColor)                                    -> PDAttributed { return PDAttributed(.color, value) };
public func aText(color r: CGFloat,_ g: CGFloat,_ b: CGFloat)              -> PDAttributed { return PDAttributed(.color, UIColor(rgb: r, g, b)) };
public func aText(color r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) -> PDAttributed { return PDAttributed(.color, UIColor(rgb: r, g, b, a)) };
public func aText(color hex: String)                                       -> PDAttributed { return PDAttributed(.color, UIColor(hex: hex)) };
public func aText(color hex: String, a: CGFloat)                           -> PDAttributed { return PDAttributed(.color, UIColor(hex: hex, a)) };
public func aText(alignment value: NSTextAlignment)     -> PDAttributed { return PDAttributed(.alignment, value) };
public func aText(font value: UIFont)                         -> PDAttributed { return PDAttributed(.font, value) };
public func aText(font size: CGFloat,_ name: String)          -> PDAttributed { return PDAttributed(.font, UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)) };
public func aText(font size: CGFloat,_ weight: UIFont.Weight) -> PDAttributed { return PDAttributed(.font, UIFont.systemFont(ofSize: size, weight: weight)) };
public func aText(fontItalic size: CGFloat)                   -> PDAttributed { return PDAttributed(.font, UIFont.italicSystemFont(ofSize: size)) };
public func aText(line value: Int)                      -> PDAttributed { return PDAttributed(.line, value) };
public func aText(charSpacing value: Float)             -> PDAttributed { return PDAttributed(.charSpacing, value) };
public func aText(lineBreakMode value: NSLineBreakMode) -> PDAttributed { return PDAttributed(.lineBreakMode, value) };
public func aText(lineSpacing value: CGFloat)           -> PDAttributed { return PDAttributed(.lineSpacing, value) };
public func aText(lineMinHeight value: CGFloat)         -> PDAttributed { return PDAttributed(.lineMinHeight, value) };
public func aText(lineMaxHeight value: CGFloat)         -> PDAttributed { return PDAttributed(.lineMaxHeight, value) };
public func aText(paragraphSpacing value: CGFloat)      -> PDAttributed { return PDAttributed(.paragraphSpacing, value) };
public func aText(firstLineIndent value: CGFloat)       -> PDAttributed { return PDAttributed(.firstLineIndent, value) };
public func aText(headIndent value: CGFloat)            -> PDAttributed { return PDAttributed(.headIndent, value) };
public func aText(tailIndent value: CGFloat)            -> PDAttributed { return PDAttributed(.tailIndent, value) };
public func aText(direction value: NSWritingDirection)  -> PDAttributed { return PDAttributed(.direction, value) };

public func PDAttrbutedString(_ values: [PDAttributed]) -> NSAttributedString {
    var attributes: [NSAttributedString.Key:Any] = [:];
    var text: String = "";
    let style = NSMutableParagraphStyle().set { (style) in
        values.forEach {
            switch $0.key {
            case .text            : if let value = $0.value as? String { text = value };
            case .color           : if let value = $0.value as? UIColor { attributes[NSAttributedString.Key.foregroundColor] = value };
            case .charSpacing     : if let value = $0.value as? Float { attributes[NSAttributedString.Key.kern] = value };
            case .alignment       : if let value = $0.value as? NSTextAlignment { style.alignment = value };
            case .font            : if let value = $0.value as? UIFont { attributes[NSAttributedString.Key.font] = value };
            case .line            : break;
            case .lineBreakMode   : if let value = $0.value as? NSLineBreakMode { style.lineBreakMode = value };
            case .lineSpacing     : if let value = $0.value as? CGFloat { style.lineSpacing = value };
            case .lineMinHeight   : if let value = $0.value as? CGFloat { style.minimumLineHeight = value };
            case .lineMaxHeight   : if let value = $0.value as? CGFloat { style.maximumLineHeight = value };
            case .paragraphSpacing: if let value = $0.value as? CGFloat { style.paragraphSpacing = value };
            case .firstLineIndent : if let value = $0.value as? CGFloat { style.firstLineHeadIndent = value };
            case .headIndent      : if let value = $0.value as? CGFloat { style.headIndent = value };
            case .tailIndent      : if let value = $0.value as? CGFloat { style.tailIndent = value };
            case .direction       : if let value = $0.value as? NSWritingDirection { style.baseWritingDirection = value };
            };
        };
    };
    attributes[NSAttributedString.Key.paragraphStyle] = style;
    return NSAttributedString(string: text, attributes: attributes);
}

public extension NSAttributedString {
    
//    func set(text: String) -> NSAttributedString {
//        let new = NSMutableAttributedString(attributedString: self)
//        let str = new.string
//        new.mutableString.setString(new.string+str)
//        return new
//    }
}

public extension UIButton {
    func PDAttributed(normal values: [PDAttributed]) {
        self.setAttributedTitle(PDAttrbutedString(values), for: .normal)
        let ary = values.filter { return $0.key == .line }
        if !(ary.isEmpty), let int = ary[0].value as? Int {
            self.titleLabel?.numberOfLines = int;
        };
    };
    func PDAttributed(highlight values: [PDAttributed]) {
        self.setAttributedTitle(PDAttrbutedString(values), for: .highlighted)
        let ary = values.filter { return $0.key == .line }
        if !(ary.isEmpty), let int = ary[0].value as? Int {
            self.titleLabel?.numberOfLines = int;
        };
    };
    func PDAttributed(disabled values: [PDAttributed]) {
        self.setAttributedTitle(PDAttrbutedString(values), for: .disabled);
        let ary = values.filter { return $0.key == .line }
        if !(ary.isEmpty), let int = ary[0].value as? Int {
            self.titleLabel?.numberOfLines = int;
        };
    };
};

public extension UILabel {
    func PDAttributed(_ values: [PDAttributed]) {
        self.attributedText = PDAttrbutedString(values)
        let ary = values.filter { return $0.key == .line }
        if !(ary.isEmpty), let int = ary[0].value as? Int {
            self.numberOfLines = int;
        };
        let ary2 = values.filter { return $0.key == .alignment }
        if !(ary2.isEmpty), let alignment = ary2[0].value as? NSTextAlignment {
            self.textAlignment = alignment
        };
    };
    
    func PDAttributed(text str: String) {
        guard let target = self.attributedText else { print("nil"); return }
        let new = NSMutableAttributedString(attributedString: target)
        new.mutableString.setString(str)
        self.attributedText = new
        //mutableString.setString(value)
    }
    
    func set(attributeTextColor value: UIColor) {
        let new = NSMutableAttributedString(attributedString: self.attributedText!)
        let str = new.string
        new.addAttribute(NSAttributedString.Key.foregroundColor, value: value , range: (str as NSString).range(of: str))
        self.attributedText = new
        //mutableString.setString(value)
    }
};

public extension UITextField {
    func PDAttributed(txt values: [PDAttributed]) {
        self.attributedText = PDAttrbutedString(values)
        let ary = values.filter { return $0.key == .alignment }
        if !(ary.isEmpty), let alignment = ary[0].value as? NSTextAlignment {
            self.textAlignment = alignment
        };
    };
    func PDAttributed(phd values: [PDAttributed]) {
        self.attributedPlaceholder = PDAttrbutedString(values)
        let ary = values.filter { return $0.key == .alignment }
        if !(ary.isEmpty), let alignment = ary[0].value as? NSTextAlignment {
            self.textAlignment = alignment
        };
    };
    
    func PDAttributed(text str: String) {
        guard let target = self.attributedText else { print("nil"); return }
        let new = NSMutableAttributedString(attributedString: target)
        new.mutableString.setString(str)
        self.attributedText = new
        //mutableString.setString(value)
    }
};

public extension UITextView {
    func PDAttributed(values: [PDAttributed]) {
        self.attributedText = PDAttrbutedString(values)
        let ary = values.filter { return $0.key == .alignment }
        if !(ary.isEmpty), let alignment = ary[0].value as? NSTextAlignment {
            self.textAlignment = alignment
        };
    };
    
    func PDAttributed(text str: String) {
        guard let target = self.attributedText else { print("nil"); return }
        let new = NSMutableAttributedString(attributedString: target)
        new.mutableString.setString(str)
        self.attributedText = new
        //mutableString.setString(value)
    }
};
