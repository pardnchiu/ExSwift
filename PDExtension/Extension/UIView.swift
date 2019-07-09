//
//  UIViewExtension.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/6/30.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    struct SHADOW {
        public var  col: UIColor, offset: CGSize, radius: CGFloat, alpha: Float
        public init(col: UIColor,_ offset: CGSize,_ radius: CGFloat,_ alpha: Float) {
            self.col    = col;
            self.offset = offset;
            self.radius = radius;
            self.alpha  = alpha;
        };
    };
    
    var _bgColor: UIColor { return (self.backgroundColor ?? .clear) };
    var _x: CGFloat { return (self.frame.origin.x) };
    var _y: CGFloat { return (self.frame.origin.y) };
    var _w: CGFloat { return (self.frame.size.width) };
    var _h: CGFloat { return (self.frame.size.height) };
    var _a: CGFloat { return (self.alpha) };
};

public extension UIView {
    
    @objc convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h));
    };
    
    @objc convenience init(_ frame: CGRect) {
        switch (frame) {
        case .zero: self.init(); self.autolayout();
        default   : self.init(frame: frame);
        };
    };
    
    func superView<T: UIView>(of: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let father = view as? T {
                return father;
            };
        };
        return nil;
    };
    
    func autolayout() { self.translatesAutoresizingMaskIntoConstraints = false };
    
    func x(_ value: CGFloat) { self.frame.origin.x = value };
    func y(_ value: CGFloat) { self.frame.origin.y = value };
    func w(_ value: CGFloat) { self.frame.size.width  = value };
    func h(_ value: CGFloat) { self.frame.size.height = value };
    func a(_ value: CGFloat) { self.alpha = value };
    
    func x(add value: CGFloat) { self.frame.origin.x += value };
    func y(add value: CGFloat) { self.frame.origin.y += value };
    func h(add value: CGFloat) { self.frame.size.height += value };
    func w(add value: CGFloat) { self.frame.size.width  += value };
    func a(add value: CGFloat) { self.alpha += value };
    
    func x(to value: CGFloat,_ time: Double) { animation(time) { self.x(value) } };
    func y(to value: CGFloat,_ time: Double) { animation(time) { self.y(value) } };
    func w(to value: CGFloat,_ time: Double) { animation(time) { self.w(value) } };
    func h(to value: CGFloat,_ time: Double) { animation(time) { self.h(value) } };
    func a(to value: CGFloat,_ time: Double) { animation(time) { self.a(value) } };
    
    func x(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.x(value) }, completion) };
    func y(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.y(value) }, completion) };
    func w(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.w(value) }, completion) };
    func h(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.h(value) }, completion) };
    func a(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.a(value) }, completion) };
    
