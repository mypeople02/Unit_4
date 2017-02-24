//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var personZ:String = "1"
var peopleZ = "amy"
print("\(personZ)\(peopleZ)")

class contact {
    var firstName: String
    var lastName: String
    var phone: contact?
    
    init(firstName:String,lastName:String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func createphone(phone: contact) {
        self.phone = phone
    }
}

class contactsList {
    var people = [contact]()
    
    init(people: [contact]) {
        self.people = people
    }
    
    func addPeople() -> contactsList {
        
        let person1 = contact(firstName: "Amy", lastName: "Bench")
        let person2 = contact(firstName: "Chris", lastName: "Dewey")
        let person3 = contact(firstName: "Eric", lastName: "Folsom")
        
        people += [person1]
        people += [person2]
        people += [person3]
        
        return contactsList(people: people)
    }
}


contactsList.addPeople(peopleZ)





var people = [String]()
//    people += [String(describing: contact(firstName: "Amy", lastName: "Bench"))]
//    print(people[0])

//people += ["\(person1.firstName) \(person1.lastName)"]



