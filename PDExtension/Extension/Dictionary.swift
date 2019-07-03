//
//  Dictionary.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension Dictionary {
    
    func _UPDATE(_ dictionary: [String:Any]) -> [String:Any] {
        var dicNew: [String:Any] = [:]
        for i in dictionary { dicNew.updateValue(i.value, forKey: i.key) }
        return dicNew
    }
    
    var requestURL: String {
        if (self.isEmpty) { return "" };
        var str: String = "";
        for i in self {
            let bool: Bool = (i.key == Array(self.keys)[0]);
            str += bool ? "%22\(i.key)%22%3a%22\(i.value)%22" : "%2c%22\(i.key)%22%3a%22\(i.value)%22";
        };
        return str;
    };
};

public extension NSDictionary {
    
    func to_local(dic path: String,_ name: String) {
        let doc: String = NSHomeDirectory()+"/Library/Caches/\(path)"
        try! FileManager.default.createDirectory(atPath: doc, withIntermediateDirectories: true, attributes: nil)
        NSDictionary(dictionary: self).write(toFile: doc+"/\(name).plist", atomically: true);
        print(doc)
    };
};
