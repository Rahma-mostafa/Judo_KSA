//
//  FullPictureVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/13/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import SDWebImage

class FullPictureVC: BaseController {
    @IBOutlet weak var fullImage: UIImageView!
    var champID = ""
    var photoUrl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reterivePhoto()
        setup()

    }
    func setup(){
        self.hiddenNav = false
        fullImage.layer.cornerRadius = 10

    }
    func reterivePhoto(){
    let db = Firestore.firestore()
        db.collection("cships").document("\(champID)").collection("csPhotos").getDocuments()  { (querySnapshot, err) in
        print("connected")
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                    print("\(document.documentID)")
                if self.photoUrl == document.documentID{
                    if let gPhoto = document["gPhoto"] as? String{
                        self.fullImage.sd_setImage(with: URL(string: gPhoto))
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func onCancelBttonTapped(_ sender: Any) {
        self.dismiss(animated: true)

//        self.navigationController?.popViewController(animated: true)
    }
    

}
