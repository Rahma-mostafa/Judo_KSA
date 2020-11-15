//
//  CourseDetailsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/8/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import SDWebImage


class CourseDetailsVC: BaseController {
    @IBOutlet weak var CourseImageView: RoundedImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var age2Label: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var period2Label: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var cost2Label: UILabel!
    @IBOutlet weak var champLocationLabel: UILabel!
    @IBOutlet weak var champLocation2Label: UILabel!
    @IBOutlet weak var additionalDetailsLabel: UILabel!
    @IBOutlet weak var additionalDetails2Label: UILabel!
    @IBOutlet weak var contactUsLabel: UILabel!
    @IBOutlet weak var contactUsfromLabel: UILabel!
    @IBOutlet weak var orByLabel: UILabel!
    @IBOutlet weak var callButton: RoundedButton!
    // variables
    var courseID = ""
    var courseType = ""
    var phoneNumber: Int?
    var twitterUrl: String?
    var snapChatUrl: String?
    var location: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = true
//        setupLocaliztion()
        retreiveDetails()
        setContacts()
    }
    func retreiveDetails(){
        if courseType == "amateur"{
            retreiveAmateurTrainings()
        }else if courseType == "old"{
            retreiveOldTrainings()
        }else if courseType == "pro"{
            retreiveProTrainings()
        }else{
            retreiveYoungTrainings()
        }
    }
    func setupLocaliztion(){
        self.dateLabel.text = "date".localized()
        self.ageLabel.text = "age".localized()
        self.periodLabel.text = "period".localized()
        self.costLabel.text = "cost".localized()
        self.champLocationLabel.text = "champ_location".localized()
        self.additionalDetailsLabel.text = "additional_detials".localized()
        self.contactUsLabel.text = "contact_us".localized()
        self.contactUsfromLabel.text = "contact_from".localized()
        self.orByLabel.text = "or_by".localized()
        self.callButton.setTitle("call".localized(), for: .normal)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func onTwitterButtonTapped(_ sender: Any) {
        didTapWatch(url: twitterUrl!)

    }
    @IBAction func onSnapButtonTapped(_ sender: Any) {
        didTapWatch(url: snapChatUrl!)

    }
    
    @IBAction func onWhatsappbuttonTapped(_ sender: Any) {
        let appURL = URL(string: "https://wa.me/\(phoneNumber ?? 0)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL)
            }
        }
    }
    @IBAction func onCallButtonTapped(_ sender: Any) {
        let appURL = URL(string: "tel://\(phoneNumber ?? 0)")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL)
            }
        }
    }
    
}
extension CourseDetailsVC{
    func retreiveAmateurTrainings(){
        let db = Firestore.firestore()
        db.collection("amateurTrainings").getDocuments() { (querySnapshot, err) in
            print("firestore is connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if self.courseID == document.documentID{
                        print("data for document")
                        print("\(document.documentID)")
                        let imageURL = document["photoUrl"] as? String
                        let title = document["title"] as? String
                        let date = document["date"] as? String
                        let age = document["age"] as? Int
                        let price = document["price"] as? String
                        let period = document["period"] as? String
                        let location = document["location"] as? String
                        let otherDetails = document["otherDetails"] as? String
                        self.titleLabel.text = title
                        self.date2Label.text = date
                        self.age2Label.text = "\(age ?? 0)"
                        self.cost2Label.text = price
                        self.CourseImageView.sd_setImage(with: URL(string: imageURL!))
                        self.period2Label.text = period
                        self.champLocation2Label.text = location
                        self.additionalDetails2Label.text = otherDetails
                    }
                }
            }
        }
    }
    func retreiveOldTrainings(){
        let db = Firestore.firestore()
        db.collection("oldTrainings").getDocuments() { (querySnapshot, err) in
            print("firestore is connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if self.courseID == document.documentID{
                        print("data for document")
                        print("\(document.documentID)")
                        let imageURL = document["photoUrl"] as? String
                        let title = document["title"] as? String
                        let date = document["date"] as? String
                        let age = document["age"] as? Int
                        let price = document["price"] as? String
                        let period = document["period"] as? String
                        let location = document["location"] as? String
                        let otherDetails = document["otherDetails"] as? String
                        self.titleLabel.text = title
                        self.date2Label.text = date
                        self.age2Label.text = "\(age ?? 0)"
                        self.cost2Label.text = price
                        self.CourseImageView.sd_setImage(with: URL(string: imageURL!))
                        self.period2Label.text = period
                        self.champLocation2Label.text = location
                        self.additionalDetails2Label.text = otherDetails
                    }
                }
            }
        }
    }
    func retreiveProTrainings(){
        let db = Firestore.firestore()
        db.collection("proTrainings").getDocuments() { (querySnapshot, err) in
            print("firestore is connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if self.courseID == document.documentID{
                        print("data for document")
                        print("\(document.documentID)")
                        let imageURL = document["photoUrl"] as? String
                        let title = document["title"] as? String
                        let date = document["date"] as? String
                        let age = document["age"] as? Int
                        let price = document["price"] as? String
                        let period = document["period"] as? String
                        let location = document["location"] as? String
                        let otherDetails = document["otherDetails"] as? String
                        self.titleLabel.text = title
                        self.date2Label.text = date
                        self.age2Label.text = "\(age ?? 0)"
                        self.cost2Label.text = price
                        self.CourseImageView.sd_setImage(with: URL(string: imageURL!))
                        self.period2Label.text = period
                        self.champLocation2Label.text = location
                        self.additionalDetails2Label.text = otherDetails
                    }
                }
            }
        }
    }
    func retreiveYoungTrainings(){
        let db = Firestore.firestore()
        db.collection("youngTrainings").getDocuments() { (querySnapshot, err) in
            print("firestore is connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if self.courseID == document.documentID{
                        print("data for document")
                        print("\(document.documentID)")
                        let imageURL = document["photoUrl"] as? String
                        let title = document["title"] as? String
                        let date = document["date"] as? String
                        let age = document["age"] as? Int
                        let price = document["price"] as? String
                        let period = document["period"] as? String
                        let location = document["location"] as? String
                        let otherDetails = document["otherDetails"] as? String
                        self.titleLabel.text = title
                        self.date2Label.text = date
                        self.age2Label.text = "\(age ?? 0)"
                        self.cost2Label.text = price
                        self.CourseImageView.sd_setImage(with: URL(string: imageURL!))
                        self.period2Label.text = period
                        self.champLocation2Label.text = location
                        self.additionalDetails2Label.text = otherDetails
                    }
                }
            }
        }
    }
    func setContacts(){
        let db = Firestore.firestore()
        db.collection("contacts").getDocuments() { (querySnapshot, err) in
            print("connected")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    self.phoneNumber = document["phoneNumber"] as? Int
                    self.twitterUrl = document["twitterUrl"] as? String
                    self.snapChatUrl = document["snapChatUrl"] as? String
                    self.location = document["location"] as? String
                }
            }
        }
    }
    
}
