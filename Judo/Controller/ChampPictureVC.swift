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

class ChampPictureVC: BaseController {

    @IBOutlet weak var pictureCollectionView: UICollectionView!
    //variables
    var champPicture:[Picture] = [Picture]()
    var champID = ""
    var photoUrl = ""
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        reterivePhotos()
    }
    func setup(){
        self.hiddenNav = false
        pictureCollectionView.dataSource = self
        pictureCollectionView.delegate = self
    }

    func reterivePhotos(){
        let db = Firestore.firestore()
        db.collection("cships").document("\(champID)").collection("csPhotos").getDocuments()  { (querySnapshot, err) in
            print("connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                        print("\(document.documentID)")
                        if let gPhoto = document["gPhoto"] as? String{
                            let id = document.documentID
                            let obj = Picture(name: gPhoto, id: id)
                            self.champPicture.append(obj)
                            self.pictureCollectionView.reloadData()

                        }
                    }
                self.activityIndicator.startAnimating()

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
            cell.pictureImageView.sd_setImage(with: URL(string: champPicture[indexPath.item].name!))
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.photoUrl = champPicture[indexPath.item].id!
        performSegue(withIdentifier: "showPhoto", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! FullPictureVC
             vc.photoUrl = self.photoUrl
             vc.champID = self.champID
       }

}
