//
//  coursesTypeCell.swift
//  Judo
//
//  Created by MacBook Pro on 5/10/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class coursesTypeCell: UICollectionViewCell {
    @IBOutlet weak var coloredBackgroundView: UIView!
       @IBOutlet weak var WhiteView: UIView!
       @IBOutlet weak var listTypeLabel: UILabel!
       

       var color:UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       
       override func awakeFromNib() {
           super.awakeFromNib()
           coloredBackgroundView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
           WhiteView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

           
           coloredBackgroundView.layer.cornerRadius = 18
           WhiteView.layer.cornerRadius = 18
           
       }
    
}
