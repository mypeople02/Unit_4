//
//  class_contacts.swift
//  Contacts
//
//  Created by Ammi Tan on 2/18/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import Foundation
import UIKit

class contact: NSObject {
    var firstName: String
    var lastName: String
    var phone: String?
    
    init(firstName:String,lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func createphone(phone: String) {
        self.phone = phone
    }
    
    func fullName(firstName: String, lastName:String)->String {
        let firstLastName = "\(firstName) \(lastName)"
        return firstLastName
    }
}
