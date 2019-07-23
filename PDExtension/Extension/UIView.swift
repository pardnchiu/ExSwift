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
    
    var _bgC: UIColor { return (self.backgroundColor ?? .clear) };
    var _oX: CGFloat { return (self.frame.origin.x) };
    var _oY: CGFloat { return (self.frame.origin.y) };
    var _cX: CGFloat { return (self.center.x) };
    var _cY: CGFloat { return (self.center.y) };
    var _rX: CGFloat { return (self._oX+self._fW) };
    var _bY: CGFloat { return (self._oY+self._fH) };
    var _fW: CGFloat { return (self.frame.size.width) };
    var _fH: CGFloat { return (self.frame.size.height) };
    var _a: CGFloat { return (self.alpha) };
};

public extension UIView {
    
    @objc convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h));
    };
    
    @objc convenience init(_ frame: CGRect) {
        self.init(frame: frame);
        self.set(autolayout: frame != .zero);
    };
    
    func superView<T: UIView>(of: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let father = view as? T {
                return father;
            };
        };
        return nil;
    };
    
    func removeSubviews() { self.subviews.forEach { $0.removeFromSuperview() } };
    func removeSublayers() { self.layer.sublayers?.forEach { $0.removeFromSuperlayer() } };
    
    func set(oX value: CGFloat) { self.frame.origin.x = value };
    func set(oY value: CGFloat) { self.frame.origin.y = value };
    func set(fW value: CGFloat) { self.frame.size.width  = value };
    func set(fH value: CGFloat) { self.frame.size.height = value };
    func set(cX value: CGFloat) { self.center.x = value };
    func set(cY value: CGFloat) { self.center.y = value };
    func set(a value: CGFloat) { self.alpha = value };
    
    func set(oX: CGFloat, oY: CGFloat) { self.frame.origin = CGPoint(oX, oY) };
    func set(oX: CGFloat, cY: CGFloat) { self.set(oX: oX); self.set(cY: cY) };
    func set(oX: CGFloat, fW: CGFloat) { self.set(oX: oX); self.set(fW: fW) };
    func set(oX: CGFloat, fH: CGFloat) { self.set(oX: oX); self.set(fH: fH) };
    func set(oX: CGFloat, a: CGFloat) { self.set(oX: oX); self.set(a: a) };
    
    func set(oY: CGFloat, cX: CGFloat) { self.set(oY: oY); self.set(cX: cX) };
    func set(oY: CGFloat, fW: CGFloat) { self.set(oY: oY); self.set(fW: fW) };
    func set(oY: CGFloat, fH: CGFloat) { self.set(oY: oY); self.set(fH: fH) };
    func set(oY: CGFloat, a: CGFloat) { self.set(oY: oY); self.set(a: a) };
    
    func set(fW: CGFloat, cX: CGFloat) { self.set(fW: fW); self.set(cX: cX) };
    func set(fW: CGFloat, cY: CGFloat) { self.set(fW: fW); self.set(cY: cY) };
    func set(fW: CGFloat, fH: CGFloat) { self.frame.size = CGSize(fW, fH) };
    func set(fW: CGFloat, a: CGFloat) { self.set(fW: fW); self.set(a: a) };
    
    func set(fH: CGFloat, cX: CGFloat) { self.set(fH: fH); self.set(cX: cX) };
    func set(fH: CGFloat, cY: CGFloat) { self.set(fH: fH); self.set(cY: cY) };
    func set(fH: CGFloat, a: CGFloat) { self.set(fH: fH); self.set(a: a) };
    
    func set(cX: CGFloat, cY: CGFloat) { self.center = CGPoint(cX, cY) };
    func set(cX: CGFloat, a: CGFloat) { self.set(cX: cX); self.set(a: a) };
    
    func set(oX: CGFloat, oY: CGFloat, fW: CGFloat) { self.set(frame: oX, oY, fW, self._fH) };
    func set(oX: CGFloat, oY: CGFloat, fH: CGFloat) { self.set(frame: oX, oY, self._fW, fH) };
    func set(oX: CGFloat, oY: CGFloat, a: CGFloat) { self.set(oX: oX); self.set(oY: oY); self.set(a: a) };
    
    func set(oX: CGFloat, fW: CGFloat, fH: CGFloat) { self.set(frame: oX, self._oY, fW, fH) };
    func set(oX: CGFloat, fW: CGFloat, a: CGFloat) { self.set(oX: oX); self.set(fW: fW); self.set(a: a) };
    
    func set(oX: CGFloat, fH: CGFloat, a: CGFloat) { self.set(oX: oX); self.set(fH: fH); self.set(a: a) };
    
    func set(oY: CGFloat, fW: CGFloat, a: CGFloat) { self.set(oY: oY); self.set(fW: fW); self.set(a: a) };
    func set(oY: CGFloat, fW: CGFloat, fH: CGFloat) { self.set(frame: self._oX, oY, fW, fH) };
    
    func set(oY: CGFloat, fH: CGFloat, a: CGFloat) { self.set(oY: oY); self.set(fH: fH); self.set(a: a) };
    
    func set(fW: CGFloat, fH: CGFloat, a: CGFloat) { self.set(fW: fW); self.set(fH: fH);  self.set(a: a) };
    
    func set(oX: CGFloat, oY: CGFloat, fW: CGFloat, a: CGFloat) { self.set(frame: oX, oY, fW, self._fH); self.set(a: a) };
    func set(oX: CGFloat, oY: CGFloat, fH: CGFloat, a: CGFloat) { self.set(frame: oX, oY, self._fW, fH); self.set(a: a) };
    func set(oX: CGFloat, fW: CGFloat, fH: CGFloat, a: CGFloat) { self.set(frame: oX, self._oY, fW, fH); self.set(a: a) };
    func set(oY: CGFloat, fF: CGFloat, fH: CGFloat, a: CGFloat) { self.set(frame: self._oX, oY, fF, fH); self.set(a: a) };
    
    func set(frame originX: CGFloat,_ originY: CGFloat,_ width: CGFloat,_ height: CGFloat) {
        self.frame = CGRect(originX, originY, width, height)
    };
    func set(frame originX: CGFloat,_ originY: CGFloat,_ width: CGFloat,_ height: CGFloat,_ alpha: CGFloat) {
        self.frame = CGRect(originX, originY, width, height)
        self.alpha = alpha
    };
    
    func add(oX value: CGFloat) { self.frame.origin.x += value };
    func add(oY value: CGFloat) { self.frame.origin.y += value };
    func add(fW value: CGFloat) { self.frame.size.width  += value };
    func add(fH value: CGFloat) { self.frame.size.height += value };
    func add(a value: CGFloat) { self.alpha += value };
    
    func to(oX value: CGFloat,_ time: Double) { animation(time) { self.set(oX: value) } };
    func to(oY value: CGFloat,_ time: Double) { animation(time) { self.set(oY: value) } };
    func to(fW value: CGFloat,_ time: Double) { animation(time) { self.set(fW: value) } };
    func to(fH value: CGFloat,_ time: Double) { animation(time) { self.set(fH: value) } };
    func to(a value: CGFloat,_ time: Double) { animation(time) { self.set(a: value) } };
    
    func to(oX value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(oX: value) }, completion) };
    func to(oY value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(oY: value) }, completion) };
    func to(fW value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(fW: value) }, completion) };
    func to(fH value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(fH: value) }, completion) };
    func to(a value: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) { animation(time, { self.set(a: value) }, completion) };
    
    func to(oX: CGFloat, oY: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, oY: oY) } };
    func to(oX: CGFloat, fW: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, fW: fW) } };
    func to(oX: CGFloat, fH: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, fH: fH) } };
    func to(oY: CGFloat, fW: CGFloat,_ time: Double) { animation(time) { self.set(oY: oY, fW: fW) } };
    func to(oY: CGFloat, fH: CGFloat,_ time: Double) { animation(time) { self.set(oY: oY, fH: fH) } };
    func to(cX: CGFloat, cY: CGFloat,_ time: Double) { animation(time) { self.set(cX: cX, cY: cY) } };
    func to(oX: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, a: a) } };
    func to(oY: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oY: oY, a: a) } };
    func to(fW: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(fW: fW, a: a) } };
    func to(fH: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(fH: fH, a: a) } };
    
    func to(oX: CGFloat, oY: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, oY: oY, a: a) } };
    func to(oX: CGFloat, fW: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, fW: fW, a: a) } };
    func to(oX: CGFloat, fH: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, fH: fH, a: a) } };
    func to(oY: CGFloat, fW: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oY: oY, fW: fW, a: a) } };
    func to(oY: CGFloat, fH: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oY: oY, fH: fH, a: a) } };
    func to(oX: CGFloat, oY: CGFloat, fW: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, oY: oY, fW: fW) } };
    func to(oX: CGFloat, oY: CGFloat, fH: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, oY: oY, fH: fH) } };
    
    func to(oX: CGFloat, oY: CGFloat, fW: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, oY: oY, fW: fW, a: a) } };
    func to(oX: CGFloat, oY: CGFloat, fH: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(oX: oX, oY: oY, fH: fH, a: a) } };
    
    func set(autolayout bool: Bool) { self.translatesAutoresizingMaskIntoConstraints = bool };
    func set(hidden bool: Bool) { self.isHidden = bool };
    
    func set(radius cgflt: CGFloat,_ mask: Bool) {
        self.layer.cornerRadius  = cgflt;
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
        self.transform = self.transform.scaledBy(x: w/self._fW, y: h/self._fH);
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ time: Double) {
        animation(time) {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self._fW, y: h/self._fH);
        };
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) {
        animation(time, {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self._fW, y: h/self._fH);
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
        let aTop   : CGFloat = self._oY;
        let aLeft  : CGFloat = self._oX;
        let aBottom: CGFloat = self._oY+self._fH;
        let aRight : CGFloat = self._oX+self._fW;
        let aWidth : CGFloat = self._fW;
        let aHeight: CGFloat = self._fH;
        
        self.sizeToFit();
        DispatchQueue.main.async {
            switch (target) {
            case .width:
                switch (alignment) {
                case .right : self.set(oX: aRight-self._fW, oY: aTop, fH: aHeight)
                case .center: self.set(oX: aRight-aWidth/2-self._fW/2, oY: aTop, fH: aHeight)
                default     : break;
                }
            case .height:
                switch (alignment) {
                case .bottom: self.set(oX: aLeft, oY: aBottom-self._fH, fW: aWidth)
                case .center: self.set(oX: aLeft, oY: aBottom-aHeight/2-self._fH/2, fW: aWidth)
                default: break;
                }
            };
        }
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
    
    func set(bgC value: UIColor) { self.backgroundColor = value };
    func set(bgC r: CGFloat,_ g: CGFloat,_ b: CGFloat) { self.backgroundColor = UIColor(rgb: r, g, b) };
    func set(bgC r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) { self.backgroundColor = UIColor(rgb: r, g, b, a) };
    func set(bgC hex: String) { self.backgroundColor = UIColor(hex: hex) };
    func set(bgC hex: String,_ a: CGFloat) { self.backgroundColor = UIColor(hex: hex, a) };
    
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
    
    func draw(_ width: CGFloat,_ height: CGFloat,_ completion: @escaping (UIImage?)->Void) {
        UIGraphicsBeginImageContextWithOptions(CGSize(width, height), false, 0)
        self.drawHierarchy(in: CGRect(0, 0, width, height), afterScreenUpdates: true)
        if let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            completion(image)
        } else {
            completion(nil)
        }
    }
    
    func bring(toFront ary: [UIView?]) { ary.forEach { self.bringSubviewToFront($0 ?? UIView()) } }
    
};
