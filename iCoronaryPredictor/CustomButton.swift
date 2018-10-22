//
//  CustomButton.swift
//
//  Created by Namikare Gikoha on 2018/08/21.
//  Copyright © 2018年 gikoha. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomButton: UIButton {
    
    // 角丸の半径(0で四角形)
    @IBInspectable var cornerRadius: CGFloat = 6.0
    
    // 枠
    @IBInspectable var borderColor: UIColor = UIColor.black
    @IBInspectable var borderWidth: CGFloat = 1.0
    
    override func draw(_ rect: CGRect) {
        // 角丸
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        
        // 枠線
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
        super.draw(rect)
    }
}

