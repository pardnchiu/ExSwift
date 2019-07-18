//
//  Date.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/14.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation

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
        let form = DateFormatter().body { $0.dateFormat = "yy-yyyy-M-MM-MMM-MMMM-E-EEEE-dd-d-h-hh-H-m-mm-s-ss-S-SS-SSS-a" }
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
        case let i where (i < time.min)     : return "剛剛";
        case let i where (i/time.min < 60)  : return "\(i/time.min) 分鐘";
        case let i where (i/time.hour < 24) : return "\(i/time.hour) 小時";
        case let i where (i/time.day < 30)  : return "\(i/time.day) 天";
        case let i where (i/time.month < 12): return "\(i/time.month) 個月";
        case let i where (i/time.year > 1)  : return "\(i/time.year) 年";
        default                             : return "";
        };
    };
    var _timeLeft: String {
        let date: Int = self._int,
        day : String = (date/time.day).differ(0) ? "\(date/time.day)d-" : "",
        hour: String = ((date%time.day)/time.hour).differ(0) ? "\((date%time.day)/time.hour)h-" : "",
        min : String = (((date%time.day)%time.hour)/time.min).differ(0) ? "\(((date%time.day)%time.hour)/time.min)m-" : "",
        sec : String = (((date%time.day)%time.hour)%time.min).differ(0) ? "\(((date%time.day)%time.hour)%time.min)s" : "";
        return "\(day)\(hour)\(min)\(sec)";
    };
    
    func equal(_ date: Date) -> Bool { return (self == date) };
}
