//
//  VideoCell.swift
//  Judo
//
//  Created by Rahma on 11/2/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import SafariServices

protocol videoCellDelegate {
    func didTapWatchNow(url: String)
}

class VideoCell: UICollectionViewCell {
       @IBOutlet weak var videoImageView: RoundedImageView!
          @IBOutlet weak var playButton: UIButton!
          @IBOutlet weak var titleLabel: UILabel!
          @IBOutlet weak var dateLabel: UILabel!
          @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var contentRoundedView: RoundedView!
    var videoItem: Video!
       var delegate: videoCellDelegate?
         
    

    override func awakeFromNib() {
        super.awakeFromNib()
        contentRoundedView.layer.cornerRadius = 12
    }
    func setVideo(video: Video){
        videoItem = video
        titleLabel.text = video.title
        
    }
    @IBAction func onPlayButtonTapped(_ sender: Any) {
        delegate?.didTapWatchNow(url: videoItem.url)
        
        
    }

}
