//
//  ContentViewController.swift
//  Rntc
//
//  Created by Domiik on 23.03.2021.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var contectImageView: UIImageView!
    
    var passedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard passedImage != nil else {
            passedImage = UIImage(named: "РНТЦ _лого")
            return
        }
        contectImageView.image = passedImage
        // Do any additional setup after loading the view.
    }
}
