//
//  PDAttrbuted.swift
//  PDExtension
//
//  Created by Pardn Co., Ltd on 2019/6/9.
//  Copyright © 2016-2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public class PD {
    
    public enum paragraph {
        case textAlignment;       // 對齊
        case lineBreakMode;       // 斷行
        case lineSpacing;         // 行間距
        case lineMinHeight;       // 最低行高
        case lineMaxHeight;       // 最高行高
        case paragraphSpacing;    // 段间距
        case firstLineHeadIndent; // 首行縮進
        case headIndent;          // 整體縮進
        case tailIndent;
        case writingDirection;    // 書寫方向
    };
    
    public enum attribute {
        case font;
        case textColor;
        case charSpacing;
    };
    
    public enum attrbutee {
        case text;
        
        case font;
        case textColor;
        case charSpacing;
        
        case textAlignment;       // 對齊
        case lineBreakMode;       // 斷行
        case lineSpacing;         // 行間距
        case lineMinHeight;       // 最低行高
        case lineMaxHeight;       // 最高行高
        case paragraphSpacing;    // 段间距
        case firstLineHeadIndent; // 首行縮進
        case headIndent;          // 整體縮進
        case tailIndent;
        case writingDirection;    // 書寫方向
    }
    
    public struct separator {
        public var color: UIColor?, left: CGFloat, right: CGFloat;
        public init(_ color: UIColor?,_ left: CGFloat,_ right: CGFloat) {
            self.color = color;
            self.left  = left;
            self.right = right;
        }
    }
    
    public struct attrbutedText {
        public var key: attrbutee, value: Any
        public init(key: attrbutee, value: Any) {
            self.key   = key;
            self.value = value;
        };
    };
};

public func aText(text value: String) -> PD.attrbutedText { return PD.attrbutedText(key: .text, value: value) };

public func aText(font value: UIFont) -> PD.attrbutedText { return PD.attrbutedText(key: .font, value: value) };
public func aText(color value: UIColor) -> PD.attrbutedText { return PD.attrbutedText(key: .textColor, value: value) };
public func aText(charSpacing value: Float) -> PD.attrbutedText { return PD.attrbutedText(key: .charSpacing, value: value) };
public func aText(alignment value: NSTextAlignment) -> PD.attrbutedText { return PD.attrbutedText(key: .textAlignment, value: value) };

public func aText(lineBreakMode value: NSLineBreakMode) -> PD.attrbutedText { return PD.attrbutedText(key: .lineBreakMode, value: value) };
public func aText(lineSpacing value: CGFloat) -> PD.attrbutedText { return PD.attrbutedText(key: .lineSpacing, value: value) };
public func aText(lineMinHeight value: CGFloat) -> PD.attrbutedText { return PD.attrbutedText(key: .lineMinHeight, value: value) };
public func aText(lineMaxHeight value: CGFloat) -> PD.attrbutedText { return PD.attrbutedText(key: .lineMaxHeight, value: value) };
public func aText(paragraphSpacing value: CGFloat) -> PD.attrbutedText { return PD.attrbutedText(key: .paragraphSpacing, value: value) };
public func aText(firstLineHeadIndent value: CGFloat) -> PD.attrbutedText { return PD.attrbutedText(key: .firstLineHeadIndent, value: value) };
public func aText(headIndent value: CGFloat) -> PD.attrbutedText { return PD.attrbutedText(key: .headIndent, value: value) };
public func aText(tailIndent value: CGFloat) -> PD.attrbutedText { return PD.attrbutedText(key: .tailIndent, value: value) };
public func aText(writingDirection value: NSWritingDirection) -> PD.attrbutedText { return PD.attrbutedText(key: .writingDirection, value: value) };

