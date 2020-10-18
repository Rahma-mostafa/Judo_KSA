//
//  ChampCell.swift
//  Judo
//
//  Created by MacBook Pro on 4/12/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class ChampCell: UICollectionViewCell {
    
    @IBOutlet weak var champImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cornerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        champImageView.layer.cornerRadius = 12
    }

        
    
}
