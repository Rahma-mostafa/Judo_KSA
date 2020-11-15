//
//  NewsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/9/20.
//  Copyright © 2020 rahma. All rights reserved.
//


import UIKit
import FirebaseFirestore
import SDWebImage

class NewsVC: BaseController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    //variables
    var news:[News] = [News]()
    var newsID = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        retreiveLatestNews()
//        titleLabel.text = "latest".localized()
    }
    func setup(){
       newsCollectionView.delegate = self
       newsCollectionView.dataSource = self
        
    }
    func retreiveLatestNews(){
        let db = Firestore.firestore()
        db.collection("news").getDocuments() { (querySnapshot, err) in
            print("connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let imageURL = document["photoUrl"] as? String
                    let title = document["title"] as? String
                    let date = document["date"] as? String
                    let id = document.documentID
                    let latestnewsObj = News(image: imageURL, title: title!, date: date!, id: id)
                    self.news.append(latestnewsObj)
                    self.newsCollectionView.reloadData()
                }
            }
        }
    }
  

    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
extension NewsVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as? NewsCell{
            cell.pictureImageView.sd_setImage(with: URL(string: news[indexPath.item].image!))
            cell.titleLabel.text = news[indexPath.item].title
            cell.dateLabel.text = news[indexPath.item].date
            cell.shareButton.tag = indexPath.row
            cell.shareButton.addTarget(self, action: Selector(("share")), for: .touchUpInside)
           return cell
        }
        return UICollectionViewCell()
    }
    @objc func share(){
        let activityVC = UIActivityViewController(activityItems:["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.newsID = news[indexPath.item].id!
        print("MaincourseID = \(newsID)")
        performSegue(withIdentifier: "NewsDetails", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vc = segue.destination as! NewsDetailsVC
         vc.newsID = self.newsID
    }
}
