//
//  JudgeCell.swift
//  Judo
//
//  Created by MacBook Pro on 4/6/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class JudgeCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
       
    @IBOutlet weak var roleLabel: UILabel!
       
    @IBOutlet weak var pictureImageView: UIImageView!
       
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
