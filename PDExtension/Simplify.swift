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

public extension Bool {
    
    func function(TRUE: ()->(), FALSE: ()->()) {
        if (self) {
            TRUE();
            return
        };
        FALSE();
    };
};

public extension NSNumber {
    
    var _int: Int {
        return Int(truncating: self)
    }
}

public extension CGFloat {
    
    var _int: Int {
        return Int(self)
    }
}

public extension Date {
    
    struct object {
        public var yy  : String;
        public var yyyy: String;
        public var M   : String;
        public var MM  : String;
        public var MMM : String;
        public var MMMM: String;
        public var E   : String;
        public var EEEE: String;
        public var dd  : String;
        public var d   : String;
        public var h   : String;
        public var hh  : String;
        public var H   : String;
        public var m   : String;
        public var mm  : String;
        public var s   : String;
        public var ss  : String;
        public var S   : String;
    }
    
    var _int : Int { return Int(self.timeIntervalSince1970); };
    var _objc: object {
        let form = DateFormatter().set { $0.dateFormat = "yy-yyyy-M-MM-MMM-MMMM-E-EEEE-dd-d-h-hh-H-m-mm-s-ss-S-SS-SSS-a" }
        let ary = form.string(from: self).split("-")
        return object(yy: ary[0],  yyyy: ary[1],  M: ary[2],
                      MM: ary[3],  MMM : ary[4],  MMMM: ary[5],
                      E : ary[6],  EEEE: ary[7],
                      dd: ary[8],  d   : ary[9],
                      h : ary[10], hh  : ary[11], H: ary[12],
                      m : ary[13], mm  : ary[14],
                      s : ary[15], ss  : ary[16], S: ary[17]);
    };
    var _timeGone: String {
        switch (Date()._int - self._int) {
        case let i where (i < 60)       : return "剛剛"
        case let i where (i/time.m < 60): return "\(i/time.m) 分鐘"
        case let i where (i/time.h < 24): return "\(i/time.h) 小時"
        case let i where (i/time.d < 30): return "\(i/time.d) 天"
        case let i where (i/time.M < 12): return "\(i/time.M) 個月";
        case let i where (i/time.y > 1) : return "\(i/time.y) 年";
        default                         : return "#error";
        };
    };
    var _timeLeft: String {
        let date: Int = self._int,
        day : String = (date/time.d).differ(0) ? "\(date/time.d)d-" : "",
        hour: String = ((date%time.d)/time.h).differ(0) ? "\((date%time.d)/time.h)h-" : "",
        min : String = (((date%time.d)%time.h)/time.m).differ(0) ? "\(((date%time.d)%time.h)/time.m)m-" : "",
        sec : String = (((date%time.d)%time.h)%time.m).differ(0) ? "\(((date%time.d)%time.h)%time.m)s" : "";
        return "\(day)\(hour)\(min)\(sec)";
    };
    
    func equal(_ date: Date) -> Bool { return (self == date) };
}

extension Bundle {
    var displayName: String {
        return (object(forInfoDictionaryKey: "CFBundleDisplayName") as? String) ?? ""
    }
}

public extension Int {
    
    var _str   : String { return String(self) };
    var _cgflt : CGFloat { return CGFloat(self) };
    var _date: Date { return Date(timeIntervalSince1970: TimeInterval(self)) };
    
    func equal(_ int: Int) -> Bool { return (self == int); };
    func differ(_ int: Int) -> Bool { return (self != int); };
    
}

public extension UIColor {
    
