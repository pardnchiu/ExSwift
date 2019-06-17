//
//  Simplify.swift
//  PDExtension
//
//  Created by Pardn Co., Ltd on 2019/6/13.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation

public protocol simplify {}
public extension simplify where Self: AnyObject {
    
    func set(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self);
        return self
    };
};
extension NSObject: simplify {};
extension CGPoint : simplify {};
extension CGRect  : simplify {};
extension CGSize  : simplify {};
extension CGVector: simplify {};

public func localCache(save value: [String:Any],_ path: String,_ name: String) {
    let doc : String = NSHomeDirectory()+"/Library/Caches/\(path)";
    let file: String = doc+"/\(name).plist";
    try! FileManager.default.createDirectory(atPath: doc, withIntermediateDirectories: true, attributes: nil);
    NSDictionary(dictionary: value).write(toFile: file, atomically: true);
};

public func localCache(load path: String,_ name: String,_ completion: @escaping ([String:Any]?)->()) {
    let doc : String = NSHomeDirectory()+"/Library/Caches/\(path)";
    let file: String = doc+"/\(name).plist";
    let dic = NSDictionary(contentsOfFile: file) as? [String:Any];
    completion(dic);
};

public func localCache(delete path: String,_ name: String) {
    let fileManager = FileManager.default;
    do {
        try fileManager.removeItem(atPath: NSHomeDirectory()+"/Library/Caches/\(path)/\(name).plist");
    }
    catch let error as NSError {
        print(error.localizedDescription);
        return
    };
};
