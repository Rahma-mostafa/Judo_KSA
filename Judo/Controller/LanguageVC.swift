//
//  LanguageVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/15/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class LanguageVC: BaseController {

    @IBOutlet weak var langaugeLabel: UILabel!
    @IBOutlet weak var arabicButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    //variabls
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setNormalArabicButton()
        setNormalEnglishButton()
        setLocalization()

    }
    func setup(){
        self.hiddenNav = true
        applyButton.layer.cornerRadius = 12
        
    }

    func setNormalArabicButton(){
        arabicButton.layer.cornerRadius = 10
        arabicButton.layer.borderWidth = 2
        arabicButton.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        arabicButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) , for: .normal)
        arabicButton.backgroundColor = .white
        
    }
    func setNormalEnglishButton(){
        englishButton.layer.cornerRadius = 10
        englishButton.layer.borderWidth = 2
        englishButton.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        englishButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) , for: .normal)
        englishButton.backgroundColor = .white
    }
    func setLocalization(){
        langaugeLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "select_lang", comment: "")

//        langaugeLabel.text = "select_lang".localized()
        arabicButton.setTitle("arabic".localized(), for:.normal)
        englishButton.setTitle("english".localized(), for: .normal)
        applyButton.setTitle("apply".localized(), for:.normal)
        
        
    }
    @IBAction func onCancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onArabicButtonTapped(_ sender: Any) {
         arabicButton.layer.borderWidth = 0
         arabicButton.backgroundColor = #colorLiteral(red: 0.2023060024, green: 0.6569669247, blue: 0.2744971812, alpha: 1)
         arabicButton.setTitleColor(.white , for: .normal)
         setNormalEnglishButton()
         index = 1
        
    }
    @IBAction func onEnglishButtonTapped(_ sender: Any) {
        englishButton.layer.borderWidth = 0
        englishButton.backgroundColor = #colorLiteral(red: 0.2023060024, green: 0.6569669247, blue: 0.2744971812, alpha: 1)
        englishButton.setTitleColor(.white , for: .normal)
        setNormalArabicButton()
        index = 2
    }
    @IBAction func onApplyButtonTapped(_ sender: Any) {
        if index == 1{
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
            UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft


        }else if index == 2{
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
            UINavigationBar.appearance().semanticContentAttribute = .forceLeftToRight

        }else{
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LanguageVC") as! LanguageVC
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = vc
        viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
