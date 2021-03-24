//
//  ContactViewController.swift
//  Rntc
//
//  Created by Domiik on 24.02.2021.
//

import UIKit
import Contacts
import AddressBook

class ContactViewController: UIViewController {
    
    @IBOutlet weak var contactImageView: UIImageView!
    var nameContact: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        contactImageView.addGestureRecognizer(tapGR)
        contactImageView.isUserInteractionEnabled = true
        if nameContact == "EV" {
            contactImageView.image = #imageLiteral(resourceName: "EP.png")
        }else if nameContact == "MP"{
            contactImageView.image = #imageLiteral(resourceName: "MP.png")
        } else if nameContact == "PV"{
            contactImageView.image = #imageLiteral(resourceName: "PV.png")
        }
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if nameContact == "EV" {
                
                let contact = CNMutableContact()
                
                contact.givenName = "Евгений"
                contact.familyName = "Проуторов"
                contact.middleName = "Витальевич"
                
                let homeEmail = CNLabeledValue(label: CNLabelHome, value: "evproutorov@chsu.ru" as NSString)
                contact.emailAddresses = [homeEmail]
                
                contact.phoneNumbers = [CNLabeledValue(
                                            label: CNLabelPhoneNumberiPhone,
                                            value: CNPhoneNumber(stringValue: "+79646627636"))]
                
                
                let store = CNContactStore()
                let saveRequest = CNSaveRequest()
                saveRequest.add(contact, toContainerWithIdentifier: nil)
                
                do {
                    try store.execute(saveRequest)
                    let alert = UIAlertController(title: "Контакт успешно добавлен!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Хорошо!", style: .default, handler: nil))
                    self.present(alert, animated: true)
                } catch {
                    let alert = UIAlertController(title: "Не получается сохранить контакт!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Хорошо!", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            } else if nameContact == "MP"{
                
                let contact = CNMutableContact()
                
                contact.givenName = "Михаил"
                contact.familyName = "Питерцев"
                contact.middleName = "Эдуардович"
                
                let homeEmail = CNLabeledValue(label: CNLabelHome, value: "mepitertcev1@chsu.ru" as NSString)
                contact.emailAddresses = [homeEmail]
                
                contact.phoneNumbers = [CNLabeledValue(
                                            label: CNLabelPhoneNumberiPhone,
                                            value: CNPhoneNumber(stringValue: "+79217231494"))]
                
                
                let store = CNContactStore()
                let saveRequest = CNSaveRequest()
                saveRequest.add(contact, toContainerWithIdentifier: nil)
                
                do {
                    try store.execute(saveRequest)
                    let alert = UIAlertController(title: "Контакт успешно добавлен!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Хорошо!", style: .default, handler: nil))
                    self.present(alert, animated: true)
                } catch {
                    let alert = UIAlertController(title: "Не получается сохранить контакт!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Хорошо!", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            } else if nameContact == "PV"{
                
                let contact = CNMutableContact()
                
                contact.givenName = "Павел"
                contact.familyName = "Вахрамеев"
                contact.middleName = "Сергеевич"
                
                let homeEmail = CNLabeledValue(label: CNLabelHome, value: "psvakhrameev@chsu.ru" as NSString)
                contact.emailAddresses = [homeEmail]
                
                contact.phoneNumbers = [CNLabeledValue(
                                            label: CNLabelPhoneNumberiPhone,
                                            value: CNPhoneNumber(stringValue: "+79110489000"))]
                
                
                let store = CNContactStore()
                let saveRequest = CNSaveRequest()
                saveRequest.add(contact, toContainerWithIdentifier: nil)
                
                do {
                    try store.execute(saveRequest)
                    let alert = UIAlertController(title: "Контакт успешно добавлен!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Хорошо!", style: .default, handler: nil))
                    self.present(alert, animated: true)
                } catch {
                    let alert = UIAlertController(title: "Не получается сохранить контакт!", message: nil, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Хорошо!", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
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
