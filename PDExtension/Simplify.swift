//
//  Simplify.swift
//  PDExtension
//
//  Created by Pardn Co., Ltd on 2019/6/13.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Photos

public protocol simplify {}
public extension simplify where Self: AnyObject {
    
    func set(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self);
        return self
    };
};
extension NSObject: simplify {};
extension CGPoint : simplify {};
extension CGRect  : simplify {};
extension CGSize  : simplify {};
extension CGVector: simplify {};


public func animation(_ time: TimeInterval,_ animate: @escaping ()->Void ) {
    UIView.animate(withDuration: time, animations: animate);
};

public func animation(_ time: TimeInterval,_ animate: @escaping ()->Void,_ complet: ((Bool)->Void)?) {
    UIView.animate(withDuration: time, animations: animate, completion: complet)
};

public func delay(second value: DispatchTime,_ completion: @escaping ()->Void) {
    DispatchQueue.main.asyncAfter(deadline: value, execute: completion)
};

public func iphoneType() -> String {
    
    var systemInfo = utsname()
    uname(&systemInfo)
    
    let platform = withUnsafePointer(to: &systemInfo.machine.0) { ptr in
        return String(cString: ptr)
    }
    
    if platform == "iPhone1,1" { return "iPhone 2G"}
    if platform == "iPhone1,2" { return "iPhone 3G"}
    if platform == "iPhone2,1" { return "iPhone 3GS"}
    if platform == "iPhone3,1" { return "iPhone 4"}
    if platform == "iPhone3,2" { return "iPhone 4"}
    if platform == "iPhone3,3" { return "iPhone 4"}
    if platform == "iPhone4,1" { return "iPhone 4S"}
    if platform == "iPhone5,1" { return "iPhone 5"}
    if platform == "iPhone5,2" { return "iPhone 5"}
    if platform == "iPhone5,3" { return "iPhone 5C"}
    if platform == "iPhone5,4" { return "iPhone 5C"}
    if platform == "iPhone6,1" { return "iPhone 5S"}
    if platform == "iPhone6,2" { return "iPhone 5S"}
    if platform == "iPhone7,1" { return "iPhone 6 Plus"}
    if platform == "iPhone7,2" { return "iPhone 6"}
    if platform == "iPhone8,1" { return "iPhone 6S"}
    if platform == "iPhone8,2" { return "iPhone 6S Plus"}
    if platform == "iPhone8,4" { return "iPhone SE"}
    if platform == "iPhone9,1" { return "iPhone 7"}
    if platform == "iPhone9,2" { return "iPhone 7 Plus"}
    if platform == "iPhone10,1" { return "iPhone 8"}
    if platform == "iPhone10,2" { return "iPhone 8 Plus"}
    if platform == "iPhone10,3" { return "iPhone X"}
    if platform == "iPhone10,4" { return "iPhone 8"}
    if platform == "iPhone10,5" { return "iPhone 8 Plus"}
    if platform == "iPhone10,6" { return "iPhone X"}
    
    if platform == "iPod1,1" { return "iPod Touch 1G"}
    if platform == "iPod2,1" { return "iPod Touch 2G"}
    if platform == "iPod3,1" { return "iPod Touch 3G"}
    if platform == "iPod4,1" { return "iPod Touch 4G"}
    if platform == "iPod5,1" { return "iPod Touch 5G"}
    
    if platform == "iPad1,1" { return "iPad 1"}
    if platform == "iPad2,1" { return "iPad 2"}
    if platform == "iPad2,2" { return "iPad 2"}
    if platform == "iPad2,3" { return "iPad 2"}
    if platform == "iPad2,4" { return "iPad 2"}
    if platform == "iPad2,5" { return "iPad Mini 1"}
    if platform == "iPad2,6" { return "iPad Mini 1"}
    if platform == "iPad2,7" { return "iPad Mini 1"}
    if platform == "iPad3,1" { return "iPad 3"}
    if platform == "iPad3,2" { return "iPad 3"}
    if platform == "iPad3,3" { return "iPad 3"}
    if platform == "iPad3,4" { return "iPad 4"}
    if platform == "iPad3,5" { return "iPad 4"}
    if platform == "iPad3,6" { return "iPad 4"}
    if platform == "iPad4,1" { return "iPad Air"}
    if platform == "iPad4,2" { return "iPad Air"}
    if platform == "iPad4,3" { return "iPad Air"}
    if platform == "iPad4,4" { return "iPad Mini 2"}
    if platform == "iPad4,5" { return "iPad Mini 2"}
    if platform == "iPad4,6" { return "iPad Mini 2"}
    if platform == "iPad4,7" { return "iPad Mini 3"}
    if platform == "iPad4,8" { return "iPad Mini 3"}
    if platform == "iPad4,9" { return "iPad Mini 3"}
    if platform == "iPad5,1" { return "iPad Mini 4"}
    if platform == "iPad5,2" { return "iPad Mini 4"}
    if platform == "iPad5,3" { return "iPad Air 2"}
    if platform == "iPad5,4" { return "iPad Air 2"}
    if platform == "iPad6,3" { return "iPad Pro 9.7"}
    if platform == "iPad6,4" { return "iPad Pro 9.7"}
    if platform == "iPad6,7" { return "iPad Pro 12.9"}
    if platform == "iPad6,8" { return "iPad Pro 12.9"}
    
    if platform == "i386"   { return "iPhone Simulator"}
    if platform == "x86_64" { return "iPhone Simulator"}
    
    return platform
}

