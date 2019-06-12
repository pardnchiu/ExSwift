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
        try block(self)
        return self
    }
}
extension NSObject: simplify {};
extension CGPoint: simplify {};
extension CGRect: simplify {};
extension CGSize: simplify {};
extension CGVector: simplify {};
