//
//  Array.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension Array {
    
    func a(_ flt: CGFloat) {
        for i in self {
            if let item = (i as? UIView)      { item.a(flt); };
            if let item = (i as? UIButton )   { item.a(flt); };
            if let item = (i as? UILabel )    { item.a(flt); };
            if let item = (i as? UIImageView) { item.a(flt); };
            if let item = (i as? UITableView) { item.a(flt); };
            if let item = (i as? UISwitch )   { item.a(flt); };
            if let item = (i as? UISlider )   { item.a(flt); };
            if let item = (i as? UITextField) { item.a(flt); };
            if let item = (i as? UITextView)  { item.a(flt); };
        };
    };
    
    func a(to flt: CGFloat,_ time: Double) {
        for i in self {
            if let item = (i as? UIView)      { item.alpha(to: flt, time) };
            if let item = (i as? UIButton )   { item.alpha(to: flt, time) };
            if let item = (i as? UILabel )    { item.alpha(to: flt, time) };
            if let item = (i as? UIImageView) { item.alpha(to: flt, time) };
            if let item = (i as? UITableView) { item.alpha(to: flt, time) };
            if let item = (i as? UISwitch )   { item.alpha(to: flt, time) };
            if let item = (i as? UISlider )   { item.alpha(to: flt, time) };
            if let item = (i as? UITextField) { item.alpha(to: flt, time) };
            if let item = (i as? UITextView)  { item.alpha(to: flt, time) };
        };
    };
    
    func exist(_ str: String) -> Bool { return (self.filter { (elm) -> Bool in return (elm as! String) == str; }.count != 0); };
    func exist(_ int: Int) -> Bool { return (self.filter { (elm) -> Bool in return (elm as! Int) == int; }.count != 0); };
    func except(_ str: String) -> Array { return self.filter { (elm) -> Bool in return (elm as! String) != str; }; };
    func except(_ int: Int) -> Array { return self.filter { (elm) -> Bool in return (elm as! Int) != int; }; };
    
    func tap(upIn target: Any?,_ action: Selector) {
        guard let ary = self as? [UIButton] else { return; };
        for i in ary { i.addTarget(target, action: action, for: .touchUpInside); };
    };
};

public extension NSArray {
    
    func to_local(ary value: [Any],_ file: String) {
        NSArray(array: value).write(toFile: file, atomically: true);
    };
    
    func load_local(_ file: String,_ completion: @escaping ([[String:Any]]?) -> ()) {
        guard let ary = NSArray(contentsOfFile: file) as? [[String:Any]] else { completion(nil); return };
        completion(ary);
    };
};
