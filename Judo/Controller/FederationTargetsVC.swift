//
//  FederationTargetsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class FederationTargetsVC: BaseController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet var titleLabel: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
        setLocalize()
       

    }
    func setLocalize(){
        label.text = "what_target".localized()
        titleLabel.title = "federation_targets".localized()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
   

}
