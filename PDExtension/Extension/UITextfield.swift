//
//  UITextfield.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/8.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public extension UITextField {
    
    var _text: String { return self.text ?? "" };
};

public extension UITextField {
    
    func set(text value: String) { self.text = value };
    func set(textColor value: UIColor) { self.textColor = value };
    func set(textColor r: CGFloat,_ g: CGFloat,_ b: CGFloat) { self.textColor = UIColor(rgb: r, g, b) };
    func set(textColor r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a: CGFloat) { self.textColor = UIColor(rgb: r, g, b, a) };
    func set(textColor hex: String) { self.textColor = UIColor(hex: hex) };
    func set(textColor hex: String,_ a: CGFloat) { self.textColor = UIColor(hex: hex, a) };
    
    func set(textAlignment value: NSTextAlignment) { self.textAlignment = value };
    func set(placeholder value: String) { self.placeholder = value };
    func set(font value: UIFont) { self.font = value };
    func set(keyboardType value: UIKeyboardType) { self.keyboardType = value };
    func set(UIKeyboardAppearance value: UIKeyboardAppearance) { self.keyboardAppearance = value };
    func set(protocol value: UITextFieldDelegate) { self.delegate = value };
    
    func set(right view: UIView,_ mode: UITextField.ViewMode) { self.rightView = view; self.rightViewMode = mode };
    func set(left view: UIView,_ mode: UITextField.ViewMode) { self.leftView = view; self.leftViewMode = mode };
}
