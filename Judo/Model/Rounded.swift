//
//  Rounded.swift
//  Judo
//
//  Created by MacBook Pro on 4/2/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import Foundation
import UIKit
   class RoundedButton : UIButton {
       override func awakeFromNib() {
           super.awakeFromNib()
           layer.cornerRadius = 14
        
    }
   }

   class RoundedView : UIView {
       override func awakeFromNib() {
           super.awakeFromNib()
           layer.cornerRadius = 8
       }
   }
class RoundedShadowView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.16
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
        
    }
}
class ShadowView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.16
        layer.shadowRadius = 0
        
    }
}

class RoundedImageView : UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
    }
}