public func PDParagraphs(_ dic: [PD.paragraph:Any]) -> NSMutableParagraphStyle {
    let style = NSMutableParagraphStyle().set { (style) in
        dic.forEach {
            switch $0.key {
            case .textAlignment      : if let value = $0.value as? NSTextAlignment { style.alignment = value };
            case .lineBreakMode      : if let value = $0.value as? NSLineBreakMode { style.lineBreakMode = value };
            case .lineSpacing        : if let value = $0.value as? CGFloat { style.lineSpacing = value };
            case .lineMinHeight      : if let value = $0.value as? CGFloat { style.minimumLineHeight = value };
            case .lineMaxHeight      : if let value = $0.value as? CGFloat { style.maximumLineHeight = value };
            case .paragraphSpacing   : if let value = $0.value as? CGFloat { style.paragraphSpacing = value };
            case .firstLineHeadIndent: if let value = $0.value as? CGFloat { style.firstLineHeadIndent = value };
            case .headIndent         : if let value = $0.value as? CGFloat { style.headIndent = value };
            case .tailIndent         : if let value = $0.value as? CGFloat { style.tailIndent = value };
            case .writingDirection   : if let value = $0.value as? NSWritingDirection { style.baseWritingDirection = value };
            };
        };
    };
    return style
};

public func PDAttributes(_ dic: [PD.attribute:Any]) -> [NSAttributedString.Key:Any] {
    var attr: [NSAttributedString.Key:Any] = [:];
    dic.forEach {
        switch ($0.key) {
        case .font       : if let value = $0.value as? UIFont { attr[NSAttributedString.Key.font] = value };
        case .textColor  : if let value = $0.value as? UIColor { attr[NSAttributedString.Key.foregroundColor] = value };
        case .charSpacing: if let value = $0.value as? Float { attr[NSAttributedString.Key.kern] = value };
        };
    };
    return attr
};

public extension UIButton {
    
    func attrbuted(_ text: String,_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) {
        var attributes = attributes;
        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
        self.setAttributedTitle(NSAttributedString(string: text, attributes: attributes), for: .normal);
    };
    
    func attrbuted(_ values: [PD.attrbutedText]) {
        var attr: [NSAttributedString.Key:Any] = [:];
        var text: String = ""
        let style = NSMutableParagraphStyle().set { (style) in
            values.forEach {
                switch $0.key {
                case .text       : if let value = $0.value as? String { text = value };
                    
                case .font       : if let value = $0.value as? UIFont { attr[NSAttributedString.Key.font] = value };
                case .textColor  : if let value = $0.value as? UIColor { attr[NSAttributedString.Key.foregroundColor] = value };
                case .charSpacing: if let value = $0.value as? Float { attr[NSAttributedString.Key.kern] = value };
                    
                case .textAlignment      : if let value = $0.value as? NSTextAlignment { style.alignment = value };
                case .lineBreakMode      : if let value = $0.value as? NSLineBreakMode { style.lineBreakMode = value };
                case .lineSpacing        : if let value = $0.value as? CGFloat { style.lineSpacing = value };
                case .lineMinHeight      : if let value = $0.value as? CGFloat { style.minimumLineHeight = value };
                case .lineMaxHeight      : if let value = $0.value as? CGFloat { style.maximumLineHeight = value };
                case .paragraphSpacing   : if let value = $0.value as? CGFloat { style.paragraphSpacing = value };
                case .firstLineHeadIndent: if let value = $0.value as? CGFloat { style.firstLineHeadIndent = value };
                case .headIndent         : if let value = $0.value as? CGFloat { style.headIndent = value };
                case .tailIndent         : if let value = $0.value as? CGFloat { style.tailIndent = value };
                case .writingDirection   : if let value = $0.value as? NSWritingDirection { style.baseWritingDirection = value };
                }
            }
        };
        attr[NSAttributedString.Key.paragraphStyle] = style;
        self.setAttributedTitle(NSAttributedString(string: text, attributes: attr), for: .normal);
    }
};

public extension UILabel {
    
//    func attrbuted(_ text: String,_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) {
//        var attributes = attributes;
//        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
//        self.attributedText = NSAttributedString(string: text, attributes: attributes);
//    };
    
