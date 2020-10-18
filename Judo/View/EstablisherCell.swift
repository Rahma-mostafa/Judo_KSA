//
//  EstablisherCell.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class EstablisherCell: UITableViewCell {

    @IBOutlet weak var establisherImageView: UIImageView!
    @IBOutlet weak var establisherNameLabel: UILabel!
    
    @IBOutlet weak var estabilisherRoleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        establisherImageView.layer.cornerRadius = 24
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
