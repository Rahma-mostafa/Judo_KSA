//
//  ChampVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/12/20.
//  Copyright © 2020 rahma. All rights reserved.
//
struct Champ {
    var image: String?
    var title: String?
    var date: String?
    var type: Bool?
    var id: String?
//    var cornerImage: String?
}

import UIKit
import FirebaseFirestore
import SDWebImage

class ChampVC: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var champCollectionView: UICollectionView!
    
    //variables
    var champArray:[Champ] = [Champ]()
    var type:Bool = true  //formal is true
    var champID = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        retreiveChampShips()
        self.titleLabel.text = "last_champ".localized()
        print(type)

    }
    func setup(){
        champCollectionView.dataSource = self
        champCollectionView.delegate = self
        
    }
    func retreiveChampShips(){
           let db = Firestore.firestore()
           db.collection("cships").getDocuments() { (querySnapshot, err) in
               print("connected")
               if let err = err {
                   print("Error getting documents: \(err)")
               } else {
                   for document in querySnapshot!.documents {
                       print("\(document.documentID) => \(document.data())")
                       let id = document.documentID
                       let imageURL = document["gPhoto1"] as? String
                       let title = document["title"] as? String
                       let date = document["date"] as? String
                       let type = document["formal"] as? Bool
                       let url = URL(string: imageURL!)
                       let champObj = Champ(image: imageURL!, title: title!,date: date!,type: type!, id: id)
                       self.champArray.append(champObj)
                       self.champCollectionView.reloadData()
                   }
               }
           }
       }

    
    

   
}
extension ChampVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return champArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       if let cell = champCollectionView.dequeueReusableCell(withReuseIdentifier: "ChampCell", for: indexPath)as? ChampCell{
                cell.champImageView.sd_setImage(with: URL(string: champArray[indexPath.item].image!))
                cell.nameLabel.text = champArray[indexPath.item].title
                cell.dateLabel.text = champArray[indexPath.item].date
                if champArray[indexPath.item].type == true{
                   if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                    cell.cornerImageView.image = UIImage(named: "tag en")
                   }else{
                    cell.cornerImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                    cell.cornerImageView.image = UIImage(named: "tag")
                    }
                }else{
                    if LocalizationSystem.sharedInstance.getLanguage() == "en"{
                        cell.cornerImageView.image = UIImage(named: "tag en2")
                    }else{
                        cell.cornerImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                        cell.cornerImageView.image = UIImage(named: "tag2")
                    }
                }
                return cell
            }
            return UICollectionViewCell()
            
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//           let storyboard = UIStoryboard(name: "Main", bundle: nil)
//           let scene = storyboard.instantiateViewController(identifier: "ChampDetailsVC")
//           navigationController?.pushViewController(scene, animated: true)
        self.champID = champArray[indexPath.item].id!
        print("MainID = \(champID)")
        performSegue(withIdentifier: "champDetails", sender: self)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          let vc = segue.destination as! ChampDetailsVC
           vc.champID = self.champID
           vc.type = self.type
     }
    
       
    
    
}
