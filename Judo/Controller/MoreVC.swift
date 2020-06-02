//
//  MoreVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/14/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {
    @IBOutlet weak var aboutAppLabel: UILabel!
    @IBOutlet weak var aboutAppLabel2: UILabel!
    @IBOutlet weak var mottoLabel: UILabel!
    @IBOutlet weak var motto2Label: UILabel!
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var pathImageView: UIImageView!
    @IBOutlet weak var path2ImageView: UIImageView!
    @IBOutlet weak var path3ImageView: UIImageView!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.hiddenNav = true
        setupLocalization()
        rotateImage()

    }
    func rotateImage(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            pathImageView.transform = pathImageView.transform.rotated(by: CGFloat(Double.pi)) //180 degree
            path2ImageView.transform = path2ImageView.transform.rotated(by: CGFloat(Double.pi))
            path3ImageView.transform = path3ImageView.transform.rotated(by: CGFloat(Double.pi))
        }else{
        }
        
    }
    
    func setupLocalization(){
        aboutAppLabel.text = "about_app".localized()
        mottoLabel.text = "our_motto".localized()
        langLabel.text = "lang_ar".localized()
        shareLabel.text = "share_app".localized()
        rateLabel.text = "rating_app".localized()
        
    }
    

    @IBAction func onLanguageButtonTapped(_ sender: Any) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let scene = storyboard.instantiateViewController(identifier: "LanguageVC")
        navigationController?.pushViewController(scene, animated: true)
    }
    
    @IBAction func onShareButtonTapped(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems:["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func onRateButtonTapped(_ sender: Any) {
    }
    
}
