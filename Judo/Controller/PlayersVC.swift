//
//  PlayersVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/6/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import SDWebImage


class PlayersVC: BaseController {

     @IBOutlet weak var TableView: UITableView!
     @IBOutlet weak var mainCollectionView: UICollectionView!
    
           
    //    variabls
    var manager:[Managers] = [Managers]()
    var players:[Players] = [Players]()
    var userSelectedCategory = ""
    var selectedIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        playersMainList()
    }
    func setup(){
        self.hiddenNav = false
         TableView.delegate = self
         TableView.dataSource = self
         mainCollectionView.delegate = self
         mainCollectionView.dataSource = self
    }
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }

    
}

extension PlayersVC :UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "PlayerListCell", for: indexPath)as? mainPlayerslistCell{
            cell.listTypeLabel.text = players[indexPath.item].type
            if indexPath.item == selectedIndex{
                cell.coloredBackgroundView.backgroundColor = #colorLiteral(red: 0.7241227627, green: 0.8952017426, blue: 0.7469118237, alpha: 1)
                cell.WhiteView.backgroundColor = #colorLiteral(red: 0.7241227627, green: 0.8952017426, blue: 0.7469118237, alpha: 1)
                cell.listTypeLabel.textColor = #colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1)
            }else{
                cell.coloredBackgroundView.backgroundColor = UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0)
                cell.WhiteView.backgroundColor = UIColor.white
                cell.listTypeLabel.textColor = UIColor(red: 96/255, green: 96/255, blue: 96/255, alpha: 1.0)
            }
        return cell
    }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        collectionView.reloadData()
        collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        self.userSelectedCategory = players[indexPath.item].type
        retreivePlayersDetails()
        self.manager.removeAll()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.25 , height: 100.0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.count
    }
               
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                   
        if let cell = TableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)as? PlayersCell{
            cell.pictureImageView.sd_setImage(with: URL(string: manager[indexPath.item].image!))
            cell.nameLabel.text = manager[indexPath.item].name
            cell.roleLabel.text = manager[indexPath.item].role
            return cell
        }
        return UITableViewCell()
    }

}
extension PlayersVC{
    func playersMainList(){
        let db = Firestore.firestore()
        db.collection("players").getDocuments() { (querySnapshot, err) in
            print("1")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let list = document.documentID
                    let playerList = Players(type: list)
                    self.players.append(playerList)
                    self.mainCollectionView.reloadData()
                }
            }
        }
    }
    func retreivePlayersDetails(){
        let db = Firestore.firestore()
    db.collection("players").document("\(userSelectedCategory)").collection("playerDetails").getDocuments() { (querySnapshot, err) in
            print("1")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    let imageURL = document["avatarUrl"] as? String
                    let title = document["name"] as? String
                    let club = document["club"] as? String
                    let obj = Managers(image: imageURL!, name: title!, role: club! )
                    self.manager.append(obj)
                    self.TableView.reloadData()
                }
            }
        }
    }

    
    
}
