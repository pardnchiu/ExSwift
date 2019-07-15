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
    
//    struct SHADOW {
//        public var  col: UIColor, offset: CGSize, radius: CGFloat, alpha: Float
//        public init(col: UIColor,_ offset: CGSize,_ radius: CGFloat,_ alpha: Float) {
//            self.col    = col;
//            self.offset = offset;
//            self.radius = radius;
//            self.alpha  = alpha;
//        };
//    };
//    
    var _bgColor: UIColor { return (self.backgroundColor ?? .clear) };
    var _originX: CGFloat { return (self.frame.origin.x) };
    var _originY: CGFloat { return (self.frame.origin.y) };
    var _centerX: CGFloat { return (self.center.x) };
    var _centerY: CGFloat { return (self.center.y) };
    var _width: CGFloat { return (self.frame.size.width) };
    var _height: CGFloat { return (self.frame.size.height) };
    var _alpha: CGFloat { return (self.alpha) };
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
    func removeSubviews() { self.subviews.forEach { $0.removeFromSuperview() } };
    func removeSublayers() { self.layer.sublayers?.forEach { $0.removeFromSuperlayer() } };
    
    func x(_ value: CGFloat) { self.frame.origin.x = value };
    func y(_ value: CGFloat) { self.frame.origin.y = value };
    func w(_ value: CGFloat) { self.frame.size.width  = value };
    func h(_ value: CGFloat) { self.frame.size.height = value };
    func a(_ value: CGFloat) { self.alpha = value };
    
    func originX(add value: CGFloat) { self.frame.origin.x += value };
    func originY(add value: CGFloat) { self.frame.origin.y += value };
    func height(add value: CGFloat) { self.frame.size.height += value };
    func width(add value: CGFloat) { self.frame.size.width  += value };
    func alpha(add value: CGFloat) { self.alpha += value };
    
    func originX(to value: CGFloat,_ time: Double) { animation(time) { self.x(value) } };
    func originY(to value: CGFloat,_ time: Double) { animation(time) { self.y(value) } };
    func width(to value: CGFloat,_ time: Double) { animation(time) { self.w(value) } };
    func height(to value: CGFloat,_ time: Double) { animation(time) { self.h(value) } };
    func alpha(to value: CGFloat,_ time: Double) { animation(time) { self.a(value) } };
    
    func originX(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.x(value) }, completion) };
    func originY(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.y(value) }, completion) };
    func width(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.w(value) }, completion) };
    func height(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.h(value) }, completion) };
    func alpha(to value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.a(value) }, completion) };
    
    func set(originX value: CGFloat) { self.x(value) };
    func set(originY value: CGFloat) { self.y(value) };
    func set(width value: CGFloat) { self.w(value) };
    func set(height value: CGFloat) { self.h(value) };
    func set(alpha value: CGFloat) { self.a(value) };
    func set(centerX value: CGFloat) { self.center.x = value };
    func set(centerY value: CGFloat) { self.center.y = value };
    
    func set(originX: CGFloat, originY: CGFloat) { self.frame.origin = CGPoint(originX, originY) };
    func set(originX: CGFloat, width: CGFloat) { self.x(originX); self.w(width) };
    func set(originX: CGFloat, height: CGFloat) { self.x(originX); self.h(height) };
    func set(originY: CGFloat, width: CGFloat) { self.y(originY); self.w(width) };
    func set(originY: CGFloat, height: CGFloat) { self.y(originY); self.h(height) };
    func set(width: CGFloat, height: CGFloat) { self.frame.size = CGSize(width, height) };
    func set(centerX: CGFloat, centerY: CGFloat) { self.center = CGPoint(centerX, centerY) };
    
    func set(originX: CGFloat, originY: CGFloat, alpha: CGFloat) { self.x(originX); self.y(originY); self.a(alpha) };
    func set(originX: CGFloat, width: CGFloat, alpha: CGFloat) { self.x(originX); self.w(width);   self.a(alpha) };
    func set(originX: CGFloat, height: CGFloat, alpha: CGFloat) { self.x(originX); self.h(height);  self.a(alpha) };
    func set(originY: CGFloat, width: CGFloat, alpha: CGFloat) { self.y(originY); self.w(width);   self.a(alpha) };
    func set(originY: CGFloat, height: CGFloat, alpha: CGFloat) { self.y(originY); self.h(height);  self.a(alpha) };
    func set(width: CGFloat, height: CGFloat, alpha: CGFloat) { self.w(width);   self.h(height);  self.a(alpha) };
    func set(originX: CGFloat, originY: CGFloat, width: CGFloat)  { self.set(frame: originX, originY, width, self._height) };
    func set(originX: CGFloat, originY: CGFloat, height: CGFloat) { self.set(frame: originX, originY, self._width, height) };
    func set(originX: CGFloat, width: CGFloat,   height: CGFloat) { self.set(frame: originX, self._originY, width, height) };
    func set(originY: CGFloat, width: CGFloat,   height: CGFloat) { self.set(frame: self._originX, originY, width, height) };
    
    func set(originX: CGFloat, originY: CGFloat, width: CGFloat, alpha: CGFloat) { self.set(frame: originX, originY, width, self._height); self.a(alpha) };
    func set(originX: CGFloat, originY: CGFloat, height: CGFloat, alpha: CGFloat) { self.set(frame: originX, originY, self._width, height); self.a(alpha) };
    func set(originX: CGFloat, width: CGFloat, height: CGFloat, alpha: CGFloat) { self.set(frame: originX, self._originY, width, height); self.a(alpha) };
    func set(originY: CGFloat, width: CGFloat, height: CGFloat, alpha: CGFloat) { self.set(frame: self._originX, originY, width, height); self.a(alpha) };
    
    func set(frame originX: CGFloat,_ originY: CGFloat,_ width: CGFloat,_ height: CGFloat) {
        self.frame = CGRect(originX, originY, width, height)
    };
    func set(frame originX: CGFloat,_ originY: CGFloat,_ width: CGFloat,_ height: CGFloat,_ alpha: CGFloat) {
        self.frame = CGRect(originX, originY, width, height)
        self.alpha = alpha
    };
    
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
    
    func set(shadow color: UIColor) {
        let color = UIColor(rgb: color._red, color._green, color._blue, color._alpha/5)
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
        self.transform = self.transform.scaledBy(x: w/self._width, y: h/self._height);
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ time: Double) {
        animation(time) {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self._width, y: h/self._height);
        };
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) {
        animation(time, {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self._width, y: h/self._height);
        }, completion)
    }
    
    enum FIT {
        case width;
        case height;
    }
    
    enum ALIGNMENT {
        case top;
        case left;
        case bottom;
        case right;
        case center;
    }
    
    func size(toFit target: FIT,_ alignment: ALIGNMENT) {
        let aTop   : CGFloat = self._originY;
        let aLeft  : CGFloat = self._originX;
        let aBottom: CGFloat = self._originY+self._height;
        let aRight : CGFloat = self._originX+self._width;
        let aWidth : CGFloat = self._width;
        let aHeight: CGFloat = self._height;
        
        self.sizeToFit();
        switch (target) {
        case .width:
            switch (alignment) {
            case .right : self.set(originX: aRight-self._width, originY: aTop, height: aHeight)
            case .center: self.set(originX: aRight-aWidth/2-self._width/2, originY: aTop, height: aHeight)
            default     : break;
            }
        case .height:
            switch (alignment) {
            case .bottom: self.set(originX: aLeft, originY: aBottom-self._height, width: aWidth)
            case .center: self.set(originX: aLeft, originY: aBottom-aHeight/2-self._height/2, width: aWidth)
            default: break;
            }
        };
    };
    
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