public class Interactor: UIPercentDrivenInteractiveTransition {
    public var isStarted  = false
    public var isFinished = false
}

extension Bundle {
    var displayName: String {
        return (object(forInfoDictionaryKey: "CFBundleDisplayName") as? String) ?? ""
    }
}

public extension UIEdgeInsets {
    
    init(_ top: CGFloat,_ left: CGFloat,_ bottom: CGFloat,_ right: CGFloat) { self.init(top: top, left: left, bottom: bottom, right: right) };
};

public extension MKMapView {
    
    func add_locate(_ loaded: Bool,_ address: String,_ completion: @escaping () -> Swift.Void) {
        if !loaded {
            CLGeocoder().geocodeAddressString(address, completionHandler: { (pmks:[CLPlacemark]?, error:Error?) -> Void in
                if let error = error { print(error.localizedDescription); return; };
                guard let pmk = pmks?[0], let location = pmk.location?.coordinate else { print("location error"); return; };
                
                let long: CLLocationDegrees = location.longitude,
                lat: CLLocationDegrees = location.latitude,
                span: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05),
                center: CLLocationCoordinate2D = CLLocation(latitude: long, longitude: lat).coordinate,
                region: MKCoordinateRegion = MKCoordinateRegion(center: center, span: span);
                self.setRegion(region, animated: true);
                
                let annotation = MKPointAnnotation();
                annotation.coordinate = center;
                self.showAnnotations([annotation], animated: true);
                self.selectAnnotation(annotation, animated: true);
                
                completion();
            });
        };
    };
};

public extension UIVisualEffectView {
    
    @objc convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ style: UIBlurEffect.Style) {
        self.init(effect: UIBlurEffect(style: style))
        self.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    @objc convenience init(_ frame: CGRect,_ style: UIBlurEffect.Style) {
        self.init(effect: UIBlurEffect(style: style));
        self.frame = frame;
        self.set(autolayout: frame != .zero);
    }
}

public extension UIActivityIndicatorView {
    
    @objc convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ style: UIActivityIndicatorView.Style) {
        self.init(style: style);
        self.frame = CGRect(x : x, y: y, width: w, height: h);
        self.hidesWhenStopped = true;
    }
    
    @objc convenience init(_ frame: CGRect,_ style: UIActivityIndicatorView.Style) {
        self.init(style: style);
        self.hidesWhenStopped = true;
        self.frame = frame;
        self.set(autolayout: frame != .zero);
    }
}

public extension UIPickerView {
    
    convenience init(_ frame: CGRect,_ delegate: UIPickerViewDelegate) {
        self.init(frame: frame);
        self.set(autolayout: frame != .zero);
        self.delegate = delegate;
    };
    
    convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ delegate: UIPickerViewDelegate) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h));
        self.delegate = delegate;
    };
};

extension DispatchTime: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) { self = DispatchTime.now() + .seconds(value); };
};

extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) { self = DispatchTime.now() + .milliseconds(Int(value * 1000)); };
};

public extension NSMutableAttributedString {
    @objc func col(_ col: UIColor, _ start: Int, _ count: Int) { self.addAttribute(NSAttributedString.Key.foregroundColor, value: col, range: NSMakeRange(start, count)); };
    @objc func font(_ font: UIFont, _ start: Int, _ count: Int) { self.addAttribute(NSAttributedString.Key.font, value: font, range: NSMakeRange(start, count)); };
};

public extension UIAlertController {
    
    convenience init(_ title: String?,_ message: String?,_ preferredStyle: UIAlertController.Style) {
        self.init(title: title, message: message, preferredStyle: preferredStyle);
    };
    
    @objc func action(_ ary: [UIAlertAction]) {
        for i in ary { self.addAction(i) };
    };
    
    @objc func input(_ complet: @escaping (UITextField) -> ()) {
        self.addTextField { (txt) in
            complet(txt)
        };
    };
};

public extension UIAlertAction {
    convenience init(_ title: String,_ style: UIAlertAction.Style,_ handler: ((UIAlertAction) -> Void)?) {
        self.init(title: title, style: style, handler: handler);
    };
};


public let vw: CGFloat = UIScreen.main.bounds.size.width;
public let vh: CGFloat = UIScreen.main.bounds.size.height;

public let navY: CGFloat = (_DEVICE.x ? 46 : 22);

private let sSide = (vw < vh ? vw : vh)
private let lSide = (vw < vh ? vh : vw)
private let ratio = (sSide/lSide*100)._int
public struct _DEVICE {
    public static let pad: Bool = (ratio >= 69);
    public static let x: Bool  = (ratio == 46)
    public static let N: Bool  = (ratio == 56)
    public static let L: Bool  = (lSide == 896 || lSide == 736)
    public static let xS: Bool = (ratio == 46 && lSide == 812)
    public static let xL: Bool = (ratio == 46 && lSide == 896)
    public static let nS: Bool = (ratio == 56 && lSide == 667)
    public static let nL: Bool = (ratio == 56 && lSide == 736)
    public static let se: Bool = (vh < 667);
}

public struct _TIME_BASE {
    public static let m = 60;
    public static let h = 60*60;
    public static let d = 60*60*24;
    public static let M = 60*60*24*30;
    public static let y = 60*60*24*365;
};

public struct _COLOR {
    public static let bgColor = UIColor(hex: "efefef")//UIColor(rgb: 239, 239, 244);
    public static let delete  = UIColor(rgb: 193, 15, 29);
    public struct sys {
        public struct bgc {
            public static let dark = UIColor(rgb: 39, 30, 30);
            public static let gray = UIColor(rgb: 70, 70, 70);
        };
    };
    public struct white {
        public static let _10 =  UIColor(rgb: 255, 255, 255, 0.1);
        public static let _25 =  UIColor(rgb: 255, 255, 255, 0.25);
        public static let _50 =  UIColor(rgb: 255, 255, 255, 0.5);
        public static let _75 =  UIColor(rgb: 255, 255, 255, 0.75);
        public static let _90 =  UIColor(rgb: 255, 255, 255, 0.9);
    };
    public struct black {
        public static let _10 =  UIColor(rgb: 0, 0, 0, 0.1);
        public static let _25 =  UIColor(rgb: 0, 0, 0, 0.25);
        public static let _50 =  UIColor(rgb: 0, 0, 0, 0.5);
        public static let _75 =  UIColor(rgb: 0, 0, 0, 0.75);
        public static let _90 =  UIColor(rgb: 0, 0, 0, 0.9);
    };
    public struct app {
        public static let phone = UIColor(rgb: 45, 172, 137);
        public static let mail =  UIColor(rgb: 59, 152, 209)
        public static let line =  UIColor(rgb: 56, 200, 54);
        public struct fb {
            public static let app = UIColor(rgb: 60, 105, 176);
            public static let msg = UIColor(rgb: 60, 148, 248);
        };
    };
};

