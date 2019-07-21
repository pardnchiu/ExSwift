//
//  Data.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/18.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation

public extension Data {
    
    var _str: String { return (String(bytes: self, encoding: .utf8) ?? "") }
    
    var _json: [String:Any] {
        do {
            let dic = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [String:Any]
            return dic ?? [:]
        } catch {
//            print(self._str, "can't be encoded.")
            return ["error":"1", "msg":"data [\(self._str)], can.t be trans to json."]
        };
    };
};
