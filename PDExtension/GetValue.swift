//
//  Get.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/14.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit
import MapKit

public func get(data url: URL?, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    guard let url = url else { return }
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume();
};

public func get(image url: URL?,_ completion: @escaping (UIImage?)->Void) {
    //    guard let url = value else { return }
    //    URLSession.shared.dataTask(with: url) { (data, response, error) in
    //        DispatchQueue.main.async() {
    //            if let _ = error { completion(nil); return };
    //            guard let data = data else { completion(nil); return };
    //            completion(UIImage(data: data))
    //        };
    //        }.resume();
    get(data: url) { (data, response, error) in
        DispatchQueue.main.async() {
            if let _ = error { completion(nil); return };
            guard let data = data else { completion(nil); return };
            completion(UIImage(data: data))
        };
    };
};

public func get(image filename: String,_ completion: @escaping (UIImage?)->Void) {
    DispatchQueue.main.async() {
        guard
            let path  = Bundle.main.path(forResource: filename, ofType: nil),
            let image = UIImage(contentsOfFile: path)
            else { completion(nil); return };
        completion(image);
    };
};

public func get(address latitude: Double, _ longitude: Double,_ completion: @escaping (String?)->Void) {
    let location = CLLocation(latitude: latitude, longitude: longitude);
    CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
        DispatchQueue.main.async() {
            if let _ = error { completion(nil); return };
            guard let placemark = placemarks?[0] else { completion(nil); return };
            let area = (placemark.subAdministrativeArea ?? "");
            let dist = (placemark.locality ?? "");
            let address = String(format:"%@%@", area, dist);
            completion(address.trimmingCharacters(in: .whitespaces).isEmpty ? nil : address);
        };
    });
};
