//
//  ChampPictureVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/13/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase
import SDWebImage

class ChampPictureVC: UIViewController {

    @IBOutlet weak var pictureCollectionView: UICollectionView!
//    var champPicture:[Picture] = [Picture(name:"e_scusn_1_uea_ac_8_kp"),Picture(name:"e_scusn_1_uea_ac_8_kp"),Picture(name:"e_scusn_1_uea_ac_8_kp"),Picture(name:"e_scusn_1_uea_ac_8_kp"),Picture(name:"e_scusn_1_uea_ac_8_kp"),Picture(name:"e_scusn_1_uea_ac_8_kp"),Picture(name:"e_scusn_1_uea_ac_8_kp"),Picture(name:"e_scusn_1_uea_ac_8_kp")]
    var champPicture:[Picture] = [Picture]()
    var champID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        reterivePhotos()
    }
    func setup(){
        pictureCollectionView.dataSource = self
        pictureCollectionView.delegate = self
        
    }
    func reterivePhotos(){
        let db = Firestore.firestore()
        db.collection("cships").getDocuments() { (querySnapshot, err) in
            print("connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if self.champID == document.documentID{
                        print("data for document")
                        print("\(document.documentID)")
                        let gPhoto1 = document["gPhoto1"] as? String
                        let gPhoto2 = document["gPhoto2"] as? String
                        let gPhoto3 = document["gPhoto3"] as? String
                        let gPhoto4 = document["gPhoto4"] as? String
                        let gPhoto5 = document["gPhoto5"] as? String
                        let gPhoto6 = document["gPhoto6"] as? String
                        let gPhoto7 = document["gPhoto7"] as? String
                        let gPhoto8 = document["gPhoto8"] as? String
                        let gPhoto9 = document["gPhoto9"] as? String
                        let gPhoto10 = document["gPhoto10"] as? String
                        let gPhoto11 = document["gPhoto11"] as? String
                        let gPhoto12 = document["gPhoto12"] as? String

                        let obj = Picture(name1: gPhoto1!, name2: gPhoto2!, name3: gPhoto3!,name4: gPhoto4!, name5: gPhoto5!, name6: gPhoto6!, name7: gPhoto7!, name8: gPhoto8! ,name9: gPhoto9!, name10:  gPhoto10!, name11: gPhoto11!, name12: gPhoto12!)
                          self.champPicture.append(obj)
                          self.pictureCollectionView.reloadData()

                    }
                }
            }
        }
    }

    

   

}
extension ChampPictureVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return champPicture.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = pictureCollectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as? PictureCell{
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name1!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name2!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name3!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name4!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name5!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name6!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name7!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name8!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name9!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name10!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name11!))
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name12!))

            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let scene = storyboard.instantiateViewController(identifier: "FullPictureVC")
              navigationController?.pushViewController(scene, animated: true)
          }
   
    
        

    
    
}
