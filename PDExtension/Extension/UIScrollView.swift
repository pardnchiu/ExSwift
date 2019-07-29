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
    
    var t: CGFloat  { return self.contentInset.top };
    var l: CGFloat  { return self.contentInset.left };
    var b: CGFloat  { return self.contentInset.bottom };
    var r: CGFloat  { return self.contentInset.right };
    var ix: CGFloat { return self.contentOffset.x };
    var iy: CGFloat { return self.contentOffset.y };
    var iw: CGFloat { return self.contentSize.width };
    var ih: CGFloat { return self.contentSize.height };
    
    func set(t value: CGFloat) { self.contentInset.top = value };
    func set(l value: CGFloat) { self.contentInset.left = value };
    func set(b value: CGFloat) { self.contentInset.bottom = value };
    func set(r value: CGFloat) { self.contentInset.right = value };
    
    func set(ix value: CGFloat) { self.contentOffset.x = value };
    func set(iy value: CGFloat) { self.contentOffset.y = value };
    func set(iw value: CGFloat) { self.contentSize.width = value };
    func set(ih value: CGFloat) { self.contentSize.height = value };
    
    func set(ix: CGFloat, iy: CGFloat) { self.contentOffset = CGPoint(ix, iy) };
    func set(ix: CGFloat, iw: CGFloat) { self.set(ix: ix); self.set(iw: iw) };
    func set(ix: CGFloat, ih: CGFloat) { self.set(ix: ix); self.set(ih: ih) };
    func set(iy: CGFloat, iw: CGFloat) { self.set(iy: iy); self.set(iw: iw) };
    func set(iy: CGFloat, ih: CGFloat) { self.set(iy: iy); self.set(ih: ih) };
    func set(iw: CGFloat, ih: CGFloat) { self.contentSize = CGSize(iw, ih) };
    
    func set(ix: CGFloat, iy: CGFloat, iw: CGFloat) { self.set(inner: ix, iy, iw, self.ih) };
    func set(ix: CGFloat, iy: CGFloat, ih: CGFloat) { self.set(inner: ix, iy, self.iw, ih) };
    func set(ix: CGFloat, iw: CGFloat, ih: CGFloat) { self.set(inner: ix, self.iy, iw, ih) };
    func set(iy: CGFloat, iw: CGFloat, ih: CGFloat) { self.set(inner: self.ix, iy, iw, ih) };
    
    func set(t: CGFloat, l: CGFloat) { self.set(t: t); self.set(l: l) };
    func set(t: CGFloat, b: CGFloat) { self.set(t: t); self.set(b: b) };
    func set(t: CGFloat, r: CGFloat) { self.set(t: t); self.set(r: r) };
    func set(l: CGFloat, b: CGFloat) { self.set(l: l); self.set(b: b) };
    func set(l: CGFloat, r: CGFloat) { self.set(l: l); self.set(r: r) };
    func set(b: CGFloat, r: CGFloat) { self.set(b: b); self.set(r: r) };
    
    func set(t: CGFloat, l: CGFloat, b: CGFloat) { self.set(padding: t, l, b, self.r) };
    func set(t: CGFloat, l: CGFloat, r: CGFloat) { self.set(padding: t, l, self.b, r) };
    func set(t: CGFloat, b: CGFloat, r: CGFloat) { self.set(padding: t, self.l, b, r) };
    func set(l: CGFloat, b: CGFloat, r: CGFloat) { self.set(padding: self.t, l, b, r) };

    func set(inner x: CGFloat,_ y: CGFloat,_ width: CGFloat,_ height: CGFloat) { self.set(ix: x, iy: x); self.set(iw: width, ih: height) };
    func set(padding top: CGFloat,_ left: CGFloat,_ bottom: CGFloat,_ right: CGFloat) { self.contentInset = UIEdgeInsets(top, left, bottom, right) };
    
    func to(iX value: CGFloat,_ time: Double) { animation(time) { self.set(ix: value) } };
    func to(iY value: CGFloat,_ time: Double) { animation(time) { self.set(iy: value) } };
    
    func to(iX value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(ix: value) }, completion) };
    func to(iY value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(iy: value) }, completion) };
    
    func set(protocal delegate: UIScrollViewDelegate) { self.delegate = delegate };
    func set(adjust value: ContentInsetAdjustmentBehavior) {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = value;
        };
    };
    
    func enable(scroll value: Bool) { self.isScrollEnabled = value };
    func enable(page value: Bool) { self.isPagingEnabled = value};
    func enable(indicatorV value: Bool) { self.showsVerticalScrollIndicator = value };
    func enable(indicatorH value: Bool) { self.showsHorizontalScrollIndicator = value };
    func enable(indicator v: Bool, _ h: Bool) { self.enable(indicatorV: v); self.enable(indicatorH: h) };
    func enable(bounceV value: Bool) { self.alwaysBounceVertical = value };
    func enable(bounceH value: Bool) { self.alwaysBounceHorizontal = value };
    func enable(bounces v: Bool,_ h: Bool) { self.enable(bounceV: v); self.enable(bounceH: h) };
    
    // set data
    @objc func padding(_ t: CGFloat,_ l: CGFloat,_ b: CGFloat,_ r: CGFloat) {
        self.contentInset = UIEdgeInsets.init(top: t, left: l, bottom: b, right: r);
    };
    
}