//    func set(frame x: CGFloat?,_ y: CGFloat?,_ width: CGFloat?,_ height: CGFloat?) {
//        if let x = x { self.x(x) };
//        if let y = y { self.y(y) };
//        if let width = width { self.w(width) };
//        if let height = height { self.h(height) };
//    };
    
    func set(x: CGFloat) { self.x(x) };
    func set(y: CGFloat) { self.y(y) };
    func set(w: CGFloat) { self.w(w) };
    func set(h: CGFloat) { self.h(h) };
    func set(a: CGFloat) { self.a(a) };
    func set(x: CGFloat, y: CGFloat) { self.x(x); self.y(y) };
    func set(x: CGFloat, w: CGFloat) { self.x(x); self.w(w) };
    func set(x: CGFloat, h: CGFloat) { self.x(x); self.h(h) };
    func set(y: CGFloat, w: CGFloat) { self.y(y); self.w(w) };
    func set(y: CGFloat, h: CGFloat) { self.y(y); self.h(h) };
    func set(w: CGFloat, h: CGFloat) { self.w(w); self.h(h) };
    func set(x: CGFloat, y: CGFloat, a: CGFloat) { self.x(x); self.y(y); self.a(a) };
    func set(x: CGFloat, w: CGFloat, a: CGFloat) { self.x(x); self.w(w); self.a(a) };
    func set(x: CGFloat, h: CGFloat, a: CGFloat) { self.x(x); self.h(h); self.a(a) };
    func set(y: CGFloat, w: CGFloat, a: CGFloat) { self.y(y); self.w(w); self.a(a) };
    func set(y: CGFloat, h: CGFloat, a: CGFloat) { self.y(y); self.h(h); self.a(a) };
    func set(w: CGFloat, h: CGFloat, a: CGFloat) { self.w(w); self.h(h); self.a(a) };
    func set(x: CGFloat, y: CGFloat, w: CGFloat) { self.x(x); self.y(y); self.w(w) };
    func set(x: CGFloat, y: CGFloat, h: CGFloat) { self.x(x); self.y(y); self.h(h) };
    func set(x: CGFloat, w: CGFloat, h: CGFloat) { self.x(x); self.w(w); self.h(h) };
    func set(y: CGFloat, w: CGFloat, h: CGFloat) { self.y(y); self.w(w); self.h(h) };
    func set(x: CGFloat, y: CGFloat, w: CGFloat, a: CGFloat) { self.x(x); self.y(y); self.w(w); self.a(a) };
    func set(x: CGFloat, y: CGFloat, h: CGFloat, a: CGFloat) { self.x(x); self.y(y); self.h(h); self.a(a) };
    func set(x: CGFloat, w: CGFloat, h: CGFloat, a: CGFloat) { self.x(x); self.w(w); self.h(h); self.a(a) };
    func set(y: CGFloat, w: CGFloat, h: CGFloat, a: CGFloat) { self.y(y); self.w(w); self.h(h); self.a(a) };
    func set(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) { self.x(x); self.y(y); self.w(w); self.h(h) };
    func set(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, a: CGFloat) { self.x(x); self.y(y); self.w(w); self.h(h); self.a(a) };
    
    func set(toX value: CGFloat,_ time: Double) { self.x(to: value, time) };
    func set(toY value: CGFloat,_ time: Double) { self.y(to: value, time) };
    func set(toW value: CGFloat,_ time: Double) { self.w(to: value, time) };
    func set(toH value: CGFloat,_ time: Double) { self.h(to: value, time) };
    func set(toA value: CGFloat,_ time: Double) { self.a(to: value, time) };
    func set(toX value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { x(to: value, time, completion) };
    func set(toY value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { y(to: value, time, completion) };
    func set(toW value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { w(to: value, time, completion) };
    func set(toH value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { h(to: value, time, completion) };
    func set(toA value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { a(to: value, time, completion) };
    
    func set(hidden value: Bool) {
        self.isHidden = value;
    };
    
    func set(radius value: CGFloat,_ mask: Bool) {
        self.layer.cornerRadius  = value;
        self.layer.masksToBounds = mask;
    };
    
    func set(border color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor;
        self.layer.borderWidth = width;
    };
    
    func set(border r: CGFloat,_ g: CGFloat,_ b: CGFloat, width: CGFloat) {
        self.layer.borderColor = UIColor(rgb: r, g, b).cgColor;
        self.layer.borderWidth = width;
        
    };
    
    func set(border r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat, width: CGFloat) {
        self.layer.borderColor = UIColor(rgb: r, g, b, a).cgColor;
        self.layer.borderWidth = width;
        
    };
    
    func set(border hex: String, width: CGFloat) {
        self.layer.borderColor = UIColor(hex: hex).cgColor;
        self.layer.borderWidth = width;
        
    };
    
    func set(border hex: String,_ a: CGFloat, width: CGFloat) {
        self.layer.borderColor = UIColor(hex: hex, a).cgColor;
        self.layer.borderWidth = width;
    };
    
//    func set(shadow value: SHADOW,_ mask: Bool) {
//        self.layer.shadowColor   = value.col.cgColor;
//        self.layer.shadowOffset  = value.offset;
//        self.layer.shadowRadius  = value.radius;
//        self.layer.shadowOpacity = value.alpha;
//        self.layer.masksToBounds = mask;
//    };
    
    func set(shadow color: UIColor) {
        let color = UIColor(rgb: color._r, color._g, color._b, color._a/5)
        self.layer.shadowColor   = color.cgColor;
        self.layer.shadowOffset  = CGSize(0, 0);
        self.layer.shadowRadius  = 5;
        self.layer.shadowOpacity = 1;
        self.layer.masksToBounds = false;
    };
    
    func set(shadow color: UIColor,_ offset: CGSize,_ radius: CGFloat,_ opacity: Float) {
        self.layer.shadowColor   = color.cgColor;
        self.layer.shadowOffset  = offset;
        self.layer.shadowRadius  = radius;
        self.layer.shadowOpacity = opacity;
        self.layer.masksToBounds = false;
    };
    
    func set(scale x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) {
        self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
        self.transform = self.transform.scaledBy(x: w/self._w, y: h/self._h);
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ time: Double) {
        animation(time) {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self._w, y: h/self._h);
        };
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) {
        animation(time, {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self._w, y: h/self._h);
        }, completion)
    }
    
    func x(equal to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.centerXAnchor.equal(to: to, value).isActive = true };
    func y(equal to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.centerYAnchor.equal(to: to, value).isActive = true };
    func t(equal to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.topAnchor.equal(to: to, value).isActive     = true };
    func l(equal to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.leftAnchor.equal(to: to, value).isActive    = true };
    func b(equal to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.bottomAnchor.equal(to: to, value).isActive  = true };
    func r(equal to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.rightAnchor.equal(to: to, value).isActive   = true };
    func w(equal to: NSLayoutDimension?,_ value: CGFloat) { ((to != nil) ? self.widthAnchor.equal(to: to!, value) : self.widthAnchor.equal(value)).isActive = true };
    func h(equal to: NSLayoutDimension?,_ value: CGFloat) { ((to != nil) ? self.heightAnchor.equal(to: to!, value) : self.heightAnchor.equal(value)).isActive = true };
    
    func x(greater to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.centerXAnchor.greater(to: to, value).isActive = true };
    func y(greater to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.centerYAnchor.greater(to: to, value).isActive = true };
    func t(greater to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.topAnchor.greater(to: to, value).isActive     = true };
    func l(greater to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.leftAnchor.greater(to: to, value).isActive    = true };
    func b(greater to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.bottomAnchor.greater(to: to, value).isActive  = true };
    func r(greater to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.rightAnchor.greater(to: to, value).isActive   = true };
    func w(greater to: NSLayoutDimension?,_ value: CGFloat) { ((to != nil) ? self.widthAnchor.greater(to: to!, value) : self.widthAnchor.greater(value)).isActive = true };
    func h(greater to: NSLayoutDimension?,_ value: CGFloat) { ((to != nil) ? self.heightAnchor.greater(to: to!, value) : self.heightAnchor.greater(value)).isActive = true };
    
    func x(less to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.centerXAnchor.less(to: to, value).isActive = true };
    func y(less to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.centerYAnchor.less(to: to, value).isActive = true };
    func t(less to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.topAnchor.less(to: to, value).isActive     = true };
    func l(less to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.leftAnchor.less(to: to, value).isActive    = true };
    func b(less to: NSLayoutYAxisAnchor,_ value: CGFloat) { self.bottomAnchor.less(to: to, value).isActive  = true };
    func r(less to: NSLayoutXAxisAnchor,_ value: CGFloat) { self.rightAnchor.less(to: to, value).isActive   = true };
    func w(less to: NSLayoutDimension?,_ value: CGFloat) { ((to != nil) ? self.widthAnchor.less(to: to!, value) : self.widthAnchor.less(value)).isActive = true };
    func h(less to: NSLayoutDimension?,_ value: CGFloat) { ((to != nil) ? self.heightAnchor.less(to: to!, value) : self.heightAnchor.less(value)).isActive = true };
    
    func set(subviews ary: [UIView?]) { ary.forEach { self.addSubview($0 ?? UIView()) } };
    func set(sublayers ary: [CALayer?]) { ary.forEach { self.layer.addSublayer($0 ?? CALayer()) } };
    func set(subs values: [Any?]) {
        values.forEach {
            if let view = $0 as? UIView {
                self.addSubview(view)
            }
            if let layer = $0 as? CALayer {
                self.layer.addSublayer(layer)
            }
        }
    }
    
    func set(bgColor value: UIColor) { self.backgroundColor = value };
    func set(bgColor r: CGFloat,_ g: CGFloat,_ b: CGFloat) { self.backgroundColor = UIColor(rgb: r, g, b) };
    func set(bgColor r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) { self.backgroundColor = UIColor(rgb: r, g, b, a) };
    func set(bgColor hex: String) { self.backgroundColor = UIColor(hex: hex) };
    func set(bgColor hex: String,_ a: CGFloat) { self.backgroundColor = UIColor(hex: hex, a) };
    
    func set(pan target: Any?,_ selector: Selector?) {
        let pan = UIPanGestureRecognizer(target: target, action: selector);
        self.addGestureRecognizer(pan);
    };
    
    func set(tap target: Any?,_ taps: Int,_ touches: Int,_ selector: Selector?) {
        let tap = UITapGestureRecognizer(target: target, action: selector).set {
            $0.numberOfTapsRequired    = taps;
            $0.numberOfTouchesRequired = touches;
        };
        self.addGestureRecognizer(tap);
    };
    
    func set(press target: Any?,_ selector: Selector?) {
        let tap = UILongPressGestureRecognizer(target: target, action: selector);
        self.addGestureRecognizer(tap);
    }
};
