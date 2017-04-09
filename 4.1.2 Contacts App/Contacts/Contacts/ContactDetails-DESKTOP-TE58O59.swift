//
//  ViewController.swift
//  Contacts
//
//  Created by Ammi Tan on 2/13/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import UIKit

class contactDetails: UIViewController, UITextFieldDelegate {
    
    var people: contact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstNameOutlet.delegate = self
        self.lastNameOutlet.delegate = self
        self.phoneOutlet.delegate = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
        if let people = self.people {
            if let firstName = contact?.firstName {
                self.firstNameOutlet.text = firstName
            }
            if let lastName = contact?.lastName {
                self.lastNameOutlet.text = lastName
            }
        }
        
        
        
        displayDetails()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var firstNameOutlet: UITextField!
    @IBOutlet var lastNameOutlet: UITextField!
    @IBOutlet var phoneOutlet: UITextField!
    
    @IBAction func displayDetails() {
        firstNameOutlet.text = people?.firstName
        lastNameOutlet.text = people?.lastName
        phoneOutlet.text = people?.phone
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.firstNameOutlet {
            self.contact?.firstName = textField.text
        } else if textField == self.lastNameOutlet {
            self.contact?.lastName = textField.text
        }
        else if textField == self.phoneOutlet {
            self.contact?.phone = textField.text
        }
    }
    
    
}

