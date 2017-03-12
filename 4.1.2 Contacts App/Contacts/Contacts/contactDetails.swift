//
//  ViewController.swift
//  Contacts
//
//  Created by Ammi Tan on 2/13/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import UIKit

class ContactDetails: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameOutlet: UITextField!
    @IBOutlet weak var lastNameOutlet: UITextField!
    @IBOutlet weak var phoneOutlet: UITextField!

    //    var people: contact? = nil
    var people: contact
    

    init(_: ContactDetails, people: contact) {
        self.people = people
        super.init(nibName: nil, bundle: nil)
//        super.init(firstName: firstNameOutlet.text, lastName: lastNameOutlet.text)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        firstNameOutlet.text = people.firstName
        lastNameOutlet.text = people.lastName
        phoneOutlet.text = people.phone
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == firstNameOutlet {
            people.firstName = textField.text!
        } else if textField == self.lastNameOutlet {
            self.people.lastName = textField.text!
        }
        else if textField == self.phoneOutlet {
            self.people.phone = textField.text
        }
    }
}



