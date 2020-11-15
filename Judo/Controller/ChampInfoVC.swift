//
//  ChampInfoVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/13/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase
import SDWebImage

class ChampInfoVC: BaseController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateValueLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageValueLabel: UILabel!
    @IBOutlet weak var champLocationLabel: UILabel!
    @IBOutlet weak var locationDecsLabel: UILabel!
    
    //variables
    var champID = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
//        setupLocalization()
        reteriveChampInfo()

    }
    
    func setupLocalization(){
        dateLabel.text = "date".localized()
        ageLabel.text = "age".localized()
        champLocationLabel.text = "champ_location".localized()
    }
    func reteriveChampInfo(){
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
                        let date = document["date"] as? String
                        let age = document["age"] as? Int
                        let location = document["location"] as? String
                        self.dateValueLabel.text = date
                        self.ageValueLabel.text = "\(age ?? 0)"
                        self.locationDecsLabel.text = location
                    }
                }
            }
        }
    }


  

}
