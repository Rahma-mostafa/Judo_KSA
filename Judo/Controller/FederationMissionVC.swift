//
//  FederationMissionVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class FederationMissionVC: BaseController {
    @IBOutlet weak var mission: UILabel!
    @IBOutlet var titleLabel: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
      
    }
    func setLocalize(){
        mission.text = "fed_mission".localized()
        titleLabel.title = "federation_mission".localized()

    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    

    
}
