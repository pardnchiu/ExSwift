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
    
    var _t: CGFloat { return self.contentInset.top };
    var _l: CGFloat { return self.contentInset.left };
    var _b: CGFloat { return self.contentInset.bottom };
    var _r: CGFloat { return self.contentInset.right };
    var _innerX: CGFloat { return self.contentOffset.x };
    var _innerY: CGFloat { return self.contentOffset.y };
    var _innerW: CGFloat { return self.contentSize.width };
    var _innerH: CGFloat { return self.contentSize.height };
    
    func t(_ value: CGFloat) { self.contentInset.top = value };
    func l(_ value: CGFloat) { self.contentInset.left = value };
    func b(_ value: CGFloat) { self.contentInset.bottom = value };
    func r(_ value: CGFloat) { self.contentInset.right = value };
    
    func set(t value: CGFloat) { self.t(value) };
    func set(l value: CGFloat) { self.l(value) };
    func set(b value: CGFloat) { self.b(value) };
    func set(r value: CGFloat) { self.r(value) };
    
    func set(t: CGFloat, l: CGFloat) { self.t(t); self.l(l) };
    func set(t: CGFloat, b: CGFloat) { self.t(t); self.b(b) };
    func set(t: CGFloat, r: CGFloat) { self.t(t); self.r(r) };
    func set(l: CGFloat, b: CGFloat) { self.l(l); self.b(b) };
    func set(l: CGFloat, r: CGFloat) { self.l(l); self.r(r) };
    func set(b: CGFloat, r: CGFloat) { self.b(b); self.r(r) };
    
    func set(t: CGFloat, l: CGFloat, b: CGFloat) { self.set(padding: t, l, b, self._r) };
    func set(t: CGFloat, l: CGFloat, r: CGFloat) { self.set(padding: t, l, self._b, r) };
    func set(t: CGFloat, b: CGFloat, r: CGFloat) { self.set(padding: t, self._l, b, r) };
    func set(l: CGFloat, b: CGFloat, r: CGFloat) { self.set(padding: self._t, l, b, r) };

    func set(padding top: CGFloat,_ left: CGFloat,_ bottom: CGFloat,_ right: CGFloat) {
        self.contentInset = UIEdgeInsets(top, left, bottom, right)
    };
    
    func set(inner width: CGFloat,_ height: CGFloat) { self.contentSize = CGSize(width, height) };
    func set(inner point: CGPoint)  { self.contentOffset = point };
    func set(iX value: CGFloat) { self.contentOffset.x = value };
    func set(iY value: CGFloat) { self.contentOffset.y = value };
    
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
    
    func to(iX value: CGFloat,_ time: Double) { animation(time) { self.set(iX: value) } };
    func to(iY value: CGFloat,_ time: Double) { animation(time) { self.set(iY: value) } };
    
    func to(iX value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(iX: value) }, completion) };
    func to(iY value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(iY: value) }, completion) };
    
    func set(pageEnabled value: Bool) { self.isPagingEnabled = value};
    
    
    // set data
    @objc func padding(_ t: CGFloat,_ l: CGFloat,_ b: CGFloat,_ r: CGFloat) {
        self.contentInset = UIEdgeInsets.init(top: t, left: l, bottom: b, right: r);
    };
    
}
