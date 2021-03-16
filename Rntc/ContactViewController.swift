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
            contactImageView.image = #imageLiteral(resourceName: "QR-code_vcard_EV")
        }else if nameContact == "MP"{
            contactImageView.image = #imageLiteral(resourceName: "QR-code_vcard_MP")
        } else if nameContact == "PV"{
            contactImageView.image = #imageLiteral(resourceName: "QR-code_vcard_PV")
        } else if nameContact == "IE" {
            contactImageView.image = #imageLiteral(resourceName: "QR-code_vcard_IE")
        }
        
        print(nameContact)
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
                } catch {
                    print("Saving contact failed, error: \(error)")
                    // Handle the error
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
                } catch {
                    print("Saving contact failed, error: \(error)")
                    // Handle the error
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
                } catch {
                    print("Saving contact failed, error: \(error)")
                    // Handle the error
                }
            } else if nameContact == "IE"{
                
                let contact = CNMutableContact()
                
                contact.givenName = "Иван"
                contact.familyName = "Захаров"
                contact.middleName = "Евгеньевич"
                
                let homeEmail = CNLabeledValue(label: CNLabelHome, value: "iezakharov@chsu.ru" as NSString)
                contact.emailAddresses = [homeEmail]
                
                contact.phoneNumbers = [CNLabeledValue(
                                            label: CNLabelPhoneNumberiPhone,
                                            value: CNPhoneNumber(stringValue: "+79217320884"))]
                
                
                let store = CNContactStore()
                let saveRequest = CNSaveRequest()
                saveRequest.add(contact, toContainerWithIdentifier: nil)
                
                do {
                    try store.execute(saveRequest)
                } catch {
                    print("Saving contact failed, error: \(error)")
                    // Handle the error
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
