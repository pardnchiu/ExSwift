//
//  PDAlert.swift
//  PDExtension
//
//  Created by Pardn Co., Ltd on 2019/5/24.
//  Copyright © 2016-2018 Pardn Co., Ltd All rights reserved.
//

import Foundation
import UIKit

public struct PDAction {
    public var title : String
    public var style : UIAlertAction.Style
    public var action: ((_ acrion: UIAlertAction) -> Void)?
    
    public init(title: String, style: UIAlertAction.Style, action: ((_ acrion: UIAlertAction) -> Void)?) {
        self.title  = title;
        self.style  = style;
        self.action = action;
    };
};

public struct PDInput {
    public var placeholder: String?
    public var text       : String?
    public var frame      : PDInputFrame
    public var types      : [PDInputType]
    
    public init(placeholder: String?, text: String?, frame: PDInputFrame, types: [PDInputType]) {
        self.placeholder = placeholder;
        self.text        = text;
        self.frame       = frame;
        self.types       = types;
    };
};

public enum PDInputFrame {
    case border;
    case lineTop;
    case lineBottom;
};

public enum PDInputTypeItem {
    case font;
    case textColor;
    case textAlignment;
    case keyboardType;
    case isSecureTextEntry;
};

public struct PDInputType {
    public var key  : PDInputTypeItem
    public var value: Any
    
    public init(key: PDInputTypeItem, value: Any) {
        self.key = key;
        self.value = value;
    };
};

public func PDAlert(alert root: UIViewController?, title: String, message: String, actions: [PDAction]) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
    actions.forEach { (action) in
        alert.addAction(UIAlertAction(title: action.title, style: action.style, handler: action.action));
    };
    root?.present(alert, animated: true, completion: nil);
};

public func PDAlert(actionSheet root: UIViewController?, title: String, message: String, actions: [PDAction]) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet);
    actions.forEach { (action) in
        alert.addAction(UIAlertAction(title: action.title, style: action.style, handler: action.action));
    };
    root?.present(alert, animated: true, completion: nil);
};

public func PDAlert(input root: UIViewController?, title: String, message: String, inputs: [PDInput], comfirm: (String, ([String])->()), actions: [PDAction]) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
    
    inputs.forEach { (input) in
        alert.addTextField { (texefield) in
            texefield.leftView      = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0));
            texefield.leftViewMode  = .always;
            texefield.rightView     = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0));
            texefield.rightViewMode = .always;
            texefield.placeholder = input.placeholder;
            texefield.text = input.text;
            input.types.forEach {
                switch $0.key {
                case .font     : texefield.font = $0.value as? UIFont;
                case .textColor: texefield.textColor = $0.value as? UIColor;
                case .textAlignment: texefield.textAlignment = ($0.value as? NSTextAlignment)!;
                case .keyboardType : texefield.keyboardType = ($0.value as? UIKeyboardType)!;
                case .isSecureTextEntry: texefield.isSecureTextEntry = ($0.value as? Bool)!;
                };
            };
            
            guard let h = texefield.font?.pointSize else { return };
            texefield.heightAnchor.constraint(equalToConstant: h*2).isActive = true;
            
            switch input.frame {
            case .border:
                texefield.layer.cornerRadius  = h;
                texefield.layer.masksToBounds = true;
                texefield.layer.borderWidth = 0.5;
                texefield.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor;
                
            case .lineTop, .lineBottom:
                let line = UIView().body {
                    $0.translatesAutoresizingMaskIntoConstraints = false;
                    $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25);
                }
                texefield.addSubview(line);
                
                if input.frame == .lineBottom {
                    line.topAnchor.constraint(equalTo: texefield.bottomAnchor, constant: 0).isActive  = true;
                } else {
                    line.bottomAnchor.constraint(equalTo: texefield.topAnchor, constant: -5).isActive = true;
                }
                line.leftAnchor.constraint(equalTo: texefield.leftAnchor, constant: 15).isActive    = true;
                line.rightAnchor.constraint(equalTo: texefield.rightAnchor, constant: -15).isActive = true;
                line.heightAnchor.constraint(equalToConstant: 0.5).isActive                         = true;
            }
            
        }
    }
    
    alert.addAction(
        UIAlertAction(title: comfirm.0, style: .default, handler: { (action: UIAlertAction) -> Void in
            var ary: [String] = [];
            alert.textFields?.forEach {
                ary.append($0.text ?? "");
                if ($0 == alert.textFields?.last) {
                    comfirm.1(ary);
                };
            };
        })
    );
    
    actions.forEach { (action) in
        alert.addAction(UIAlertAction(title: action.title, style: action.style, handler: action.action));
    };
    
    root?.present(alert, animated: true, completion: nil);
    
    alert.textFields?.forEach {
        if let container = $0.superview, let effectView = container.superview?.subviews.first, effectView is UIVisualEffectView {
            container.backgroundColor = .clear;
            effectView.removeFromSuperview();
        };
    };
};
