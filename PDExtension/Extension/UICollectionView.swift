//
//  UICollectionView.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    func set(protocol delegate: UICollectionViewDelegate,_ dataSource: UICollectionViewDataSource) {
        self.delegate   = delegate;
        self.dataSource = dataSource;
    };
    func set(cell value: AnyClass) { self.register(value.self, forCellWithReuseIdentifier: "\(value)") };
    func set(cells values: [AnyClass]) { values.forEach { self.register($0.self, forCellWithReuseIdentifier: "\($0)") } };
};

public extension UICollectionViewFlowLayout {
    
    func set(spacing lineSpacing: CGFloat,_ itemSpacing: CGFloat,_ direction: UICollectionView.ScrollDirection) {
        self.minimumLineSpacing      = lineSpacing;
        self.minimumInteritemSpacing = itemSpacing;
        self.scrollDirection         = direction;
    }
}
