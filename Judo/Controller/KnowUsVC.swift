//
//  KnowUsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class KnowUsVC: BaseController {
    @IBOutlet var titleLabel: UIBarButtonItem!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var achievementLabel: UILabel!
    @IBOutlet weak var specialLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
        setupLocalization()

    }
    func setupLocalization(){
        historyLabel.text = "fed_history".localized()
        achievementLabel.text = "fed_achevements".localized()
        specialLabel.text = "fed_special".localized()
        titleLabel.title = "know_us".localized()
        
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    


}
