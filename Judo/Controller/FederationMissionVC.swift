//
//  FederationMissionVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class FederationMissionVC: UIViewController {
    @IBOutlet weak var mission: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mission.text = "fed_mission".localized()

    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    

    
}
