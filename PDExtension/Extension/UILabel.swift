//
//  UILabel.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit
import MapKit

public extension UILabel {
    
    // set frame;
    convenience init(_ frame: CGRect) {
        switch frame {
        case .zero: self.init();
        self.autolayout();
        default   : self.init(frame: frame);
        };
    };
    convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) {
        let rect = CGRect(x: x, y: y, width: w, height: h);
        self.init(frame: rect);
    };
    @objc func padding(_ t: CGFloat,_ l: CGFloat,_ b: CGFloat,_ r: CGFloat) {
        let inset = UIEdgeInsets(top: t, left: l, bottom: b, right: r);
        self.frame = self.frame.inset(by: inset);
    };
    
    
    // get data;
    var get_Str: String { return (self.text ?? "nan") };
    var get_Col: UIColor { return (self.textColor) };
    
    enum TEXT {
        case text
        case color
        case alignment
        case font
        case breakMode
        case line
    }
    
    func set(text dic: [TEXT:Any]) {
        dic.forEach {
            switch $0.key {
            case .text     : if let str = $0.value as? String { self.text = str };
            case .color    : if let color = $0.value as? UIColor { self.textColor = color };
            case .alignment: if let alignment = $0.value as? NSTextAlignment { self.textAlignment = alignment };
            case .font     : if let font = $0.value as? UIFont { self.font = font };
            case .breakMode: if let breakMode = $0.value as? NSLineBreakMode { self.lineBreakMode = breakMode };
            case .line     : if let line = $0.value as? Int { self.numberOfLines = line };
            };
        };
    };
    
    @objc func text(txt value: String,_ breakMode: NSLineBreakMode) {
        self.text = value;
        self.lineBreakMode = breakMode
    };
    @objc func attr(txt value: String,_ ali: NSTextAlignment,_ breakMode: NSLineBreakMode,_ lineSpace: CGFloat,_ lineHeight: CGFloat) {
        let paraph = NSMutableParagraphStyle().set {
            $0.alignment = ali;
            $0.lineBreakMode = breakMode;
            $0.lineSpacing = lineSpace;
            $0.minimumLineHeight = lineHeight;
        };
        let attributes = [NSAttributedString.Key.paragraphStyle: paraph];
        self.attributedText = NSAttributedString(string: value, attributes: attributes);
    };
    @objc func text(sty col: UIColor,_ size: CGFloat,_ sty: UIFont.Weight,_ line: Int) {
        self.textColor = col;
        self.font = .systemFont(ofSize: size, weight: sty);
        self.numberOfLines = line;
    };
    
    // set data;
    @objc func txt(_ str: String?,_ col: UIColor,_ ali: NSTextAlignment,_ size: CGFloat,_ sty: UIFont.Weight,_ line: Int) {
        self.text = str;
        self.textColor = col;
        self.textAlignment = ali;
        self.font = .systemFont(ofSize: size, weight: sty);
        self.numberOfLines = line;
    };
    @objc func attr(_ str: String,_ col: UIColor,_ ali: NSTextAlignment,_ size: CGFloat,_ sty: UIFont.Weight,_ line: Int,_ lineSpace: CGFloat,_ lineHeight: CGFloat) {
        let paraph = NSMutableParagraphStyle().set {
            $0.alignment         = ali;
            $0.lineBreakMode     = .byTruncatingTail
            $0.lineSpacing       = lineSpace;
            $0.minimumLineHeight = lineHeight;
        };
        let attributes = [NSAttributedString.Key.paragraphStyle: paraph];
        self.attributedText = NSAttributedString(string: str, attributes: attributes);
        self.textColor = col;
        self.font = .systemFont(ofSize: size, weight: sty);
        self.numberOfLines = line;
    };
    @objc func attr(other str: String,_ col: UIColor,_ ali: NSTextAlignment,_ size: CGFloat,_ font: String,_ line: Int,_ lineSpace: CGFloat,_ lineHeight: CGFloat) {
        let paraph = NSMutableParagraphStyle().set {
            $0.lineSpacing = lineSpace;
            $0.minimumLineHeight = lineHeight;
            $0.lineBreakMode = .byTruncatingTail
        };
        let attributes = [NSAttributedString.Key.paragraphStyle: paraph];
        self.attributedText = NSAttributedString(string: str, attributes: attributes);
        self.textColor = col;
        self.textAlignment = ali;
        self.font = UIFont.init(name: font, size: size)
        self.numberOfLines = line;
    };
    
    @objc func txt(str  value: String?) { self.text = value };
    @objc func txt(col  value: UIColor) { self.textColor = value };
    @objc func txt(ali  value: NSTextAlignment) { self.textAlignment = value };
    @objc func txt(size value: CGFloat,_ sty: UIFont.Weight) { self.font = .systemFont(ofSize: value, weight: sty) };
    @objc func txt(line value: Int) { self.numberOfLines = value };
    @objc func txt(break value: NSLineBreakMode) { self.lineBreakMode = value };
    
    @objc func txt_SizeFix() { self.adjustsFontSizeToFitWidth = true };
    
    // extension function;
    @objc func add_dist(_ latitude: Double, _ longitude: Double) {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude), completionHandler: { (placemarks, error) in
            if let error = error { print(error.localizedDescription); return };
            guard let pmk = placemarks?[0] else { return };
            let area: String = (pmk.subAdministrativeArea != nil) ? pmk.subAdministrativeArea! : "";
            let dist: String = (pmk.locality != nil) ? pmk.locality! : "";
            self.text = String(format:"%@%@", area, dist);
        });
    };
};
