//
//  MoreVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/14/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class MoreVC: BaseController {
    @IBOutlet weak var aboutAppLabel: UILabel!
    @IBOutlet weak var aboutAppLabel2: UILabel!
    @IBOutlet weak var mottoLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var path2ImageView: UIImageView!
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
        setupLocalization()
        rotateImage()

    }
    func rotateImage(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            path2ImageView.transform = path2ImageView.transform.rotated(by: CGFloat(Double.pi))
        }else{
        }
        
    }
    
    func setupLocalization(){
        aboutAppLabel.text = "about_app".localized()
        mottoLabel.text = "our_motto".localized()
        shareLabel.text = "share_app".localized()
        
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
    
}
