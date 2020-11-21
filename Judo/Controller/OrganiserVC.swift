//
//  OrganiserVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/13/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseFirestore
import  FirebaseDatabase
import SDWebImage

class OrganiserVC: BaseController {
    @IBOutlet weak var TableView: UITableView!
    var manager:[Managers] = [Managers]()
    var champID = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        reteriveOrganiser()

    }
    func setup(){
        self.hiddenNav = false
        TableView.delegate = self
        TableView.dataSource = self
    }
    func reteriveOrganiser(){
        self.activityIndicator.startAnimating()
        let db = Firestore.firestore()
        db.collection("cships").document("\(champID)").collection("csOrganizers").getDocuments() { (querySnapshot, err) in
            print("connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                        print("data for document")
                        print("\(document.documentID)")
                        if let orgName = document["orgName"]{
                            if let orgJob = document["orgJob"] {
                                if let imageUrl = document["orgAvatar"]{
                                    let obj = Managers(image: imageUrl as? String,name: orgName as? String, role: orgJob as? String)
                                    self.manager.append(obj)
                                    self.TableView.reloadData()
                                }
                            }
                        }
                }
                self.activityIndicator.stopAnimating()
            }
        }
    }
    

    
}
extension OrganiserVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.count
    }
               
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = TableView.dequeueReusableCell(withIdentifier: "OrganiserCell", for: indexPath)as? OrganiserCell{
           cell.pictureImageView.sd_setImage(with: URL(string: manager[indexPath.item].image!))
           cell.nameLabel.text = manager[indexPath.item].name
           cell.roleLabel.text = manager[indexPath.item].role
                return cell
        }
          return UITableViewCell()
    }

}

