//
//  FederationEstablishersVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//
struct Establisher {
    var image: String?
    var name: String?
    var role: String?
}

import UIKit
import FirebaseDatabase

class FederationEstablishersVC: UIViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var EachEstablisherLabel: UILabel!
    @IBOutlet weak var establisherTableView: UITableView!
//    variabls
//    var stablisher:[Establisher] = [Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو"),Establisher(image: "00100sPORTRAIT_00100_BURST٢٠١٩١٢٠٦١٥٤٦١٧٠٩٤_COVER", name: "ك/ محمد بن علاء الكبير", role: "مدرب السعودية للجودو")]
    var stablisher:[Establisher] = [Establisher()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupLocalization()
        retreiveEstalisher()
        
    }
    func setup(){
        establisherTableView.delegate = self
        establisherTableView.dataSource = self
    }
    func setupLocalization(){
        greetingLabel.text = "greeting".localized()
        EachEstablisherLabel.text = "greeting_for_each".localized()
    }
    func retreiveEstalisher(){
        let ref = Database.database().reference()
        ref.child("news").observeSingleEvent(of: .value) { (snapshot) in
            let snapshotValue =  snapshot.value as? [String:Any]
//            let image = snapshotValue["photoUrl"]!
            let title = snapshotValue!["title"]
            
            print(title)
            var establisherObject = Establisher()
//            establisherObject.image = image
            establisherObject.name = title as! String
            self.stablisher.append(establisherObject)
            self.establisherTableView.reloadData()
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
//            cell.establisherImageView.image = UIImage(named: stablisher[indexPath.row].image!)
            cell.establisherNameLabel.text = stablisher[indexPath.item].name
//            cell.estabilisherRoleLabel.text = stablisher[indexPath.item].role
            return cell

        }
        return UITableViewCell()
    }
    
    
}
