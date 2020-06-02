//
//  FullPictureVC.swift
//  Judo
//
//  Created by MacBook Pro on 4/13/20.
//  Copyright © 2020 rahma. All rights reserved.
//

import UIKit

class FullPictureVC: UIViewController {
    @IBOutlet weak var fullImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullImage.layer.cornerRadius = 10

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
