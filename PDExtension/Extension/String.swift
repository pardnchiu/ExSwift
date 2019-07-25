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
    
    var _md5: String {
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
    var _noSpace: String { return self.trimmingCharacters(in: .whitespaces) };
    var _empty: Bool { return self._noSpace.isEmpty };
    var _url: URL? { return URL(string: self) };
    
    func replace(_ key: String,_ value: String) -> String {
        return self.replacingOccurrences(of: key, with: value, options: .literal, range: nil)
    }
    
    // old
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
};
