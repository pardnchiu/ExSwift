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
            if let item = (i as? UIView)      { item.set(a: flt); };
            if let item = (i as? UIButton )   { item.set(a: flt); };
            if let item = (i as? UILabel )    { item.set(a: flt); };
            if let item = (i as? UIImageView) { item.set(a: flt); };
            if let item = (i as? UITableView) { item.set(a: flt); };
            if let item = (i as? UISwitch )   { item.set(a: flt); };
            if let item = (i as? UISlider )   { item.set(a: flt); };
            if let item = (i as? UITextField) { item.set(a: flt); };
            if let item = (i as? UITextView)  { item.set(a: flt); };
        };
    };
    
    func a(to flt: CGFloat,_ time: Double) {
        for i in self {
            if let item = (i as? UIView)      { item.to(a: flt, time) };
            if let item = (i as? UIButton )   { item.to(a: flt, time) };
            if let item = (i as? UILabel )    { item.to(a: flt, time) };
            if let item = (i as? UIImageView) { item.to(a: flt, time) };
            if let item = (i as? UITableView) { item.to(a: flt, time) };
            if let item = (i as? UISwitch )   { item.to(a: flt, time) };
            if let item = (i as? UISlider )   { item.to(a: flt, time) };
            if let item = (i as? UITextField) { item.to(a: flt, time) };
            if let item = (i as? UITextView)  { item.to(a: flt, time) };
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
    
    func clear() {
        self.forEach {
            if let item = ($0 as? UIButton ) { item.setTitle(nil, for: .normal) };
            if let item = ($0 as? UILabel ) {
                if item.attributedText != nil {
                    item.PDAttributed(text: "")
                } else {
                    item.text = ""
                }
            };
            if let item = ($0 as? UIImageView) { item.image = nil };
            if let item = ($0 as? UITextField) { item.text = nil };
            if let item = ($0 as? UITextView)  { item.text = nil };
        }
    }
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
