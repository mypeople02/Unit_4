//
//  DetailViewController.swift
//  Contacts_v2
//
//  Created by Ammi Tan on 3/15/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!

    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contact = self.contact {
            if let name = contact.name {
                self.nameLabel.text = name
            }
            if let phoneNumber = contact.phoneNumber {
                self.phoneLabel.text = phoneNumber
            }
        }
    }
    
}
