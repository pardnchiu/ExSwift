//
//  PDLayout.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension NSLayoutYAxisAnchor {
    
    func equal(to target: NSLayoutYAxisAnchor,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(equalTo: target, constant: value) };
    func greater(to target: NSLayoutYAxisAnchor,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(greaterThanOrEqualTo: target, constant: value) };
    func less(to target: NSLayoutYAxisAnchor,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(lessThanOrEqualTo: target, constant: value) };
}

public extension NSLayoutXAxisAnchor {
    
    func equal(to target: NSLayoutXAxisAnchor,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(equalTo: target, constant: value) };
    func greater(to target: NSLayoutXAxisAnchor,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(greaterThanOrEqualTo: target, constant: value) };
    func less(to target: NSLayoutXAxisAnchor,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(lessThanOrEqualTo: target, constant: value) };
}

public extension NSLayoutDimension {
    
    func equal(_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(equalToConstant: value) };
    func greater(_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(greaterThanOrEqualToConstant: value) };
    func less(_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(lessThanOrEqualToConstant: value) };
    
    func equal(to target: NSLayoutDimension,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(equalTo: target, multiplier: value) };
    func greater(to target: NSLayoutDimension,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(greaterThanOrEqualTo: target, multiplier: value) };
    func less(to target: NSLayoutDimension,_ value: CGFloat) -> NSLayoutConstraint { return self.constraint(lessThanOrEqualTo: target, multiplier: value) };
}

public enum PDConstraint {
    case xEqual;
    case yEqual;
    case tEqual;
    case lEqual;
    case bEqual;
    case rEqual;
    case wEqual;
    case hEqual;
    
    case tGreater;
    case lGreater;
    case bGreater;
    case rGreater;
    case wGreater;
    case hGreater;
    
    case tLess;
    case lLess;
    case bLess;
    case rLess;
    case wLess;
    case hLess;
}

public struct PDLayout {
    public var constraint: PDConstraint, target: Any?, value: CGFloat
    public init(_ constraint: PDConstraint,_ target: Any?,_ value: CGFloat) {
        self.constraint = constraint;
        self.target     = target;
        self.value      = value;
    };
};

public func x(equal target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.xEqual, target, value) };
public func y(equal target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.yEqual, target, value) };
public func t(equal target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.tEqual, target, value) };
public func l(equal target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.lEqual, target, value) };
public func b(equal target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.bEqual, target, value) };
public func r(equal target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.rEqual, target, value) };
public func w(equal target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.wEqual, target, value) };
public func h(equal target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.hEqual, target, value) };

public func t(greater target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.tGreater, target, value) };
public func l(greater target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.lGreater, target, value) };
public func b(greater target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.bGreater, target, value) };
public func r(greater target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.rGreater, target, value) };
public func w(greater target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.wGreater, target, value) };
public func h(greater target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.hGreater, target, value) };

public func t(less target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.tLess, target, value) };
public func l(less target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.lLess, target, value) };
public func b(less target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.bLess, target, value) };
public func r(less target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.rLess, target, value) };
public func w(less target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.wLess, target, value) };
public func h(less target: Any?,_ value: CGFloat) -> PDLayout { return PDLayout(.hLess, target, value) };

public extension UIView {
    
    func layouts(_ pdlayouts: [PDLayout]) {
        pdlayouts.forEach {
            switch $0.constraint {
            case .xEqual: if let target = $0.target as? NSLayoutXAxisAnchor { self.centerXAnchor.equal(to: target, $0.value).isActive = true }
            case .yEqual: if let target = $0.target as? NSLayoutYAxisAnchor { self.centerYAnchor.equal(to: target, $0.value).isActive = true }
            case .tEqual: if let target = $0.target as? NSLayoutYAxisAnchor { self.topAnchor.equal(to: target, $0.value).isActive = true }
            case .lEqual: if let target = $0.target as? NSLayoutXAxisAnchor { self.leftAnchor.equal(to: target, $0.value).isActive = true }
            case .bEqual: if let target = $0.target as? NSLayoutYAxisAnchor { self.bottomAnchor.equal(to: target, $0.value).isActive = true }
            case .rEqual: if let target = $0.target as? NSLayoutXAxisAnchor { self.rightAnchor.equal(to: target, $0.value).isActive = true }
            case .wEqual:
                guard let target = $0.target as? NSLayoutDimension else { self.widthAnchor.equal($0.value).isActive = true; return }
                self.widthAnchor.equal(to: target, $0.value).isActive = true
            case .hEqual:
                guard let target = $0.target as? NSLayoutDimension else { self.heightAnchor.equal($0.value).isActive = true; return }
                self.heightAnchor.equal(to: target, $0.value).isActive = true
                
            case .tGreater: if let target = $0.target as? NSLayoutYAxisAnchor { self.topAnchor.greater(to: target, $0.value).isActive = true }
            case .lGreater: if let target = $0.target as? NSLayoutXAxisAnchor { self.leftAnchor.greater(to: target, $0.value).isActive = true }
            case .bGreater: if let target = $0.target as? NSLayoutYAxisAnchor { self.bottomAnchor.greater(to: target, $0.value).isActive = true }
            case .rGreater: if let target = $0.target as? NSLayoutXAxisAnchor { self.rightAnchor.greater(to: target, $0.value).isActive = true }
            case .wGreater:
                guard let target = $0.target as? NSLayoutDimension else { self.widthAnchor.greater($0.value).isActive = true; return }
                self.widthAnchor.greater(to: target, $0.value).isActive = true
            case .hGreater:
                guard let target = $0.target as? NSLayoutDimension else { self.heightAnchor.greater($0.value).isActive = true; return }
                self.heightAnchor.greater(to: target, $0.value).isActive = true
                
            case .tLess: if let target = $0.target as? NSLayoutYAxisAnchor { self.topAnchor.less(to: target, $0.value).isActive = true }
            case .lLess: if let target = $0.target as? NSLayoutXAxisAnchor { self.leftAnchor.less(to: target, $0.value).isActive = true }
            case .bLess: if let target = $0.target as? NSLayoutYAxisAnchor { self.bottomAnchor.less(to: target, $0.value).isActive = true }
            case .rLess: if let target = $0.target as? NSLayoutXAxisAnchor { self.rightAnchor.less(to: target, $0.value).isActive = true }
            case .wLess:
                guard let target = $0.target as? NSLayoutDimension else { self.widthAnchor.less($0.value).isActive = true; return }
                self.widthAnchor.less(to: target, $0.value).isActive = true
            case .hLess:
                guard let target = $0.target as? NSLayoutDimension else { self.heightAnchor.less($0.value).isActive = true; return }
                self.heightAnchor.less(to: target, $0.value).isActive = true
            }
        }
    }
}
