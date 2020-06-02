//
//  ContactUsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/11/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseDatabase

class ContactUsVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressDetailsLabel: UILabel!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var msgTextField: UITextField!
    @IBOutlet weak var msgButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var callUsLabel: UILabel!
    @IBOutlet weak var callButton: RoundedButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
        setup()
        setCornerRadius()
    }
    func setup(){
        nameTextField.delegate = self
        phoneTextField.delegate = self
        msgTextField.delegate = self
    }
    func setCornerRadius(){
        nameTextField.layer.cornerRadius = 7
        phoneTextField.layer.cornerRadius = 7
        msgTextField.layer.cornerRadius = 7
        msgButton.layer.cornerRadius = 7
        locationButton.layer.cornerRadius = 7
    }
    func setupLocalization(){
        label1.text = "send_msg".localized()
        label2.text = "send_msg_allthetime".localized()
        self.addressLabel.text = "our_address".localized()
        self.contactLabel.text = "our_contacts".localized()
        self.callUsLabel.text = "call_us".localized()
        self.msgButton.setTitle("send_themsg".localized(), for: .normal)
        locationButton.setTitle("to_location".localized(), for:.normal)
        callButton.setTitle("call".localized(), for:.normal)
        nameTextField.attributedPlaceholder = NSAttributedString(string: "full_name".localized())
        phoneTextField.attributedPlaceholder = NSAttributedString(string: "phone_number".localized())
        msgTextField.attributedPlaceholder = NSAttributedString(string: "msg".localized())
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = #colorLiteral(red: 0.3764348626, green: 0.3764933944, blue: 0.3764220476, alpha: 1)
        }else if textField == phoneTextField{
            textField.layer.borderWidth = 1
            textField.layer.borderColor = #colorLiteral(red: 0.3764348626, green: 0.3764933944, blue: 0.3764220476, alpha: 1)
        }else if textField == msgTextField{
            textField.layer.borderWidth = 1
            textField.layer.borderColor = #colorLiteral(red: 0.3764348626, green: 0.3764933944, blue: 0.3764220476, alpha: 1)
            
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = #colorLiteral(red: 0.8781557083, green: 0.8745183945, blue: 0.8786954284, alpha: 1)
        }else if textField == phoneTextField{
            textField.layer.borderWidth = 1
            textField.layer.borderColor = #colorLiteral(red: 0.8781557083, green: 0.8745183945, blue: 0.8786954284, alpha: 1)
        }else if textField == msgTextField{
            textField.layer.borderWidth = 1
            textField.layer.borderColor = #colorLiteral(red: 0.8781557083, green: 0.8745183945, blue: 0.8786954284, alpha: 1)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil {
             return true
          } else {
          return false
       }
    }
    func setMessage(){
        // Add a new document with a generated id.
        var ref: DocumentReference? = nil
        let db = Firestore.firestore()
        let name = nameTextField.text!
        let phone = phoneTextField.text!
        let msg = msgTextField.text!
        ref = db.collection("joinUs").addDocument(data: [
            "name": "\(name)",
            "phone": "\(phone)",
            "message": "\(msg)"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onMsgButtonTapped(_ sender: Any) {
        // if no text entered
              if nameTextField.text!.isEmpty || phoneTextField.text!.isEmpty  || msgTextField.text!.isEmpty {
                  
                  // red placeholders
                  nameTextField.attributedPlaceholder = NSAttributedString(string: "full_name".localized(), attributes: [NSAttributedString.Key.foregroundColor:UIColor.red])
                  phoneTextField.attributedPlaceholder = NSAttributedString(string: "phone_number".localized(), attributes: [NSAttributedString.Key.foregroundColor:UIColor.red])
                  msgTextField.attributedPlaceholder = NSAttributedString(string: "msg".localized(), attributes: [NSAttributedString.Key.foregroundColor:UIColor.red])
                  
              }else{
                setMessage()
                let alert = UIAlertController(title: "Send a message", message: "the message has been sent", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .cancel)
                alert.addAction(okAction)
                self.present(alert, animated: true)
        }
    }
    
    @IBAction func onLocationButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ContactUs", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "MapVC")
        navigationController?.pushViewController(scene, animated: true)
        
    }
    @IBAction func onTwitterButtonTapped(_ sender: Any) {
    }
    @IBAction func onSnapButtonTapped(_ sender: Any) {
    }
    @IBAction func onWhatsappButtonTapped(_ sender: Any) {
    }
    
    @IBAction func onCallButtonTapped(_ sender: Any) {
    }
    

}
