//
//  Contact.swift
//  Contacts_v2
//
//  Created by Ammi Tan on 3/1/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import UIKit

class Contact: NSObject {
    var name: String?
    var phoneNumber: String?
    
    init(name: String? = nil, phoneNumber: String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        super.init()    
    }
}
