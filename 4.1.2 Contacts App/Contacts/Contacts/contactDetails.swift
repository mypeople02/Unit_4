//
//  ViewController.swift
//  Contacts
//
//  Created by Ammi Tan on 2/13/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import UIKit

class contactDetails: UIViewController {
    
    var people: contact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let people1 = contactsList.addPeople()
//        people = people1.people
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
    
    
}

