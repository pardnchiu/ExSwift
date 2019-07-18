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
    
    @objc convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ layout: UICollectionViewLayout) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h), collectionViewLayout: layout);
    };
    
    @objc convenience init(_ frame: CGRect,_ layout: UICollectionViewLayout) {
        self.init(frame: frame, collectionViewLayout: layout);
        self.set(autolayout: frame != .zero);
    };
    
    func set(protocol delegate: UICollectionViewDelegate,_ dataSource: UICollectionViewDataSource) {
        self.delegate   = delegate;
        self.dataSource = dataSource;
    };
    func set(cell value: AnyClass) { self.register(value.self, forCellWithReuseIdentifier: "\(value)") };
    func set(cells values: [AnyClass]) { values.forEach { self.register($0.self, forCellWithReuseIdentifier: "\($0)") } }
    
    func cell(_ indexPath: IndexPath) -> UICollectionViewCell? {
        return self.cellForItem(at: indexPath);
    };
    
    func cell(reuse tag: String,_ indexPath: IndexPath) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: tag, for: indexPath);
    };

    func scroll(to index: IndexPath,_ position: UICollectionView.ScrollPosition,_ animate: Bool) {
        self.scrollToItem(at: index, at: position, animated: animate);
    };
    
    func insert(indexPaths: [IndexPath],_ completion: ((Bool)->Void)?) {
        self.performBatchUpdates({
            self.insertItems(at: indexPaths);
        }, completion: completion)
    }
    
    func delete(indexPaths: [IndexPath],_ completion: ((Bool)->Void)?) {
        self.performBatchUpdates({
            self.deleteItems(at: indexPaths);
        }, completion: completion)
    }
};

public extension UICollectionViewFlowLayout {
    
    func set(spacing lineSpacing: CGFloat,_ itemSpacing: CGFloat,_ direction: UICollectionView.ScrollDirection) {
        self.minimumLineSpacing      = lineSpacing;
        self.minimumInteritemSpacing = itemSpacing;
        self.scrollDirection         = direction;
    }
}
