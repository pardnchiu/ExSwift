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
    
    var bgC: UIColor { return (self.backgroundColor ?? .clear) };
    var ox: CGFloat { return (self.frame.origin.x) };
    var oy: CGFloat { return (self.frame.origin.y) };
    var cx: CGFloat { return (self.center.x) };
    var cy: CGFloat { return (self.center.y) };
    var rx: CGFloat { return (self.ox+self.fw) };
    var by: CGFloat { return (self.oy+self.fh) };
    var fw: CGFloat { return (self.frame.size.width) };
    var fh: CGFloat { return (self.frame.size.height) };
    var a : CGFloat { return (self.alpha) };
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
    
    func set(ox value: CGFloat) { self.frame.origin.x = value };
    func set(oy value: CGFloat) { self.frame.origin.y = value };
    func set(fw value: CGFloat) { self.frame.size.width  = value };
    func set(fh value: CGFloat) { self.frame.size.height = value };
    func set(cx value: CGFloat) { self.center.x = value };
    func set(cy value: CGFloat) { self.center.y = value };
    func set(a  value: CGFloat) { self.alpha = value };
    
    func set(ox: CGFloat, oy: CGFloat) { self.frame.origin = CGPoint(ox, oy) };
    func set(ox: CGFloat, cy: CGFloat) { self.set(ox: ox); self.set(cy: cy) };
    func set(ox: CGFloat, fw: CGFloat) { self.set(ox: ox); self.set(fw: fw) };
    func set(ox: CGFloat, fh: CGFloat) { self.set(ox: ox); self.set(fh: fh) };
    func set(ox: CGFloat, a : CGFloat) { self.set(ox: ox); self.set(a: a) };
    func set(oy: CGFloat, cx: CGFloat) { self.set(oy: oy); self.set(cx: cx) };
    func set(oy: CGFloat, fw: CGFloat) { self.set(oy: oy); self.set(fw: fw) };
    func set(oy: CGFloat, fh: CGFloat) { self.set(oy: oy); self.set(fh: fh) };
    func set(oy: CGFloat, a : CGFloat) { self.set(oy: oy); self.set(a: a) };
    func set(fw: CGFloat, cx: CGFloat) { self.set(fw: fw); self.set(cx: cx) };
    func set(fw: CGFloat, cy: CGFloat) { self.set(fw: fw); self.set(cy: cy) };
    func set(fw: CGFloat, fh: CGFloat) { self.frame.size = CGSize(fw, fh) };
    func set(fw: CGFloat, a : CGFloat) { self.set(fw: fw); self.set(a: a) };
    func set(fh: CGFloat, cx: CGFloat) { self.set(fh: fh); self.set(cx: cx) };
    func set(fh: CGFloat, cy: CGFloat) { self.set(fh: fh); self.set(cy: cy) };
    func set(fh: CGFloat, a : CGFloat) { self.set(fh: fh); self.set(a: a) };
    func set(cx: CGFloat, cy: CGFloat) { self.center = CGPoint(cx, cy) };
    func set(cx: CGFloat, a : CGFloat) { self.set(cx: cx); self.set(a: a) };
    
    func set(ox: CGFloat, oy: CGFloat, fw: CGFloat) { self.set(frame: ox, oy, fw, self.fh) };
    func set(ox: CGFloat, oy: CGFloat, fh: CGFloat) { self.set(frame: ox, oy, self.fw, fh) };
    func set(ox: CGFloat, oy: CGFloat, a : CGFloat) { self.set(ox: ox, oy: oy); self.set(a: a) };
    func set(ox: CGFloat, fw: CGFloat, fh: CGFloat) { self.set(frame: ox, self.oy, fw, fh) };
    func set(ox: CGFloat, fw: CGFloat, a : CGFloat) { self.set(ox: ox); self.set(fw: fw); self.set(a: a) };
    func set(ox: CGFloat, fh: CGFloat, a : CGFloat) { self.set(ox: ox); self.set(fh: fh); self.set(a: a) };
    func set(oy: CGFloat, fw: CGFloat, a : CGFloat) { self.set(oy: oy); self.set(fw: fw); self.set(a: a) };
    func set(oy: CGFloat, fw: CGFloat, fh: CGFloat) { self.set(frame: self.ox, oy, fw, fh) };
    func set(oy: CGFloat, fh: CGFloat, a : CGFloat) { self.set(oy: oy); self.set(fh: fh); self.set(a: a) };
    func set(fw: CGFloat, fh: CGFloat, a : CGFloat) { self.set(fw: fw, fh: fh);  self.set(a: a) };

    func set(ox: CGFloat, oy: CGFloat, fw: CGFloat, a: CGFloat) { self.set(frame: ox, oy, fw, self.fh); self.set(a: a) };
    func set(ox: CGFloat, oy: CGFloat, fh: CGFloat, a: CGFloat) { self.set(frame: ox, oy, self.fw, fh); self.set(a: a) };
    func set(ox: CGFloat, fw: CGFloat, fh: CGFloat, a: CGFloat) { self.set(frame: ox, self.oy, fw, fh); self.set(a: a) };
    func set(oy: CGFloat, fw: CGFloat, fh: CGFloat, a: CGFloat) { self.set(frame: self.ox, oy, fw, fh); self.set(a: a) };
    
    func set(frame ox: CGFloat,_ oy: CGFloat,_ fw: CGFloat,_ fh: CGFloat) { self.frame = CGRect(ox, oy, fw, fh) };
    func set(frame ox: CGFloat,_ oy: CGFloat,_ fw: CGFloat,_ fh: CGFloat,_ a: CGFloat) { self.frame = CGRect(ox, oy, fw, fh); self.set(a: a) };
    
    func add(ox value: CGFloat) { self.frame.origin.x += value };
    func add(oy value: CGFloat) { self.frame.origin.y += value };
    func add(fw value: CGFloat) { self.frame.size.width  += value };
    func add(fh value: CGFloat) { self.frame.size.height += value };
    func add(a  value: CGFloat) { self.alpha += value };
    
    func to(bgC value: UIColor,_ seconds: Double) { animation(seconds) { self.set(bgC: value) } };
    func to(ox  value: CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: value) } };
    func to(oy  value: CGFloat,_ seconds: Double) { animation(seconds) { self.set(oy: value) } };
    func to(fw  value: CGFloat,_ seconds: Double) { animation(seconds) { self.set(fw: value) } };
    func to(fH  value: CGFloat,_ seconds: Double) { animation(seconds) { self.set(fh: value) } };
    func to(a   value: CGFloat,_ seconds: Double) { animation(seconds) { self.set(a: value) } };
    
    func to(ox value: CGFloat,_ seconds: Double,_ completion: ((Bool)->Void)?) { animation(seconds, { self.set(ox: value) }, completion) };
    func to(oy value: CGFloat,_ seconds: Double,_ completion: ((Bool)->Void)?) { animation(seconds, { self.set(oy: value) }, completion) };
    func to(fw value: CGFloat,_ seconds: Double,_ completion: ((Bool)->Void)?) { animation(seconds, { self.set(fw: value) }, completion) };
    func to(fh value: CGFloat,_ seconds: Double,_ completion: ((Bool)->Void)?) { animation(seconds, { self.set(fh: value) }, completion) };
    func to(a  value: CGFloat,_ seconds: Double,_ completion: ((Bool)->Void)?) { animation(seconds, { self.set(a: value) }, completion) };
    
    func to(ox: CGFloat, oy: CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, oy: oy) } };
    func to(ox: CGFloat, fw: CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, fw: fw) } };
    func to(ox: CGFloat, fh: CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, fh: fh) } };
    func to(oy: CGFloat, fw: CGFloat,_ seconds: Double) { animation(seconds) { self.set(oy: oy, fw: fw) } };
    func to(oy: CGFloat, fh: CGFloat,_ seconds: Double) { animation(seconds) { self.set(oy: oy, fh: fh) } };
    func to(cx: CGFloat, cy: CGFloat,_ seconds: Double) { animation(seconds) { self.set(cx: cx, cy: cy) } };
    func to(ox: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, a: a) } };
    func to(oy: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(oy: oy, a: a) } };
    func to(fw: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(fw: fw, a: a) } };
    func to(fh: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(fh: fh, a: a) } };
    
    func to(ox: CGFloat, oy: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, oy: oy, a: a) } };
    func to(ox: CGFloat, fw: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, fw: fw, a: a) } };
    func to(ox: CGFloat, fh: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, fh: fh, a: a) } };
    func to(oy: CGFloat, fw: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(oy: oy, fw: fw, a: a) } };
    func to(oy: CGFloat, fh: CGFloat, a : CGFloat,_ seconds: Double) { animation(seconds) { self.set(oy: oy, fh: fh, a: a) } };
    func to(ox: CGFloat, oy: CGFloat, fw: CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, oy: oy, fw: fw) } };
    func to(ox: CGFloat, oy: CGFloat, fh: CGFloat,_ seconds: Double) { animation(seconds) { self.set(ox: ox, oy: oy, fh: fh) } };
    
    func to(ox: CGFloat, oy: CGFloat, fw: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(ox: ox, oy: oy, fw: fw, a: a) } };
    func to(ox: CGFloat, oy: CGFloat, fh: CGFloat, a: CGFloat,_ time: Double) { animation(time) { self.set(ox: ox, oy: oy, fh: fh, a: a) } };
    
    func set(autolayout bool: Bool) { self.translatesAutoresizingMaskIntoConstraints = bool };
    func set(hidden bool: Bool) { self.isHidden = bool };
    
    func set(radius value: CGFloat,_ mask: Bool) { self.layer.cornerRadius = value; self.layer.masksToBounds = mask };
    
    func set(border color: UIColor, width: CGFloat) { self.layer.borderColor = color.cgColor; self.layer.borderWidth = width };
    func set(border r: CGFloat,_ g: CGFloat,_ b: CGFloat, width: CGFloat) { self.set(border: UIColor(rgb: r, g, b), width: width) };
    func set(border r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat, width: CGFloat) { self.set(border: UIColor(rgb: r, g, b, a), width: width) };
    func set(border hex: String, width: CGFloat) { self.set(border: UIColor(hex: hex), width: width) };
    func set(border hex: String,_ a: CGFloat, width: CGFloat) { self.set(border: UIColor(hex: hex, a), width: width) };
    
    func set(shadow value: UIColor) {
        let color = UIColor(rgb: value._red, value._green, value._blue, value._alpha/5)
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
        self.transform = self.transform.scaledBy(x: w/self.fw, y: h/self.fh);
    };
    
    func set(scale x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ a: CGFloat) {
        self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
        self.transform = self.transform.scaledBy(x: w/self.fw, y: h/self.fh);
        self.alpha     = a
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ time: Double) {
        animation(time) {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self.fw, y: h/self.fh);
        };
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ a: CGFloat,_ time: Double) {
        animation(time) {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self.fw, y: h/self.fh);
            self.alpha     = a
        };
    };
    
    func set(scaleTo x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ time: Double,_ completion: ((Bool)->Void)?) {
        animation(time, {
            self.layer.position = CGPoint(x: x+w/2, y: y+h/2);
            self.transform = self.transform.scaledBy(x: w/self.fw, y: h/self.fh);
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
        let aTop   : CGFloat = self.oy;
        let aLeft  : CGFloat = self.ox;
        let aBottom: CGFloat = self.oy+self.fh;
        let aRight : CGFloat = self.ox+self.fw;
        let aWidth : CGFloat = self.fw;
        let aHeight: CGFloat = self.fh;
        
        self.sizeToFit();
        DispatchQueue.main.async {
            switch (target) {
            case .width:
                switch (alignment) {
                case .right : self.set(ox: aRight-self.fw, oy: aTop, fh: aHeight)
                case .center: self.set(ox: aRight-aWidth/2-self.fw/2, oy: aTop, fh: aHeight)
                default     : break;
                }
            case .height:
                switch (alignment) {
                case .bottom: self.set(ox: aLeft, oy: aBottom-self.fh, fw: aWidth)
                case .center: self.set(ox: aLeft, oy: aBottom-aHeight/2-self.fh/2, fw: aWidth)
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
