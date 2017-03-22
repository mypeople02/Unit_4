//
//  ViewController.swift
//  Contacts
//
//  Created by Ammi Tan on 2/13/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import UIKit

class ContactDetails: UIViewController, UITextFieldDelegate {

    @IBOutlet var firstNameOutlet: UITextField!
    @IBOutlet var lastNameOutlet: UITextField!
    @IBOutlet var phoneOutlet: UITextField!
    
    var theContact: contact? = nil
//    var theContact: contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.firstNameOutlet.delegate = self
        self.lastNameOutlet.delegate = self
        self.phoneOutlet.delegate = self
        
        displayDetails()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func displayDetails() {
        firstNameOutlet.text = theContact?.firstName
        lastNameOutlet.text = theContact?.lastName
        phoneOutlet.text = theContact?.phone
        
            }
 
    @IBAction func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstNameOutlet {
            theContact?.firstName = textField.text!
            firstNameOutlet.text = textField.text!
        }
        else if textField == self.lastNameOutlet {
            self.theContact?.lastName = textField.text!
        }
        else if textField == self.phoneOutlet {
            self.theContact?.phone = textField.text
        }
    }

    
 }



