//
//  HomeVC.swift
//  Judo
//
//  Created by MacBook Pro on 3/31/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import Localize_Swift
import FirebaseDatabase
import FirebaseFirestore
import SDWebImage


class HomeVC: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var latestNewsLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var latestNewCollectionView: UICollectionView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var sectionsLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var callCenterLabel: UILabel!
    @IBOutlet weak var traningLabel: UILabel!
    @IBOutlet weak var contentView: GradientView!
    @IBOutlet weak var contentView2: GradientView!
    @IBOutlet weak var contentView3: GradientView!
    @IBOutlet weak var contentView4: GradientView!
    
    //variables
    var latestNewsArray:[LatestNews] = [LatestNews]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.hiddenNav = true
        rounded()
        setupLocalication()
        setup()
        retreiveLatestNews()
        
    }
    func rounded(){
//        mainImageView.layer.cornerRadius = 16
        contentView.layer.cornerRadius = 8
        contentView2.layer.cornerRadius = 8
        contentView3.layer.cornerRadius = 8
        contentView4.layer.cornerRadius = 8
    }
    func setupLocalication(){
        titleLabel.text = "SaudiـJudo ".localized()
        latestNewsLabel.text = "last_news".localized()
        moreButton.setTitle("more".localized(), for: .normal)
        sectionLabel.text = "section".localized()
        aboutLabel.text = "fed_sections".localized()
        sectionsLabel.text = "about".localized()
        traningLabel.text = "call_center".localized()
        callCenterLabel.text = "traning_cources".localized()
    }
    func setup(){
       latestNewCollectionView.dataSource = self
       latestNewCollectionView.delegate = self
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
                    let imageURL = document["photoUrl"] as? String
                    let title = document["title"] as? String
                    let url = URL(string: imageURL!)
                    let latestnewsObj = LatestNews(image: imageURL!, title: title!)
                    self.latestNewsArray.append(latestnewsObj)
                    self.latestNewCollectionView.reloadData()
                }
            }
        }
    }


    


    
    
    @IBAction func onAboutButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AboutUs", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "AboutFederationVC")
        navigationController?.pushViewController(scene, animated: true)
    }
    @IBAction func onSectionButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Sections", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "FederationSectionSVC")
        navigationController?.pushViewController(scene, animated: true)
    }
    
    @IBAction func onTrainingCoursesButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Training", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "TrainingCoursesVC")
        navigationController?.pushViewController(scene, animated: true)
        
    }
    @IBAction func onMoreButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "NewsVC")
        navigationController?.pushViewController(scene, animated: true)
    }
    
    @IBAction func onContactUsButtonTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ContactUs", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "ContactUsVC")
        navigationController?.pushViewController(scene, animated: true)
        
    }
    
    
    
    

}
extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latestNewsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = latestNewCollectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as? LatestNewsCell{
            cell.newsImageView.sd_setImage(with: URL(string: latestNewsArray[indexPath.item].image!))
            cell.newsTitleLabel.text = latestNewsArray[indexPath.item].title!
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        let width = view.frame.width
//        let cellWidth = (width - 50) /
//        let cellHeight = cellWidth * 1.5

        return CGSize(width: 256, height: 128)

    }

    
}