    func PDAttrbuted(_ values: [PD.attrbutedText]) {
        var attr: [NSAttributedString.Key:Any] = [:];
        var text: String = ""
        let style = NSMutableParagraphStyle().set { (style) in
            values.forEach {
                switch $0.key {
                case .text       : if let value = $0.value as? String { text = value };
                    
                case .font       : if let value = $0.value as? UIFont { attr[NSAttributedString.Key.font] = value };
                case .textColor  : if let value = $0.value as? UIColor { attr[NSAttributedString.Key.foregroundColor] = value };
                case .charSpacing: if let value = $0.value as? Float { attr[NSAttributedString.Key.kern] = value };
                    
                case .textAlignment      : if let value = $0.value as? NSTextAlignment { style.alignment = value };
                case .lineBreakMode      : if let value = $0.value as? NSLineBreakMode { style.lineBreakMode = value };
                case .lineSpacing        : if let value = $0.value as? CGFloat { style.lineSpacing = value };
                case .lineMinHeight      : if let value = $0.value as? CGFloat { style.minimumLineHeight = value };
                case .lineMaxHeight      : if let value = $0.value as? CGFloat { style.maximumLineHeight = value };
                case .paragraphSpacing   : if let value = $0.value as? CGFloat { style.paragraphSpacing = value };
                case .firstLineHeadIndent: if let value = $0.value as? CGFloat { style.firstLineHeadIndent = value };
                case .headIndent         : if let value = $0.value as? CGFloat { style.headIndent = value };
                case .tailIndent         : if let value = $0.value as? CGFloat { style.tailIndent = value };
                case .writingDirection   : if let value = $0.value as? NSWritingDirection { style.baseWritingDirection = value };
                }
            }
        };
        attr[NSAttributedString.Key.paragraphStyle] = style;
        self.attributedText = NSAttributedString(string: text, attributes: attr);
    };
};

public extension UITextField {
    
//    func attrbuted(txt text: String,_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) {
//        var attributes = attributes;
//        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
//        self.attributedText = NSAttributedString(string: text, attributes: attributes);
//    };
    
//    func attrbuted(phd text: String,_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) {
//        var attributes = attributes;
//        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
//        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes);
//    };
    
    func PDAttrbuted(txt values: [PD.attrbutedText]) {
        var attr: [NSAttributedString.Key:Any] = [:];
        var text: String = ""
        let style = NSMutableParagraphStyle().set { (style) in
            values.forEach {
                switch $0.key {
                case .text       : if let value = $0.value as? String { text = value };
                    
                case .font       : if let value = $0.value as? UIFont { attr[NSAttributedString.Key.font] = value };
                case .textColor  : if let value = $0.value as? UIColor { attr[NSAttributedString.Key.foregroundColor] = value };
                case .charSpacing: if let value = $0.value as? Float { attr[NSAttributedString.Key.kern] = value };
                    
                case .textAlignment      : if let value = $0.value as? NSTextAlignment { style.alignment = value };
                case .lineBreakMode      : if let value = $0.value as? NSLineBreakMode { style.lineBreakMode = value };
                case .lineSpacing        : if let value = $0.value as? CGFloat { style.lineSpacing = value };
                case .lineMinHeight      : if let value = $0.value as? CGFloat { style.minimumLineHeight = value };
                case .lineMaxHeight      : if let value = $0.value as? CGFloat { style.maximumLineHeight = value };
                case .paragraphSpacing   : if let value = $0.value as? CGFloat { style.paragraphSpacing = value };
                case .firstLineHeadIndent: if let value = $0.value as? CGFloat { style.firstLineHeadIndent = value };
                case .headIndent         : if let value = $0.value as? CGFloat { style.headIndent = value };
                case .tailIndent         : if let value = $0.value as? CGFloat { style.tailIndent = value };
                case .writingDirection   : if let value = $0.value as? NSWritingDirection { style.baseWritingDirection = value };
                }
            }
        };
        attr[NSAttributedString.Key.paragraphStyle] = style;
        self.attributedText = NSAttributedString(string: text, attributes: attr);
    };
    
    func PDAttrbuted(phd values: [PD.attrbutedText]) {
        var attr: [NSAttributedString.Key:Any] = [:];
        var text: String = ""
        let style = NSMutableParagraphStyle().set { (style) in
            values.forEach {
                switch $0.key {
                case .text       : if let value = $0.value as? String { text = value };
                    
                case .font       : if let value = $0.value as? UIFont { attr[NSAttributedString.Key.font] = value };
                case .textColor  : if let value = $0.value as? UIColor { attr[NSAttributedString.Key.foregroundColor] = value };
                case .charSpacing: if let value = $0.value as? Float { attr[NSAttributedString.Key.kern] = value };
                    
                case .textAlignment      : if let value = $0.value as? NSTextAlignment { style.alignment = value };
                case .lineBreakMode      : if let value = $0.value as? NSLineBreakMode { style.lineBreakMode = value };
                case .lineSpacing        : if let value = $0.value as? CGFloat { style.lineSpacing = value };
                case .lineMinHeight      : if let value = $0.value as? CGFloat { style.minimumLineHeight = value };
                case .lineMaxHeight      : if let value = $0.value as? CGFloat { style.maximumLineHeight = value };
                case .paragraphSpacing   : if let value = $0.value as? CGFloat { style.paragraphSpacing = value };
                case .firstLineHeadIndent: if let value = $0.value as? CGFloat { style.firstLineHeadIndent = value };
                case .headIndent         : if let value = $0.value as? CGFloat { style.headIndent = value };
                case .tailIndent         : if let value = $0.value as? CGFloat { style.tailIndent = value };
                case .writingDirection   : if let value = $0.value as? NSWritingDirection { style.baseWritingDirection = value };
                }
            }
        };
        attr[NSAttributedString.Key.paragraphStyle] = style;
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attr);
    };
};