    @objc convenience init(rgb red: CGFloat,_ green: CGFloat,_ blue: CGFloat) {
        self.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1);
    };
    
    @objc convenience init(rgb red: CGFloat,_ green: CGFloat,_ blue: CGFloat,_ alpha: CGFloat) {
        self.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha);
    };
    
    @objc convenience init(hex value: String) {
        var str: String = value.trimmingCharacters(in: .whitespaces).replace(["#":""]),
        rgb: UInt32 = 0;
        switch (str.count != 6) {
        case true: self.init(rgb: 0.5, 0.5, 0.5);
        case false: Scanner(string: str).scanHexInt32(&rgb);
        self.init(rgb: CGFloat((rgb & 0xFF0000) >> 16), CGFloat((rgb & 0x00FF00) >> 8), CGFloat(rgb & 0x0000FF));
            print("rgb", CGFloat(rgb & 0xFF0000), CGFloat((rgb & 0x00FF00) >> 8), CGFloat(rgb & 0x0000FF))
        };
    };
    
    @objc convenience init(hex value: String,_ a: CGFloat) {
        var str: String = value.trimmingCharacters(in: .whitespaces).replace(["#":""]),
        rgb: UInt32 = 0;
        switch (str.count != 6) {
        case true : Scanner(string: str).scanHexInt32(&rgb);
        self.init(rgb: CGFloat((rgb & 0xFF0000) >> 16), CGFloat((rgb & 0x00FF00) >> 8), CGFloat(rgb & 0x0000FF), a);
        case false: self.init(rgb: 0.5, 0.5, 0.5, a);
        };
    };
    
    var _ciColor: CIColor { return CIColor(color: self) };
    var _red: CGFloat { return (self._ciColor.red*255._cgflt) };
    var _green: CGFloat { return (self._ciColor.green*255._cgflt) };
    var _blue: CGFloat { return (self._ciColor.blue*255._cgflt) };
    var _alpha: CGFloat { return (self._ciColor.alpha) };
};
public extension UIEdgeInsets {
    
    init(_ t: CGFloat,_ l: CGFloat,_ b: CGFloat,_ r: CGFloat) {
        self.init(top: t, left: l, bottom: b, right: r);
    };
};

public class Interactor: UIPercentDrivenInteractiveTransition {
    public var isStarted  = false
    public var isFinished = false
}


public extension CGRect {
    
    init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat) {
        self.init(x: x, y: y, width: w, height: h);
    };
};

public extension CGSize {
    
    init(_ w: CGFloat,_ h: CGFloat) {
        self.init(width: w, height: h);
    };
};

public extension CGPoint {
    
    init(_ x: CGFloat,_ y: CGFloat) {
        self.init(x: x, y: y);
    };
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
        self.init(effect: UIBlurEffect(style: style))
        switch (frame) {
        case .zero: self.autolayout();
        default:    self.frame = frame;
        }
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
        switch (frame) {
        case .zero: self.autolayout();
        default:    self.frame = frame;
        };
    }
}

public extension UIPickerView {
    
    convenience init(_ frame: CGRect,_ delegate: UIPickerViewDelegate) {
        switch (frame) {
        case .zero: self.init();
        self.autolayout();
        default:    self.init(frame: frame);
        }
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


public struct top {
    public static let norm: CGFloat = (device.x) ? 44 : 0;
    public static let bar: CGFloat  = (device.x) ? 44 : 20;
}

public struct bottom {
    public static let norm: CGFloat = (device.x) ? 34 : 0;
    public static let tab: CGFloat  = (device.x) ? 34+49 : 49;
}

public struct time {
    public static let m = 60;
    public static let h = 60*60;
    public static let d = 60*60*24;
    public static let M = 60*60*24*30;
    public static let y = 60*60*24*365;
};

public struct Colors {
    public static let bgColor = UIColor(rgb: 239, 239, 244);
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

public struct ary {
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

public struct device {
    public static let pad: Bool   = (vh >= 999 && vw >= 768) || (vw >= 999 && vh >= 768);
    public static let x: Bool     = (vh == 812 && vw == 375) || (vw == 812 && vh == 375) || (vh == 896 && vw == 414) || (vw == 896 && vh == 414);
    public static let r: Bool     = (vh == 667 && vw == 375) || (vw == 667 && vh == 375) || (vh == 736 && vw == 414) || (vw == 736 && vh == 414);
    public static let plus: Bool  = (vh == 736 && vw == 414) || (vw == 736 && vh == 414) || (vh == 896 && vw == 414) || (vw == 896 && vh == 414);
    public static let norm: Bool  = (vh == 667 && vw == 375) || (vw == 667 && vh == 375) || (vh == 812 && vw == 375) || (vw == 812 && vh == 375);
    public static let xNorm: Bool = (vh == 812 && vw == 375) || (vw == 812 && vh == 375);
    public static let xPlus: Bool = (vh == 896 && vw == 414) || (vw == 896 && vh == 414);
    public static let rNorm: Bool = (vh == 667 && vw == 375) || (vw == 667 && vh == 375);
    public static let rPlus: Bool = (vh == 736 && vw == 414) || (vw == 736 && vh == 414);
    public static let se: Bool    = (vh < 667);
}

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
