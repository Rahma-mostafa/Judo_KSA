//
//  FederationEstablishersVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import SDWebImage

class FederationEstablishersVC: BaseController {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var EachEstablisherLabel: UILabel!
    @IBOutlet weak var establisherTableView: UITableView!
    
    @IBOutlet var titleLabel: UIBarButtonItem!
    //    variabls
    var stablisher:[Establisher] = [Establisher]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        setupLocalization()
        retreiveEstalisher()
        
    }
    func setup(){
        self.hiddenNav = false
        establisherTableView.delegate = self
        establisherTableView.dataSource = self
    }
    func setupLocalization(){
        greetingLabel.text = "greeting".localized()
        EachEstablisherLabel.text = "greeting_for_each".localized()
        titleLabel.title = "federation_establishers".localized()
    
    }

    func retreiveEstalisher(){
        self.activityIndicator.startAnimating()
        let db = Firestore.firestore()
        db.collection("establishers").getDocuments() { (querySnapshot, err) in
            print("1")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let imageURL = document["avatarUrl"] as? String
                    let title = document["name"] as? String
                    let jop = document["jop"] as? String
                    let latestnewsObj = Establisher(image: imageURL!, name: title!, role: jop!)
                    self.stablisher.append(latestnewsObj)
                    self.establisherTableView.reloadData()
                }
                self.activityIndicator.stopAnimating()

            }
        }
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    

}
extension FederationEstablishersVC :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stablisher.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = establisherTableView.dequeueReusableCell(withIdentifier: "EstablisherCell", for: indexPath)as? EstablisherCell{
            cell.establisherImageView.sd_setImage(with: URL(string: stablisher[indexPath.item].image!))
            cell.establisherNameLabel.text = stablisher[indexPath.item].name
            cell.estabilisherRoleLabel.text = stablisher[indexPath.item].role
            return cell

        }
        return UITableViewCell()
    }
    
    
}
