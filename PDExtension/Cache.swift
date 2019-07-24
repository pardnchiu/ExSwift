//
//  Cache.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/14.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public enum CACHE {
    case dictionary
    case array
}

public func cache(save value: [String:Any],_ path: String,_ name: String) {
    let doc : String = NSHomeDirectory()+"/Library/Caches/\(path)";
    let file: String = doc+"/\(name).plist";
    try! FileManager.default.createDirectory(atPath: doc, withIntermediateDirectories: true, attributes: nil);
    NSDictionary(dictionary: value).write(toFile: file, atomically: true);
};

public func cache(load path: String,_ name: String,_ completion: @escaping ([String:Any]?)->()) {
    let doc : String = NSHomeDirectory()+"/Library/Caches/\(path)";
    let file: String = doc+"/\(name).plist";
    let dic = NSDictionary(contentsOfFile: file) as? [String:Any];
    DispatchQueue.main.async {
        completion(dic);
    }
};

public func array(load path: String,_ name: String,_ completion: @escaping (NSArray?)->()) {
    let doc: String = NSHomeDirectory()+"/Library/Caches/\(path)";
    let file: String = doc+"/\(name).plist";
    DispatchQueue.main.async {
        completion(NSArray(contentsOfFile: file));
    }
}

public func cache(delete path: String,_ name: String) {
    let fileManager = FileManager.default;
    do {
        try fileManager.removeItem(atPath: NSHomeDirectory()+"/Library/Caches/\(path)/\(name).plist");
    }
    catch let error as NSError {
        print(error.localizedDescription);
        return
    };
};
