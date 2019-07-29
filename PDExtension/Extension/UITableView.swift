//
//  UITableView.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/3.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public struct PDSeparator {
    public var color: UIColor?, left: CGFloat, right: CGFloat;
    public init(_ color: UIColor?,_ left: CGFloat,_ right: CGFloat) {
        self.color = color;
        self.left  = left;
        self.right = right;
    };
};

public extension UITableView {
    
    var _header: UIView? { return (self.tableHeaderView) };
    var _footer: UIView? { return (self.tableFooterView) };
    
    var _headerH: CGFloat { return (self.tableHeaderView?.fh ?? 0) };
    var _footerH: CGFloat { return (self.tableFooterView?.fh ?? 0) };
    
    var _cells: [UITableViewCell]? { return (self.visibleCells) };
};

public extension UITableView {
    
    convenience init(_ x: CGFloat,_ y: CGFloat,_ w: CGFloat,_ h: CGFloat,_ style: UITableView.Style) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h), style: style);
    };
    
    convenience init(_ frame: CGRect,_ style: UITableView.Style) {
        self.init(frame: frame, style: style);
        self.set(autolayout: frame != .zero);
    };
    
    func set(autoRowHeight value: CGFloat) {
        self.estimatedRowHeight = value;
        self.rowHeight = UITableView.automaticDimension;
    }
    
    func set(protocol delegate: UITableViewDelegate,_ dataSource: UITableViewDataSource) {
        self.delegate   = delegate;
        self.dataSource = dataSource;
    };
    
    func set(selection single: Bool, _ multiple: Bool) {
        self.allowsSelection = single;
        self.allowsMultipleSelection = multiple;
    };
    
    func set(separator style: UITableViewCell.SeparatorStyle,_ value: PDSeparator?) {
        self.separatorStyle       = style;
        self.separatorColor       = value?.color
        self.separatorInset.left  = (value?.left ?? 0);
        self.separatorInset.right = (value?.right ?? 0);
    };
    
    func set(editing value: Bool) { self.isEditing = value };
    
    func set(footer view: UIView) { self.tableFooterView = view };
    func set(header view: UIView) { self.tableHeaderView = view };
    
    func set(cell value: AnyClass) { self.register(value.self, forCellReuseIdentifier: "\(value)") };
    func set(cells values: [AnyClass]) { values.forEach { self.register($0.self, forCellReuseIdentifier: "\($0)") } };
};

// old
public extension UITableView {
    
    func updateData() {
        UIView.setAnimationsEnabled(false)
        CATransaction.begin()
        
        CATransaction.setCompletionBlock { () -> Void in
            UIView.setAnimationsEnabled(true)
        }
        
        reloadData()
        beginUpdates()
        endUpdates()
        
        CATransaction.commit()
    }
};

