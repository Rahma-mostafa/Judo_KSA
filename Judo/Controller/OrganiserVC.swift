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

class OrganiserVC: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    var manager:[Managers] = [Managers]()
    var champID = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        reteriveOrganiser()

    }
    func setup(){
        TableView.delegate = self
        TableView.dataSource = self
    }
    func reteriveOrganiser(){
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
                        if let orgName1 = document["orgName1"]{
                            if let orgJob1 = document["orgJob1"] {
                                if let imageUrl1 = document["orgAvatar1"]{
                                    let obj = Managers(image: imageUrl1 as! String,name: orgName1 as! String, role: orgJob1 as! String)
                                    self.manager.append(obj)
                                    self.TableView.reloadData()
                                }
                            }
                        }
                        if let orgName2 = document["orgName2"] as? String{
                            if let orgJob2 = document["orgJob2"] as? String{
                                if let imageUrl2 = document["orgAvatar2"] as? String{
                                    let obj = Managers(image: imageUrl2,name: orgName2, role: orgJob2)
                                    self.manager.append(obj)
                                    self.TableView.reloadData()
                                }
                            }
                        }
                        if let orgName3 = document["orgName3"] as? String{
                            if let orgJob3 = document["orgJob3"] as? String{
                                if let imageUrl3 = document["orgAvatar3"] as? String{
                                    let obj = Managers(image: imageUrl3,name: orgName3, role: orgJob3)
                                    self.manager.append(obj)
                                    self.TableView.reloadData()
                                }
                           }
                       }
                   }
                }
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

