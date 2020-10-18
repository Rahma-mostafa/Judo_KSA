//
//  ChampDetalsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/13/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import  FirebaseDatabase
import FirebaseFirestore
import SDWebImage
import SafariServices


class ChampDetailsVC: BaseController {

    @IBOutlet weak var champImageView: RoundedImageView!
    @IBOutlet weak var champName: UILabel!
    @IBOutlet weak var champTypeLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var organiserButton: UIButton!
    @IBOutlet weak var underlineInfoView: UIView!
    @IBOutlet weak var underlineOrderView: UIView!
    @IBOutlet weak var underlineOrganiserView: UIView!
    @IBOutlet weak var underlinePictureView: UIView!
    @IBOutlet weak var firstContainerView: UIView!
    @IBOutlet weak var secondContainerView: UIView!
    @IBOutlet weak var thirdContainerView: UIView!
    @IBOutlet weak var lastContainerView: UIView!
    @IBOutlet weak var additionalDetailsLabel: UILabel!
    @IBOutlet weak var additionalDetails2Label: UILabel!
    @IBOutlet weak var contactUsLabel: UILabel!
    @IBOutlet weak var contactUsfromLabel: UILabel!
    @IBOutlet weak var orByLabel: UILabel!
    @IBOutlet weak var callButton: RoundedButton!
    //variables
    var champID = ""
    var type:Bool = false//formal is true
    var phoneNumber: Int? 
    var twitterUrl: String?
    var snapChatUrl: String?



    override func viewDidLoad() {
        super.viewDidLoad()
        hideView()
        setupLocalization()
        reteriveChampDetails()
        print(phoneNumber)
    }
    
    func hideView(){
        self.hiddenNav = true
        firstContainerView.isHidden = false
        secondContainerView.isHidden = true
        thirdContainerView.isHidden = true
        lastContainerView.isHidden = true
    }
    
    func setupLocalization() {
        infoButton.setTitle("info".localized(), for: .normal)
        orderButton.setTitle("order".localized(), for: .normal)
        pictureButton.setTitle("picture".localized(), for: .normal)
        organiserButton.setTitle("organiser".localized(), for: .normal)
        self.additionalDetailsLabel.text = "additional_detials".localized()
        self.contactUsLabel.text = "contact_us".localized()
        self.contactUsfromLabel.text = "contact_from".localized()
        self.orByLabel.text = "or_by".localized()
        self.callButton.setTitle("call".localized(), for: .normal)
    }
    func reteriveChampDetails(){
        let db = Firestore.firestore()
        db.collection("cships").getDocuments() { (querySnapshot, err) in
            print("connected2")
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    if self.champID == document.documentID{
                        print("data for document")
                        print("\(document.documentID)")
                        let imageURL = document["mainPhoto"] as? String
                        let title = document["title"] as? String
                        let formal = document["formal"] as? Bool
                        let otherDetails = document["otherDetails"] as? String
                        self.phoneNumber = document["phoneNumber"] as? Int
                        self.twitterUrl = (document["twitterUrl"] as? String)
                        self.snapChatUrl = document["snapChatUrl"] as? String
                        self.champName.text = title
                        self.champImageView.sd_setImage(with: URL(string: imageURL!))
                        self.additionalDetails2Label.text = otherDetails
                        self.type = formal!
                        if self.type == true {
                                   self.champTypeLabel.text = "formal".localized()
                               }else{
                                   self.champTypeLabel.text = "friendly".localized()
                               }
                    }
                }
            }
        }
    }
    func setValue(){
        if type == true {
            self.champTypeLabel.text = "formal".localized()
        }else{
            self.champTypeLabel.text = "friendly".localized()
        }
        
    }
    
   
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true) 
            
        
    }
    
    @IBAction func onInfoButtonTapped(_ sender: Any) {
          firstContainerView.isHidden = false
          secondContainerView.isHidden = true
          thirdContainerView.isHidden = true
          lastContainerView.isHidden = true
                     
        
          self.infoButton.setTitleColor(#colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1), for: .normal)
          self.orderButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
          self.pictureButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
          self.organiserButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)

          self.underlineInfoView.backgroundColor = #colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1)
          self.underlineOrderView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
          self.underlinePictureView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
          self.underlineOrganiserView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
    

    }
    
    @IBAction func onOrderButtonTapped(_ sender: Any) {
         firstContainerView.isHidden = true
         secondContainerView.isHidden = false
         thirdContainerView.isHidden = true
         lastContainerView.isHidden = true
                            
        self.infoButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
        self.orderButton.setTitleColor(#colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1), for: .normal)
        self.pictureButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
        self.organiserButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)

        self.underlineInfoView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
        self.underlineOrderView.backgroundColor = #colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1)
        self.underlinePictureView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
        self.underlineOrganiserView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)

    }
    @IBAction func onPictureButtonTapped(_ sender: Any) {
         firstContainerView.isHidden = true
         secondContainerView.isHidden = true
         thirdContainerView.isHidden = false
         lastContainerView.isHidden = true
                    
         self.infoButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
         self.orderButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
         self.pictureButton.setTitleColor(#colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1), for: .normal)
         self.organiserButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)

         self.underlineInfoView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
         self.underlineOrderView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
         self.underlinePictureView.backgroundColor = #colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1)
         self.underlineOrganiserView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)

    }
    @IBAction func onOrganiserButtonTapped(_ sender: Any) {
        firstContainerView.isHidden = true
        secondContainerView.isHidden = true
        thirdContainerView.isHidden = true
        lastContainerView.isHidden = false
                   
        self.infoButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
        self.orderButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
        self.pictureButton.setTitleColor(#colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1), for: .normal)
        self.organiserButton.setTitleColor(#colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1), for: .normal)

        self.underlineInfoView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
        self.underlineOrderView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
        self.underlinePictureView.backgroundColor = #colorLiteral(red: 0.5019147396, green: 0.5019902587, blue: 0.5018982291, alpha: 1)
        self.underlineOrganiserView.backgroundColor = #colorLiteral(red: 0.2159663439, green: 0.7002520561, blue: 0.28937608, alpha: 1)

        
    }
    @IBAction func onTwitterButtonTapped(_ sender: Any) {
        didTapWatch(url: twitterUrl!)
    }
    @IBAction func onSnapButtonTapped(_ sender: Any) {
        didTapWatch(url: snapChatUrl!)
    }
    
    @IBAction func onWhatsappbuttonTapped(_ sender: Any) {
        let appURL = URL(string: "https://wa.me/\(String(describing: phoneNumber))")!
//                let appURL = URL(string: "\(String(describing: twitterUrl))")!

        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL)
            }
        }
    }
    @IBAction func onCallButtonTapped(_ sender: Any) {
        let appURL = URL(string: "tel://\(String(describing: phoneNumber))")!
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL)
            }
        }

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ChampInfoVC,
            segue.identifier == "info" {
            vc.champID = self.champID
            }
        if let vc = segue.destination as? WinersOrderVC,
            segue.identifier == "order" {
            vc.champID = self.champID
            }
        if let vc = segue.destination as? ChampPictureVC,
            segue.identifier == "photos" {
            vc.champID = self.champID
            }
        if let vc = segue.destination as? OrganiserVC,
                segue.identifier == "organiser" {
                vc.champID = self.champID
           }
    }


   
      

    
}
