//
//  UISCrollView.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UIScrollView {
    
    func t(_ value: CGFloat) { self.contentInset.top = value };
    func l(_ value: CGFloat) { self.contentInset.left = value };
    func b(_ value: CGFloat) { self.contentInset.bottom = value };
    func r(_ value: CGFloat) { self.contentInset.right = value };
}
