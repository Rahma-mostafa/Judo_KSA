//
//  VideoCell.swift
//  Judo
//
//  Created by MacBook Pro on 4/14/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
protocol videoCellDelegate {
    func didTapWatchNow(url: String)
}

class VideoCell: UICollectionViewCell {
    
    @IBOutlet weak var videoImageView: RoundedImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    // variables
    var videoItem: Video!
    var delegate: videoCellDelegate?
    
    func setVideo(video: Video){
        videoItem = video
        titleLabel.text = video.title
        
    }
    
    
    @IBAction func onPlayButtonTapped(_ sender: Any) {
        delegate?.didTapWatchNow(url: videoItem.url)
    }
}
