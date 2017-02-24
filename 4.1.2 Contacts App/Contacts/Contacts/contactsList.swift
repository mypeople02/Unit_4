//
//  list_contacts.swift
//  Contacts
//
//  Created by Ammi Tan on 2/19/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import Foundation
import UIKit

class contactsList {

    var people: [contact]
    
    init(people: [contact]) {
        self.people = people
    }
    
    static func addPeople() -> contactsList {
        var people = [contact] ()
        
        let person1 = contact(firstName: "Amy", lastName: "Bench")
        let person2 = contact(firstName: "Chris", lastName: "Dewey")
        let person3 = contact(firstName: "Eric", lastName: "Folsom")
        
        person1.createphone(phone: "+1 111-111-1111")
        person3.createphone(phone: "+3 333-333-3333")
        
        people += [person1]
        people += [person2]
        people += [person3]
        
        return contactsList(people:people)
    }
}
