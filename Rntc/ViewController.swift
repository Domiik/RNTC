//
//  ViewController.swift
//  Rntc
//
//  Created by Domiik on 18.02.2021.
//

import UIKit
import CircleMenu

class ViewController: UIViewController, CircleMenuDelegate {
    
    @IBOutlet weak var buttonCircle: CircleMenu!
    
    let items: [(icon: String, color: UIColor)] = [
        ("2", #colorLiteral(red: 0.2004534304, green: 0, blue: 0.7987619042, alpha: 1)),
        ("1", #colorLiteral(red: 0.9492707849, green: 0.3993931413, blue: 0.01535793301, alpha: 1)),
        ("3", #colorLiteral(red: 0.6015360355, green: 0, blue: 0.800627172, alpha: 1)),
        ("4", #colorLiteral(red: 0.9471542239, green: 0.03365005925, blue: 0.400051415, alpha: 1)),
        ("5", #colorLiteral(red: 0.2841081917, green: 0.5705626607, blue: 0.9992030263, alpha: 1))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func circleMenu(_: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_: CircleMenu, buttonWillSelected _: UIButton, atIndex: Int) {
        //print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_: CircleMenu, buttonDidSelected _: UIButton, atIndex: Int) {
        if atIndex == 0 {
            performSegue(withIdentifier: "ContentModeling", sender: nil)
        } else if atIndex == 1 {
            performSegue(withIdentifier: "ContentProgrammig", sender: nil)
        } else if atIndex == 2 {
            performSegue(withIdentifier: "ContentProduction", sender: nil)
        } else if  atIndex == 3 {
            performSegue(withIdentifier: "ContentScanning", sender: nil)
        } else  if atIndex == 4 {
            performSegue(withIdentifier: "ContentRobots", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ContentModeling" {
            guard let destination = segue.destination as? MenuTableViewController else { return }
            destination.modalPresentationStyle = .fullScreen
            destination.urlTransition = MODELING_URL
            destination.nameNavigationBar = "Моделирование"
        } else if segue.identifier == "ContentProgrammig" {
            guard let destination = segue.destination as? MenuTableViewController else { return }
            destination.modalPresentationStyle = .fullScreen
            destination.urlTransition = PROGRAMMING_URL
            destination.nameNavigationBar = "Программирование"
        } else if segue.identifier == "ContentProduction" {
            guard let destination = segue.destination as? MenuTableViewController else { return }
            destination.modalPresentationStyle = .fullScreen
            destination.urlTransition = PRODUCTION_URL
            destination.nameNavigationBar = "Производство"
        } else if segue.identifier == "ContentScanning" {
            guard let destination = segue.destination as? MenuTableViewController else { return }
            destination.modalPresentationStyle = .fullScreen
            destination.urlTransition = SCANING_URL
            destination.nameNavigationBar = "Дизайн"
        } else if segue.identifier == "ContentRobots" {
            guard let destination = segue.destination as? MenuTableViewController else { return }
            destination.modalPresentationStyle = .fullScreen
            destination.urlTransition = ROBOTS_URL
            destination.nameNavigationBar = "Робототехника"
        }
    }
}





