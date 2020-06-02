//
//  AboutSectionsVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/4/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class



AboutFederationVC: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var fedDeclaraionLabel: UILabel!
    
    @IBOutlet weak var contentView2: UIView!
    @IBOutlet weak var gradientView2: GradientView!
    @IBOutlet weak var msgLabel: UILabel!
    
    @IBOutlet weak var contentView3: UIView!
    @IBOutlet weak var gradientView3: GradientView!
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var contentView4: UIView!
    @IBOutlet weak var gradientView4: GradientView!
    @IBOutlet weak var groupLabel: UILabel!
    
    @IBOutlet weak var pathImageView: UIImageView!
    
    @IBOutlet weak var path2ImageView: UIImageView!
    
    @IBOutlet weak var path3ImageView: UIImageView!
    
    @IBOutlet weak var path4ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setCornerRadius()
        setupLocalization()
        rotateImage()
        
    }
    func rotateImage(){
        pathImageView.transform = pathImageView.transform.rotated(by: CGFloat(Double.pi)) //180 degree
        path2ImageView.transform = path2ImageView.transform.rotated(by: CGFloat(Double.pi))
         path3ImageView.transform = path3ImageView.transform.rotated(by: CGFloat(Double.pi))
        path4ImageView.transform = path4ImageView.transform.rotated(by: CGFloat(Double.pi))
        
    }
    func setCornerRadius(){
        contentView.layer.cornerRadius = 16
        contentView2.layer.cornerRadius = 16
        contentView3.layer.cornerRadius = 16
        contentView4.layer.cornerRadius = 16
        gradientView.layer.cornerRadius = 45
        gradientView2.layer.cornerRadius = 45
        gradientView3.layer.cornerRadius = 45
        gradientView4.layer.cornerRadius = 45
    }
    func setupLocalization(){
        fedDeclaraionLabel.text = "fed_decleration".localized()
        msgLabel.text = "fed_msg".localized()
        targetLabel.text = "fed_target".localized()
        groupLabel.text = "Fed_group".localized()
    }
    
    @IBAction func onDeclerationButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AboutUs", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "KnowUsVC")
        navigationController?.pushViewController(scene, animated: true)
    }
    
    @IBAction func onMSGButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AboutUs", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "FederationMissionVC")
        navigationController?.pushViewController(scene, animated: true)
        
    }
    
    @IBAction func onTargetButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AboutUs", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "FederationTargetsVC")
        navigationController?.pushViewController(scene, animated: true)
        
    }
    @IBAction func onGroupButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AboutUs", bundle: nil)
        let scene = storyboard.instantiateViewController(identifier: "FederationEstablishersVC")
        navigationController?.pushViewController(scene, animated: true)
        
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
}
