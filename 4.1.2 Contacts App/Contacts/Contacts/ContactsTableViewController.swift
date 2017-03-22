//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Ammi Tan on 2/13/17.
//  Copyright © 2017 Ammi Tan. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {

    var people = [contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         //Uncomment the following line to preserve selection between presentations
         //self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let people1 = contactsList.addPeople()
        people = people1.people
        
        let moveButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(ContactsTableViewController.toggleEdit))
        navigationItem.leftBarButtonItem = moveButton
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ContactsTableViewController.addContact))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func toggleEdit() {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...

        let contact = people[indexPath.row]
        cell.textLabel?.text = String("\(contact.firstName) \(contact.lastName)")
        
        if contact.phone != nil {
            cell.detailTextLabel?.text = contact.phone
        }
        else {
            cell.detailTextLabel?.text = nil
        }

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.people.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openDetail") {
            let destino = segue.destination as! ContactDetails
            if let indexpath = tableView.indexPath(for: sender as! UITableViewCell) {
            let contactPicked = people[indexpath.row]
            
            destino.theContact = contactPicked
            
            }
        }
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let contactMoving = people.remove(at: fromIndexPath.row)
        people.insert(contactMoving, at: to.row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // removes the delete button from the ordering method
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing {
            return .none
        } else {
            return .delete
        }
    }
 
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func addContact() {
        let newContact = contact(firstName: "New Contact", lastName: "")
        self.people += [newContact]
        let newIndexPath = IndexPath(row: self.people.count-1, section:0)
        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
 
}
