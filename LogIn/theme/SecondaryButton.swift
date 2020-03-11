//
//  SecondaryButton.swift
//  LogIn
//
//  Created by 倪卫国 on 2020/3/11.
//  Copyright © 2020 hubot. All rights reserved.
//

import UIKit

@IBDesignable
class SecondaryButton: PrimaryButton {
    
    override func configure() {
        self.normalBackgroundColor = PrimaryPalette.paper
        self.normalTextColor = PrimaryPalette.teal
        self.disabledBackgroundColor = self.normalBackgroundColor.withAlphaComponent(0.4)
        
        self.borderWidth = 3
        self.borderColor = self.normalTextColor
        
        super.configure()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
