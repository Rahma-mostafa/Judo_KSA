//
//  FederationMissionVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class FederationMissionVC: BaseController {
    @IBOutlet weak var mission: UILabel!
    @IBOutlet var titleLabel: UIBarButtonItem!
    @IBOutlet weak var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
        retreiveContent()
      
    }
    func setLocalize(){
        mission.text = "fed_mission".localized()
        titleLabel.title = "federation_mission".localized()

    }
    func retreiveContent(){
        let db = Firestore.firestore()
        db.collection("ourMessage").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let message = document["message"] as? String
                    self.contentLabel.text = message
                }
            }
        }
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    

    
}
