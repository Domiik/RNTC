//
//  ModelingViewController.swift
//  Rntc
//
//  Created by Domiik on 23.02.2021.
//

import UIKit
import SwiftyGif

class ModelingViewController: UIViewController {

    @IBOutlet weak var gifimageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gif = try! UIImage(gifName: "11.gif")
        gifimageView.setGifImage(gif, loopCount: -1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "Menu")
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContactEV" {
            guard let destination = segue.destination as? ContactViewController else { return }
            destination.nameContact = "EV"
        }
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
