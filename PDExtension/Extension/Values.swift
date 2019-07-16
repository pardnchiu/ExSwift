//
//  Int.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/14.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation

public extension Bool {
    
    func function(TRUE: ()->(), FALSE: ()->()) {
        if (self) { TRUE(); return };
        FALSE();
    };
};

public extension Int {
    
    var _str   : String { return String(self) };
    var _cgflt : CGFloat { return CGFloat(self) };
    var _date: Date { return Date(timeIntervalSince1970: TimeInterval(self)) };
    
    func equal(_ int: Int) -> Bool { return (self == int); };
    func differ(_ int: Int) -> Bool { return (self != int); };
}

public extension NSNumber {
    
    var _int: Int { return Int(truncating: self) };
}

public extension CGFloat {
    
    var _int: Int { return Int(self) };
}

public extension CGRect {
    
    init(_ x: CGFloat,_ y: CGFloat,_ width: CGFloat,_ height: CGFloat) { self.init(x: x, y: y, width: width, height: height) };
};

public extension CGSize {
    
    init(_ width: CGFloat,_ height: CGFloat) { self.init(width: width, height: height) };
};

public extension CGPoint {
    
    init(_ x: CGFloat,_ y: CGFloat) { self.init(x: x, y: y) };
};

public extension IndexPath {
    
    init(_ row: Int,_ section: Int) { self.init(row: row, section: section) };
};
