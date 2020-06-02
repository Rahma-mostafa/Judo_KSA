//
//  FederationTargetsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class FederationTargetsVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "what_target".localized()

    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
   

}
