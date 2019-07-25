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
    
    func set(a flt: CGFloat) {
        self.forEach {
            if let item = ($0 as? UIView)      { item.set(a: flt); };
            if let item = ($0 as? UIButton )   { item.set(a: flt); };
            if let item = ($0 as? UILabel )    { item.set(a: flt); };
            if let item = ($0 as? UIImageView) { item.set(a: flt); };
            if let item = ($0 as? UITableView) { item.set(a: flt); };
            if let item = ($0 as? UISwitch )   { item.set(a: flt); };
            if let item = ($0 as? UISlider )   { item.set(a: flt); };
            if let item = ($0 as? UITextField) { item.set(a: flt); };
            if let item = ($0 as? UITextView)  { item.set(a: flt); };
        };
    };
    
    func to(a flt: CGFloat,_ time: Double) {
        self.forEach {
            if let item = ($0 as? UIView)      { item.to(a: flt, time) };
            if let item = ($0 as? UIButton )   { item.to(a: flt, time) };
            if let item = ($0 as? UILabel )    { item.to(a: flt, time) };
            if let item = ($0 as? UIImageView) { item.to(a: flt, time) };
            if let item = ($0 as? UITableView) { item.to(a: flt, time) };
            if let item = ($0 as? UISwitch )   { item.to(a: flt, time) };
            if let item = ($0 as? UISlider )   { item.to(a: flt, time) };
            if let item = ($0 as? UITextField) { item.to(a: flt, time) };
            if let item = ($0 as? UITextView)  { item.to(a: flt, time) };
        };
    };
    
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
    
    func value(contain value: Any) -> Bool {
        if let ary = self as? [Int], let int = value as? Int { return ary.filter { return $0 == int }.count == 0 }
        if let ary = self as? [NSNumber], let int = value as? NSNumber { return ary.filter { return $0 == int }.count == 0 }
        if let ary = self as? [String], let str = value as? String { return ary.filter { return $0 == str }.count == 0 }
        return false
    }
    
    func value(expect value: Any) -> [Any] {
        if let ary = self as? [String], let str = value as? String { return ary.filter { return $0 != str } }
        if let ary = self as? [Int], let int = value as? Int { return ary.filter { return $0 != int } }
        return []
    }
    func forEach(do function: @escaping(Element)->Void, completion: @escaping ()->Void) {
        var int: Int = 0
        self.forEach {
            function($0)
            int += 1
            if (int == self.count-1) {
                completion()
            }
        };
    };
    
    
};
