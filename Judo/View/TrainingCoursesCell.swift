//
//  TrainingCoursesCell.swift
//  Judo
//
//  Created by MacBook Pro on 4/7/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class TrainingCoursesCell: UICollectionViewCell {
    @IBOutlet weak var BackView: UIView!
    
    @IBOutlet weak var traingImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
//        BackView.layer.cornerRadius = 12
        traingImageView.layer.cornerRadius = 12
//        BackView.layer.shadowColor = #colorLiteral(red: 0.7291485667, green: 0.7254909277, blue: 0.7296923995, alpha: 1)
//        BackView.layer.shadowOpacity = 0.4
//        BackView.layer.shadowOffset = CGSize.zero
//        BackView.layer.shadowRadius = 12
//        
        
    }

    

    
}
