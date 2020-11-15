//
//  ChampVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/12/20.
//  Copyright © 2020 rahma. All rights reserved.
//


import UIKit
import FirebaseFirestore
import SDWebImage

class ChampVC: BaseController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var champCollectionView: UICollectionView!
    
    //variables
    var champArray:[Champ] = [Champ]()
    var type = ""  //formal is true
    var champID = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        retreiveChampShips()
        setLocalized()

    }
    func setup(){
        self.hiddenNav = false
        champCollectionView.dataSource = self
        champCollectionView.delegate = self
        
    }
    func setLocalized(){
        self.titleLabel.text = "last_champ".localized()

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
                       let imageURL = document["mainPhoto"] as? String
                       let title = document["title"] as? String
                       let date = document["date"] as? String
                       let type = document["status"] as? String
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
                if champArray[indexPath.item].type == "رسمية" || champArray[indexPath.item].type ==  "رسميه"{
                    cell.cornerImageView.image = UIImage(named:"tag")

                }else{
                    cell.cornerImageView.image = UIImage(named:"tag2")
                }
    
//                if champArray[indexPath.item].type == true{
//                   if LocalizationSystem.sharedInstance.getLanguage() == "en"{
//                    cell.cornerImageView.image = UIImage(named: "tag en")
//                   }else{
//                    cell.cornerImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
//                    cell.cornerImageView.image = UIImage(named: "tag")
//                    }
//                }else{
//                    if LocalizationSystem.sharedInstance.getLanguage() == "en"{
//                        cell.cornerImageView.image = UIImage(named: "tag en2")
//                    }else{
//                        cell.cornerImageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
//                        cell.cornerImageView.image = UIImage(named: "tag2")
//                    }
//                }
                return cell
            }
            return UICollectionViewCell()
            
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.champID = champArray[indexPath.item].id!
//        print("MainID = \(champID)")
        performSegue(withIdentifier: "champDetails", sender: self)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          let vc = segue.destination as! ChampDetailsVC
           vc.champID = self.champID
           vc.type = self.type
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        return CGSize(width: self.view.frame.size.width, height: 116)

    }
    
       
    
    
}
