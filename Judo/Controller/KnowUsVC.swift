//
//  KnowUsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class KnowUsVC: BaseController {
    @IBOutlet var titleLabel: UIBarButtonItem!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var achievementLabel: UILabel!
    @IBOutlet weak var specialLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var content2Label: UILabel!
     @IBOutlet weak var content3Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
//        setupLocalization()
        retreiveContent()
        retreivehistory()
        retreiveadvantages()

    }
    func setupLocalization(){
        historyLabel.text = "fed_history".localized()
        achievementLabel.text = "fed_achevements".localized()
        specialLabel.text = "fed_special".localized()
        titleLabel.title = "know_us".localized()
        
        
    }

    func retreivehistory(){
        self.activityIndicator.startAnimating()
        let db = Firestore.firestore()
        db.collection("history").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let message = document["message"] as? String
                    self.contentLabel.text = message
                }
                self.activityIndicator.stopAnimating()
            }
        }
    }
    func retreiveContent(){
        self.activityIndicator.startAnimating()
        let db = Firestore.firestore()
        db.collection("achievements").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let message = document["message"] as? String
                    self.content2Label.text = message
                }
                self.activityIndicator.stopAnimating()
            }
        }
    }
    func retreiveadvantages(){
        self.activityIndicator.startAnimating()
        let db = Firestore.firestore()
        db.collection("advantages").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let message = document["message"] as? String
                    self.content3Label.text = message
                }
                self.activityIndicator.stopAnimating()
            }
        }
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    


}
