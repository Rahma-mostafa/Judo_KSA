//
//  VideoVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/14/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import SafariServices
import FirebaseFirestore
import SDWebImage

class VideoVC: UIViewController {
    var videos:[Video] = [Video]()

    @IBOutlet weak var videoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        retreiveChampShips()
        setup()
    }
    func setup(){
        videoCollectionView.dataSource = self
        videoCollectionView.delegate = self
    }
    func retreiveChampShips(){
        let db = Firestore.firestore()
        db.collection("videos").getDocuments() { (querySnapshot, err) in
            print("1")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let docImageURL = document["videoImg"] as? String
                    let url = URL(string: docImageURL!)
                    let docTitle = document["title"] as? String
                    let docLinkUrl = document["videoUrl"] as? String
                    let date = document["date"] as? String
                    let time = document["period"] as? String
                    let videoObj = Video(image: docImageURL!, url: docLinkUrl!, title: docTitle!, date: date!,
                                         period: time!)
                    self.videos.append(videoObj)
                    self.videoCollectionView.reloadData()
                }
            }
        }
    }
  
    

}

extension VideoVC: videoCellDelegate{
    func didTapWatchNow(url: String){
        let videoURL = URL(string: url)!
        let safariVC = SFSafariViewController(url: videoURL)
        self.present(safariVC, animated: true, completion: nil)
    }
}

extension VideoVC: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = videoCollectionView.dequeueReusableCell(withReuseIdentifier: "VideoCell", for: indexPath) as? VideoCell{
            cell.videoImageView.sd_setImage(with: URL(string: videos[indexPath.row].image!))
            cell.titleLabel.text = videos[indexPath.row].title!
            cell.dateLabel.text = videos[indexPath.row].date
            cell.periodLabel.text = videos[indexPath.row].period
            let video = videos[indexPath.row]
            cell.setVideo(video: video)
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
