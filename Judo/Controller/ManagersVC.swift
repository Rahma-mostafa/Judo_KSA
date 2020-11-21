//
//  ManagersVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/6/20.
//  Copyright © 2020 rahma. All rights reserved.
//




import UIKit
import FirebaseDatabase
import FirebaseFirestore
import SDWebImage

class ManagersVC: BaseController {


    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var EachLabel: UILabel!
    @IBOutlet weak var TableView: UITableView!
    
    //    variabls

     var manager:[Managers] = [Managers]()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setup()
//            setupLocalization()
            retreiveLatestNews()
            
        }
        func setup(){
            self.hiddenNav = false
            TableView.delegate = self
            TableView.dataSource = self
        }
        func setupLocalization(){
            greetingLabel.text = "greeting".localized()
            EachLabel.text = "greeting_for_each".localized()
        }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    func retreiveLatestNews(){
        self.activityIndicator.startAnimating()
        let db = Firestore.firestore()
        db.collection("adminsSection").getDocuments() { (querySnapshot, err) in
            print("1")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let imageURL = document["avatarUrl"] as? String
                    let title = document["name"] as? String
                    let club = document["club"] as? String
                    let latestnewsObj = Managers(image: imageURL!, name: title!, role: club!)
                    self.manager.append(latestnewsObj)
                    self.TableView.reloadData()
                }
                self.activityIndicator.stopAnimating()

            }
        }
    }
    


    }

extension ManagersVC :UITableViewDelegate,UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return manager.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = TableView.dequeueReusableCell(withIdentifier: "ManagerCell", for: indexPath)as? ManagerCell{
                cell.pictureImageView.sd_setImage(with: URL(string: manager[indexPath.item].image!))
                cell.nameLabel.text = manager[indexPath.item].name
                cell.roleLabel.text = manager[indexPath.item].role
                return cell

            }
            return UITableViewCell()
        }
        
        
    }
