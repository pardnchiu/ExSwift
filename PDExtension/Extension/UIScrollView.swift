//
//  UISCrollView.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {
    
    var _top    : CGFloat { return self.contentInset.top };
    var _left   : CGFloat { return self.contentInset.left };
    var _bottom : CGFloat { return self.contentInset.bottom };
    var _right  : CGFloat { return self.contentInset.right };
    var _offsetX: CGFloat { return self.contentOffset.x };
    var _offsetY: CGFloat { return self.contentOffset.y };
    var _innerWidth : CGFloat { return self.contentSize.width };
    var _innerHeight: CGFloat { return self.contentSize.height };
    
    func t(_ value: CGFloat) { self.contentInset.top = value };
    func l(_ value: CGFloat) { self.contentInset.left = value };
    func b(_ value: CGFloat) { self.contentInset.bottom = value };
    func r(_ value: CGFloat) { self.contentInset.right = value };
    
    func set(top value: CGFloat) { self.t(value) };
    func set(left value: CGFloat) { self.l(value) };
    func set(bottom value: CGFloat) { self.b(value) };
    func set(right value: CGFloat) { self.r(value) };
    func set(top: CGFloat, left: CGFloat)   { self.t(top); self.l(left) };
    func set(top: CGFloat, bottom: CGFloat) { self.t(top); self.b(bottom) };
    func set(top: CGFloat, right: CGFloat)  { self.t(top); self.r(right) };
    func set(left: CGFloat, bottom: CGFloat) { self.l(left); self.b(bottom) };
    func set(left: CGFloat, right: CGFloat)  { self.l(left); self.r(right) };
    func set(bottom: CGFloat, right: CGFloat)  { self.b(bottom); self.r(right) };
    func set(top: CGFloat, left: CGFloat, bottom: CGFloat) { self.set(padding: top, left, bottom, self._right) };
    func set(top: CGFloat, left: CGFloat, right: CGFloat)  { self.set(padding: top, left, self._bottom, right) };
    func set(top: CGFloat, bottom: CGFloat, right: CGFloat)  { self.set(padding: top, self._left, bottom, right) };
    func set(left: CGFloat,bottom: CGFloat, right: CGFloat)  { self.set(padding: self._top, left, bottom, right) };
    func set(padding top: CGFloat,_ left: CGFloat,_ bottom: CGFloat,_ right: CGFloat) {
        self.contentInset = UIEdgeInsets(top, left, bottom, right)
    };
    
    func set(inner width: CGFloat,_ height: CGFloat) { self.contentSize = CGSize(width, height) };
    func set(protocal delegate: UIScrollViewDelegate) { self.delegate = delegate };
    func set(scrollEnable value: Bool) { self.isScrollEnabled = value };
    func set(indicator vertical: Bool, _ horizontal: Bool) {
        self.showsVerticalScrollIndicator = vertical;
        self.showsHorizontalScrollIndicator = horizontal;
    };
    func set(bounce vertical: Bool,_ horizontal: Bool) {
        self.alwaysBounceVertical = vertical;
        self.alwaysBounceHorizontal = horizontal;
    };
    func set(adjust value: ContentInsetAdjustmentBehavior) {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = value;
        };
    };
    
    func set(offset point: CGPoint)  { self.contentOffset = point };
    func set(offsetX value: CGFloat) { self.contentOffset.x = value };
    func set(offsetY value: CGFloat) { self.contentOffset.y = value };
    
    func offsetX(to value: CGFloat,_ time: Double) { animation(time) { self.contentOffset.x = value }};
    func offsetY(to value: CGFloat,_ time: Double) { animation(time) { self.contentOffset.y = value }};
    
    func offsetX(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) {
        animation(time, {
            self.contentOffset.x = value
        }, completion);
    };
    func offsetY(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) {
        animation(time, {
            self.contentOffset.y = value
        }, completion);
    };
    
    func set(pageEnabled value: Bool) { self.isPagingEnabled = value};
    
    
    // set data
    @objc func padding(_ t: CGFloat,_ l: CGFloat,_ b: CGFloat,_ r: CGFloat) {
        self.contentInset = UIEdgeInsets.init(top: t, left: l, bottom: b, right: r);
    };
    
}
