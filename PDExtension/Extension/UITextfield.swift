//
//  UITextfield.swift
//  PDExtension
//
//  Created by Pardn Chiu on 2019/7/8.
//  Copyright © 2019 Pardn Co., Ltd. All rights reserved.
//

import Foundation
import UIKit

public class NoPasteTextField: UITextField {
    
    //    override func caretRect(for position: UITextPosition) -> CGRect {
    //        return CGRect.zero
    //    }
    //
    //    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
    //        return []
    //    }
    
    override public func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        //action == #selector(copy(_:)) || action == #selector(selectAll(_:))
        if action == #selector(paste(_:)) { return false }
        return super.canPerformAction(action, withSender: sender)
    }
}

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
    
    func set(font value: UIFont) { self.font = value };
    func set(font size: CGFloat,_ name: String) { self.font = UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size) };
    func set(font size: CGFloat,_ weight: UIFont.Weight) { self.font = .systemFont(ofSize: size, weight: weight) };
    func set(fontItalic size: CGFloat) { UIFont.italicSystemFont(ofSize: size) };
    
    func set(alignment value: NSTextAlignment) { self.textAlignment = value };
    func set(placeholder value: String) { self.placeholder = value };
    func set(keyboardType value: UIKeyboardType) { self.keyboardType = value };
    func set(UIKeyboardAppearance value: UIKeyboardAppearance) { self.keyboardAppearance = value };
    func set(protocol value: UITextFieldDelegate) { self.delegate = value };
    func set(enable bool: Bool) { self.isEnabled = bool };
    
    func set(right view: UIView,_ mode: UITextField.ViewMode) { self.rightView = view; self.rightViewMode = mode };
    func set(left view: UIView,_ mode: UITextField.ViewMode) { self.leftView = view; self.leftViewMode = mode };
    
    func set(right x: CGFloat,_ y: CGFloat,_ width: CGFloat,_ height: CGFloat,_ mode: UITextField.ViewMode) {
        self.rightView = UIView(x, y, width, height);
        self.rightViewMode = mode
    };
    func set(left x: CGFloat,_ y: CGFloat,_ width: CGFloat,_ height: CGFloat,_ mode: UITextField.ViewMode) {
        self.leftView = UIView(x, y, width, height);
        self.leftViewMode = mode
    };
}

public extension UITextView {
    
    func set(font value: UIFont) { self.font = value };
    func set(font size: CGFloat,_ name: String) { self.font = UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size) };
    func set(font size: CGFloat,_ weight: UIFont.Weight) { self.font = .systemFont(ofSize: size, weight: weight) };
    func set(fontItalic size: CGFloat) { UIFont.italicSystemFont(ofSize: size) };
    
    func set(protocol value: UITextViewDelegate) { self.delegate = value };
}
