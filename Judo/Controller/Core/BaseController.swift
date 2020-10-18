//
//  BaseController.swift
//  Judo
//
//  Created by MacBook Pro on 4/17/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit
import SafariServices

class BaseController: UIViewController {
    var hiddenNav: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           if self.hiddenNav {
               // Show the Navigation Bar
               self.navigationController?.setNavigationBarHidden(true, animated: false )
               self.navigationController?.navigationBar.shadowImage = UIImage()

           } else {
               self.navigationController?.setNavigationBarHidden(false, animated: false)
           }
       }

       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           //baseViewModel = nil
           if self.hiddenNav {
               // Show the Navigation Bar
               self.navigationController?.setNavigationBarHidden(true, animated: false)
               self.navigationController?.navigationBar.shadowImage = UIImage()

           } else {
               self.navigationController?.setNavigationBarHidden(false, animated: false)
           }
       }
    func didTapWatch(url: String){
        guard let url = URL(string: url) else {
            print("url")
            return //be safe
          }

          if #available(iOS 10.0, *) {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
          } else {
              UIApplication.shared.openURL(url)
          }
//        let appURL = URL(string: url)!
//        if UIApplication.shared.canOpenURL(appURL) {
//            if #available(iOS 10.0, *) {
//                UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
//            } else {
//                UIApplication.shared.openURL(appURL)
//            }
//        }
     
     }
    func openWebsite(website: String){
             let url = URL(string: website)!

             UIApplication.shared.open(url)
         }
  
}
