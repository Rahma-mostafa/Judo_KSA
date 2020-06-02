//
//  NewsDetailsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/10/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseFirestore
import SDWebImage

class NewsDetailsVC: BaseController {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    //variables
    var news:[News] = [News]()
    var newsID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = true
        retreiveLatestNews()
    }
    
    func retreiveLatestNews(){
        let db = Firestore.firestore()
        db.collection("news").getDocuments() { (querySnapshot, err) in
            print("1")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    if self.newsID == document.documentID{
                        let imageURL = document["photoUrl"] as? String
                        let title = document["title"] as? String
                        let desc = document["description"] as? String
                        let url = URL(string: imageURL!)
                        let latestnewsObj = News(image: imageURL!, title: title!,date: desc)
                        self.news.append(latestnewsObj)
                        self.newsImageView.sd_setImage(with: URL(string: imageURL!))
                        self.titleLabel.text = title!
                        self.descLabel.text = desc!
                    }
                }
            }
        }
    }
    
    @IBAction func onShareButtonTapped(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
