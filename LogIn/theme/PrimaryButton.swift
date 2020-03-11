//
//  Button.swift
//  LogIn
//
//  Created by 倪卫国 on 2020/3/10.
//  Copyright © 2020 hubot. All rights reserved.
//

import UIKit

@IBDesignable
class PrimaryButton : UIButton {
    
    var normalBackgroundColor: UIColor = PrimaryPalette.teal
    var normalTextColor: UIColor = UIColor.white
    
    var disabledBackgroundColor: UIColor = PrimaryPalette.teal.withAlphaComponent(0.4)
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            refreshRadius(radius: self.cornerRadius)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            refreshBorderWidth(width: self.borderWidth)
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            refreshBorderColor(color: self.borderColor)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        configure()
    }
    
    func configure() {
        setTitleColor(normalTextColor, for: .normal)
        backgroundColor = normalBackgroundColor
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        
        refreshRadius(radius: self.cornerRadius)
        refreshBorderWidth(width: self.borderWidth)
        refreshBorderColor(color: self.borderColor)
    }
    
    func refreshRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func refreshBorderColor(color: UIColor) {
        layer.borderColor = color.cgColor
    }
    
    func refreshBorderWidth(width: CGFloat) {
        layer.borderWidth = width
    }
    
    override open var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled
                ? normalBackgroundColor
                : disabledBackgroundColor
        }
    }
}
