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
};
