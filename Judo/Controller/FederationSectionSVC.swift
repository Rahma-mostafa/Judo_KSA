//
//  FederationSectionSVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/5/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class FederationSectionSVC: BaseController {


    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var gradientView2: GradientView!
    @IBOutlet weak var gradientView3: GradientView!
    @IBOutlet weak var gradientView4: GradientView!
    @IBOutlet weak var managerLabel: UILabel!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var trainerLabel: UILabel!
    @IBOutlet weak var judgeLabel: UILabel!
    @IBOutlet weak var pathImageView: UIImageView!
    @IBOutlet weak var path2ImageView: UIImageView!
    @IBOutlet weak var path3ImageView: UIImageView!
    @IBOutlet weak var path4ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hiddenNav = false
        setCornerRadius()
//        setupLocalization()
        rotateImage()
    }
    func rotateImage(){
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            pathImageView.transform = pathImageView.transform.rotated(by: CGFloat(Double.pi)) //180 degree
            path2ImageView.transform = path2ImageView.transform.rotated(by: CGFloat(Double.pi))
            path3ImageView.transform = path3ImageView.transform.rotated(by: CGFloat(Double.pi))
            path4ImageView.transform = path4ImageView.transform.rotated(by: CGFloat(Double.pi))
        }else{
        }
    }
    func setCornerRadius(){
     gradientView.layer.cornerRadius = 45
     gradientView2.layer.cornerRadius = 45
     gradientView3.layer.cornerRadius = 45
     gradientView4.layer.cornerRadius = 45
    }
    func setupLocalization(){
        managerLabel.text = "manager".localized()
        playerLabel.text = "player".localized()
        trainerLabel.text = "trainer".localized()
        judgeLabel.text = "judge".localized()
        
    }
    @IBAction func onManageButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Sections", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "ManagersVC")
        navigationController?.pushViewController(scene, animated: true)
    }
    @IBAction func onPlayerButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Sections", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "PlayersVC")
        navigationController?.pushViewController(scene, animated: true)
        
        
    }
    @IBAction func onTrainersButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Sections", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "TrainerVC")
        navigationController?.pushViewController(scene, animated: true)
    }
    
    @IBAction func onjudgeButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Sections", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "JudgeVC")
        navigationController?.pushViewController(scene, animated: true)
        
    }
    
    @IBAction func BackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
}
