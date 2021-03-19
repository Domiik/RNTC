//
//  ProgrammingViewController.swift
//  Rntc
//
//  Created by Domiik on 24.02.2021.
//

import UIKit

class ProgrammingViewController: UIViewController {
    
    let apiClient = ApiClient()
    
    let item = [ItemScanning]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        apiClient.loginClient(completion: {
//            result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let value) :
//                    print(value)
//                    
//                    break
//                case .failure(let error) :
//                   
//                    break
//                }
//            }
//        })
        print(self.item.count)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "Menu")
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ContactPV" {
            guard let destination = segue.destination as? ContactViewController else { return }
            destination.nameContact = "PV"
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
