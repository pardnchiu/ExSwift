//
//  String.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit


public extension String {
    
    var to_MD5: String {
        guard let str = self.cString(using: String.Encoding.utf8) else { return "" };
        
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8)),
        digestLen = Int(CC_MD5_DIGEST_LENGTH),
        result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen),
        hash = NSMutableString();
        
        CC_MD5(str, strLen, result);
        
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i]);
        };
        
        result.deinitialize(count: digestLen);
        
        return String(format: hash as String);
    };
    var no_Space: String { return self.trimmingCharacters(in: .whitespaces) };
    var empty: Bool { return self.no_Space.isEmpty };
    var _url: URL? { return URL(string: self) };
    
    func split(_ str: Character) -> [String] {
        var ary: [String] = []
        for i in self.split(separator: str) {
            ary.append(String(i))
        };
        return ary
    };
    
    func equal(_ str: String) -> Bool { return (self == str) };
    func differ(_ str: String) -> Bool { return (self != str); };
    
    func exist(_ ary: [String]) -> Bool { return (ary.filter { (elm) -> Bool in return elm == self; }.count != 0) };
    
    func replace(_ dic: [String:String]) -> String {
        var str: String = self;
        for i in dic {
            str = str.replacingOccurrences(of: i.key, with: i.value, options: .literal, range: nil);
        };
        return str;
    };
    
    func w(_ size: CGFloat,_ weight: UIFont.Weight,_ line: Int,_ h:CGFloat) -> CGFloat {
        let label: UILabel = UILabel(0, 0, CGFloat.greatestFiniteMagnitude, h).body {
            $0.PDText([
                lText(text: self),
                lText(font: size, weight),
                lText(line: line)
                ])
            $0.lineBreakMode = NSLineBreakMode.byWordWrapping;
            $0.sizeToFit();
        };
        return label.frame.width;
    };
    
    func h(_ size: CGFloat,_ weight: UIFont.Weight,_ line: Int,_ w:CGFloat) -> CGFloat{
        let label: UILabel = UILabel(0, 0, w, CGFloat.greatestFiniteMagnitude).body {
            $0.PDText([
                lText(text: self),
                lText(font: size, weight),
                lText(line: line)
                ])
            $0.lineBreakMode = NSLineBreakMode.byWordWrapping;
            $0.sizeToFit();
        };
        return label.frame.height;
    };
    
    func h(_ size: CGFloat,_ weight: UIFont.Weight,_ line: Int,_ w:CGFloat,_ lineSpace: CGFloat,_ lineHeight: CGFloat) -> CGFloat{
        let label: UILabel = UILabel(0, 0, w, CGFloat.greatestFiniteMagnitude).body {
            $0.PDText([
                lText(text: self),
                lText(font: size, weight),
                lText(line: line)
                ])
            let paraph = NSMutableParagraphStyle().body {
                $0.lineSpacing = lineSpace;
                $0.minimumLineHeight = lineHeight
            };
            let attributes = [NSAttributedString.Key.paragraphStyle: paraph];
            $0.attributedText = NSAttributedString(string: self, attributes: attributes);
            $0.lineBreakMode = NSLineBreakMode.byWordWrapping;
            $0.sizeToFit();
        };
        return label.frame.height;
    };
    
    func sendAPI(_ complet: @escaping (Data?)->()) {
        guard let url = URL(string: self) else { return };
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("\n#error\n", error.localizedDescription);
                complet(nil);
                return;
            };
            guard let data = data else {
                print("\n#empty[n", response.debugDescription);
                complet(nil);
                return;
            };
            DispatchQueue.main.async() { complet(data) };
            }.resume();
    };
};
