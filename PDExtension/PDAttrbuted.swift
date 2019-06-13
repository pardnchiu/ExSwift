//
//  PDAttrbuted.swift
//  PDExtension
//
//  Created by Pardn Co., Ltd on 2019/6/9.
//  Copyright © 2016-2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

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

public enum PDAttributeItem {
    case font;
    case textColor;
    case charSpacing;
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

public extension UIButton {
    
    func attrbuted(_ text: String,_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) {
        var attributes = attributes;
        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
        self.setAttributedTitle(NSAttributedString(string: text, attributes: attributes), for: .normal);
    };
};

public extension UILabel {
    
    func attrbuted(_ text: String,_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) {
        var attributes = attributes;
        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
        self.attributedText = NSAttributedString(string: text, attributes: attributes);
    };
};

public extension UITextField {
    
    func attrbuted(txt text: String,_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) {
        var attributes = attributes;
        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
        self.attributedText = NSAttributedString(string: text, attributes: attributes);
    };
    
    func attrbuted(phd text: String,_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) {
        var attributes = attributes;
        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes);
    };
};

public extension String {
    
    func attrbuted(_ paragraph: NSMutableParagraphStyle,_ attributes: [NSAttributedString.Key:Any]) -> NSAttributedString {
        var attributes = attributes;
        attributes[NSAttributedString.Key.paragraphStyle] = paragraph;
        return NSAttributedString(string: self, attributes: attributes)
    };
};
