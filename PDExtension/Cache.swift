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

public extension Dictionary {
    
    func caches(save folderName: String?,_ fileName: String) {
        let folder: String = (folderName ?? "");
        let path  : String = NSHomeDirectory()+"/Library/Caches/\(folder._empty ? "" : "\(folder)/")";
        let file  : String = "\(path)\(fileName).plist";
        try! FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil);
        NSDictionary(dictionary: self).write(toFile: file, atomically: true);
    };
    
    func cache(load folderName: String?,_ fileName: String) -> [String:Any]? {
        let folder: String = (folderName ?? "");
        let path  : String = NSHomeDirectory()+"/Library/Caches/\(folder._empty ? "" : "\(folder)/")";
        let file  : String = "\(path)\(fileName).plist";
        return NSDictionary(contentsOfFile: file) as? [String:Any]
    };
    
}

public extension Array {
    
    func cache(load folderName: String?,_ fileName: String) -> [String]? {
        let folder: String = (folderName ?? "");
        let path  : String = NSHomeDirectory()+"/Library/Caches/\(folder._empty ? "" : "\(folder)/")";
        let file  : String = "\(path)\(fileName).plist";
        return NSArray(contentsOfFile: file) as? [String]
    }
    
    func cache(load folderName: String?,_ fileName: String) -> [NSNumber]? {
//        let doc: String = NSHomeDirectory()+"/Library/Caches/\(path)";
//        let file: String = doc+"/\(name).plist";
//        DispatchQueue.main.async {
//            completion(NSArray(contentsOfFile: file));
//        }
        let folder: String = (folderName ?? "");
        let path  : String = NSHomeDirectory()+"/Library/Caches/\(folder._empty ? "" : "\(folder)/")";
        let file  : String = "\(path)\(fileName).plist";
        return NSArray(contentsOfFile: file) as? [NSNumber]
    }
    
    func cache(load folderName: String?,_ fileName: String) -> [Date]? {
        let folder: String = (folderName ?? "");
        let path  : String = NSHomeDirectory()+"/Library/Caches/\(folder._empty ? "" : "\(folder)/")";
        let file  : String = "\(path)\(fileName).plist";
        return NSArray(contentsOfFile: file) as? [Date]
    }
    
    func cache(load folderName: String?,_ fileName: String) -> [Data]? {
        let folder: String = (folderName ?? "");
        let path  : String = NSHomeDirectory()+"/Library/Caches/\(folder._empty ? "" : "\(folder)/")";
        let file  : String = "\(path)\(fileName).plist";
        return NSArray(contentsOfFile: file) as? [Data]
    }
    
    func cache(load folderName: String?,_ fileName: String) -> [Bool]? {
        let folder: String = (folderName ?? "");
        let path  : String = NSHomeDirectory()+"/Library/Caches/\(folder._empty ? "" : "\(folder)/")";
        let file  : String = "\(path)\(fileName).plist";
        return NSArray(contentsOfFile: file) as? [Bool]
    }
}

public func cache(load path: String,_ name: String,_ completion: @escaping ([String:Any]?)->()) {
    let doc : String = NSHomeDirectory()+"/Library/Caches/\(path)";
    let file: String = doc+"/\(name).plist";
    let dic = NSDictionary(contentsOfFile: file) as? [String:Any];
    DispatchQueue.main.async {
        completion(dic);
    }
};

//public func array() {
//    let file: String = NSHomeDirectory()+"/Library/Caches/articles/block.plist"
//    guard let sn = article.articleID else { return };
//    guard let ary = NSArray(contentsOfFile: file) as? [NSNumber] else {
//        let ary: NSArray = [sn]
//        ary.write(toFile: file, atomically: true);
//        return
//    };
//}

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