public extension String {
    
    func attrbuted(_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) -> NSAttributedString {
        var attributes = attributes;
        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
        return NSAttributedString(string: self, attributes: attributes)
    };
};

// old
public enum PDParagraphItem {
    case textAlignment;       // 對齊
    case lineBreakMode;       // 斷行
    case lineSpacing;         // 行間距
    case lineMinHeight;       // 最低行高
    case lineMaxHeight;       // 最高行高
    case paragraphSpacing;    // 段间距
    case firstLineHeadIndent; // 首行縮進
    case headIndent;          // 整體縮進
    case tailIndent;
    case writingDirection;    // 書寫方向
};
public enum PDAttributeItem {
    case font;
    case textColor;
    case charSpacing;
};
public struct PDParagraph {
    public var key  : PDParagraphItem;
    public var value: Any;
    
    public init(key: PDParagraphItem, value: Any) {
        self.key = key;
        switch (key) {
        case .textAlignment   : self.value = (value as? NSTextAlignment) ?? NSTextAlignment.left;
        case .lineBreakMode   : self.value = (value as? NSLineBreakMode) ?? NSLineBreakMode.byTruncatingTail;
        case .writingDirection: self.value = (value as? NSWritingDirection) ?? NSWritingDirection.leftToRight;
        default               : self.value = CGFloat(truncating: (value as? NSNumber) ?? 0);
        };
    };
};
public struct PDAttribute {
    public var key  : PDAttributeItem;
    public var value: Any;
    
    public init(key: PDAttributeItem, value: Any) {
        self.key   = key;
        self.value = value;
    };
};
public func PDAttributes(_ attrs: [PDAttribute]) -> [NSAttributedString.Key:Any] {
    var attr: [NSAttributedString.Key:Any] = [:];
    attrs.forEach { (attribute) in
        switch (attribute.key) {
        case .font       : attr[NSAttributedString.Key.font] = attribute.value;
        case .textColor  : attr[NSAttributedString.Key.foregroundColor] = attribute.value;
        case .charSpacing: attr[NSAttributedString.Key.kern] = attribute.value;
        };
    };
    return attr
};
public func PDParagraphs(_ paras: [PDParagraph]) -> NSMutableParagraphStyle {
    let style = NSMutableParagraphStyle().set { (style) in
        paras.forEach { (paragraph) in
            switch paragraph.key {
            case .textAlignment      : style.alignment            = (paragraph.value as? NSTextAlignment)!;
            case .lineBreakMode      : style.lineBreakMode        = (paragraph.value as? NSLineBreakMode)!;
            case .lineSpacing        : style.lineSpacing          = (paragraph.value as? CGFloat)!;
            case .lineMinHeight      : style.minimumLineHeight    = (paragraph.value as? CGFloat)!;
            case .lineMaxHeight      : style.maximumLineHeight    = (paragraph.value as? CGFloat)!;
            case .paragraphSpacing   : style.paragraphSpacing     = (paragraph.value as? CGFloat)!;
            case .firstLineHeadIndent: style.firstLineHeadIndent  = (paragraph.value as? CGFloat)!;
            case .headIndent         : style.headIndent           = (paragraph.value as? CGFloat)!;
            case .tailIndent         : style.tailIndent           = (paragraph.value as? CGFloat)!;
            case .writingDirection   : style.baseWritingDirection = (paragraph.value as? NSWritingDirection)!;
            };
        };
    };
    return style
};