public struct _ARRAY {
    public static let month = (1...12).map { $0 };
    public static var year: [Int] = {
        guard let year = Int(Date()._objc.yyyy) else { return []; };
        var ary: [Int] = [];
        ((year-60)...year).forEach { ary.insert($0, at: 0); };
        return ary
    }();
};

public struct URLSchema {
    public static let sms = "sms://";
    public static let tel = "tel://";
    public static let telprompt = "telprompt://";
    public static let mailto = "mailto://";
    public static let appStore = "itms-apps://";
    public static let line = "https://line.me/R/ti/p/~";
    public static let lineApp = "https://itunes.apple.com/tw/app/line/id443904275?mt=8";
    public struct fb {
        public static let app = "fb://profile/";
        public static let msg = "https://m.me/";
        public static let web = "https://m.facebook.com/";
    }
};

public struct panData {
    let contentOffset: CGPoint
    let isDragging: Bool
    var translation: CGPoint
    let velocity: CGPoint
}

public enum panState: String {
    case none
    case started
    case updating
    case canceling
    case finishing
}

public extension CAGradientLayer {
    
    convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) {
        self.init();
        self.frame = CGRect(x, y, w, h);
    };
    
    @objc func col(_ col: [UIColor]) {
        var ary: [CGColor] = []
        for i in col {
            ary.append(i.cgColor);
        };
        self.colors = ary
    };
};

public extension UIImage{
    
    var dark: Bool {
        //获取图片信息
        let imgWidth:Int=Int(self.size.width)/2
        let imgHeight:Int=Int(self.size.height)/2
        //位图的大小＝图片宽＊图片高＊图片中每点包含的信息量
        let bitmapByteCount=imgWidth*imgHeight*4
        //使用系统的颜色空间
        let colorSpace=CGColorSpaceCreateDeviceRGB()
        //根据位图大小，申请内存空间
        let bitmapData=malloc(bitmapByteCount)
        defer{free(bitmapData)}
        //创建一个位图
        let context=CGContext(data:bitmapData,
                              width:imgWidth,
                              height:imgHeight,
                              bitsPerComponent:8,
                              bytesPerRow:imgWidth*4,
                              space:colorSpace,
                              bitmapInfo:CGImageAlphaInfo.premultipliedLast.rawValue)
        //图片的rect
        let rect=CGRect(x:0,y:0,width:CGFloat(imgWidth),height:CGFloat(imgHeight))
        //将图片画到位图中
        context?.draw(self.cgImage!,in:rect)
        //获取位图数据
        let bitData=context?.data
        let data=unsafeBitCast(bitData,to:UnsafePointer<CUnsignedChar>.self)
        let cls=NSCountedSet.init(capacity:imgWidth*imgHeight)
        for x in 0..<imgWidth{
            for y in 0..<imgHeight{
                let offSet=(y*imgWidth+x)*4
                let r=(data+offSet).pointee
                let g=(data+offSet+1).pointee
                let b=(data+offSet+2).pointee
                let a=(data+offSet+3).pointee
                if a>0{
                    //去除透明
                    if !(r==255&&g==255&&b==255){
                        //去除白色
                        cls.add([CGFloat(r),CGFloat(g),CGFloat(b),CGFloat(a)])
                    }
                }
            }
        }
        //找到出现次数最多的颜色
        let enumerator=cls.objectEnumerator()
        var maxColor:Array<CGFloat>?=nil
        var maxCount=0
        while let curColor=enumerator.nextObject(){
            let tmpCount=cls.count(for:curColor)
            if tmpCount>=maxCount{
                maxCount=tmpCount
                maxColor=curColor as? Array<CGFloat>
            }
        }
        let count = maxColor![0]+maxColor![1]+maxColor![2]
        return (count >= 700)
        //        return UIColor.init(red:(maxColor![0]/255),green:(maxColor![1]/255),blue:(maxColor![2]/255),alpha:(maxColor![3]/255))
    }
}
