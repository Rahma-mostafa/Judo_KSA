//
//  WinersOrderVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/13/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore


class WinersOrderVC: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var player1label: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var player2Label: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var player3Label: UILabel!
    @IBOutlet weak var giftsLabel: UILabel!
    @IBOutlet weak var giftsDescLabel: UILabel!
    
    var champID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
        reteriveOrder()

    }
    func setupLocalization(){
        firstLabel.text = "first".localized()
        secondLabel.text = "second".localized()
        thirdLabel.text = "third".localized()
        giftsLabel.text = "gift".localized()
    }
    func reteriveOrder(){
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
                        let player1 = document["player1"] as? String
                        let player2 = document["player2"] as? String
                        let player3 = document["player3"] as? String
                        let gift = document["giftDetails"] as? String
                        self.player1label.text = player1
                        self.player2Label.text = player2
                        self.player3Label.text = player3
                        self.giftsDescLabel.text = gift
                    }
                }
            }
        }
    }

    

    
}
