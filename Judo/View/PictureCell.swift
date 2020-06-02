//
//  PictureCell.swift
//  Judo
//
//  Created by MacBook Pro on 4/13/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    override func awakeFromNib() {
           super.awakeFromNib()
           pictureImageView.layer.cornerRadius = 10
       }
}
