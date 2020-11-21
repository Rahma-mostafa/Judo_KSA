//
//  FederationTargetsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore

class FederationTargetsVC: BaseController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet var titleLabel: UIBarButtonItem!
    @IBOutlet weak var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
//        setLocalize()

        retreiveContent()
       

    }
    func setLocalize(){
        label.text = "what_target".localized()
        titleLabel.title = "federation_targets".localized()
    }
    func retreiveContent(){
        self.activityIndicator.startAnimating()
        let db = Firestore.firestore()
        db.collection("ourGoal").getDocuments() { (querySnapshot, err) in
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
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
   

}
