//
//  PDTask.swift
//  PDExtension
//
//  Created by Pardn on 2019/7/24.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices
import Photos

public extension URLSessionDataTask {
    
    func back(start bool: Bool) {
        DispatchQueue.global(qos: .background).async {
            if (bool) { self.resume() }
        }
    }
}

public struct PDRequestFile {
    public var name: String, data: Data, type: String;
    public init(_ name: String,_ data: Data,_ type: String) {
        self.name = name;
        self.data = data;
        switch (type) {
        case "image/png" : self.type = ".png"
        case "image/jpeg": self.type = ".jpg"
        case "image/heic": self.type = ".heic"
        default          : self.type = type
        }
    };
};

private func PDRequest(urlencoded url: URL,_ parms: [String:String]?) -> URLRequest {
    var body = Data()
    if let parms = parms, !(parms.isEmpty ){
        parms.forEach {
            switch ($0 == parms.first!) {
            case true:
                body.append("\($0.key)=\($0.value)")
            case false:
                body.append("&\($0.key)=\($0.value)")
            }
        };
    };
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    request.httpBody = body
    return request
}

private func PDRequest(file url: URL,_ parms: [String: String]?,_ files: [PDRequestFile]?) -> URLRequest {
    let boundary = "Boundary-\(UUID().uuidString)"
    var body = Data()
    if let parms = parms {
        parms.forEach {
            body.append("--\(boundary)\r\n");
            body.append("Content-Disposition: form-data; name=\"\($0.key)\"\r\n\r\n");
            body.append("\($0.value)\r\n");
        };
    };
    if let files = files {
        files.forEach {
            body.append("--\(boundary)\r\n");
            body.append("Content-Disposition: form-data; name=\"\($0.name)\"; filename=\"\($0.name)\"\r\n");
            body.append("Content-Type: \($0.type)\r\n\r\n");
            body.append($0.data);
            body.append("\r\n");
        };
    };
    body.append("--\(boundary)--\r\n")
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    request.httpBody = body
    return request
}

private func PDTask(_ request: URLRequest,_ completion: @escaping (Error?, Data?)->Void) -> URLSessionDataTask {
    return URLSession.shared.dataTask(with: request) { (data, response, error) in
        DispatchQueue.main.async {
            completion(error, data);
        };
    };
};

public func PDTask(url: URL?,_ completion: @escaping (Error?, Data?)->Void) -> URLSessionDataTask? {
    guard let url = url else { return nil }
    return URLSession.shared.dataTask(with: url) { (data, response, error) in
        DispatchQueue.main.async {
            completion(error, data);
        };
    };
};

public func PDTask(urlencoded url: URL?,_ parms: [String: String]?,_ completion: @escaping (Error?, Data?)->Void) -> URLSessionDataTask? {
    guard let url = url else { return nil };
    let request = PDRequest(urlencoded: url, parms)
    return PDTask(request, completion)
};

public func PDTask(file url: URL?,_ parms: [String: String]?,_ files: [PDRequestFile]?,_ completion: @escaping (Error?, Data?)->Void) -> URLSessionDataTask? {
    guard let url = url else { return nil };
    let request = PDRequest(file: url, parms, files)
    return PDTask(request, completion)
};

// old
//public func httpBody(_ parms: [String: String]?,_ files: [PDRequestFile],_ boundary: String) -> Data {
//    var body = Data()
//    // 加入一般參數
//    if let parms = parms {
//        parms.forEach {
//            body.append("--\(boundary)\r\n");
//            body.append("Content-Disposition: form-data; name=\"\($0.key)\"\r\n\r\n");
//            body.append("\($0.value)\r\n");
//        };
//    };
//    // 加入檔案
//    files.forEach {
//        //        let url = URL(fileURLWithPath: $0.path);
//        //        let filename = url.lastPathComponent;
//        //        let mimetype = mimeType(pathExtension: url.pathExtension);
//        //        if let data = try? Data(contentsOf: url) {
//        body.append("--\(boundary)\r\n");
//        body.append("Content-Disposition: form-data; name=\"\($0.name)\"; filename=\"\($0.name)\"\r\n");
//        body.append("Content-Type: \($0.type)\r\n\r\n");
//        body.append($0.data);
//        body.append("\r\n");
//        //        };
//    };
//    body.append("--\(boundary)--\r\n")
//    
//    return body
//}

public func mimeType(pathExtension: String) -> String {
    if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension,
                                                       pathExtension as NSString,
                                                       nil)?.takeRetainedValue() {
        if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?
            .takeRetainedValue() {
            return mimetype as String
        }
    }
    return "application/octet-stream"
}
