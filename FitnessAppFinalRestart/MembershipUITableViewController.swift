//
//  MembershipUITableViewController.swift
//  FitnessAppFinalRestart
//
//  Created by Nicholas Jaeger on 12/7/17.
//  Copyright © 2017 Nicholas Jaeger. All rights reserved.
//

import UIKit
import Firebase

class MembershipUITableViewController: UITableViewController {

    // selected members
    var members = [FAMember]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        queryDatabase()
    }
    
    // search database
    func queryDatabase() {
        FAPersistence.db.child("users").observe(.value) { (snapshot) in
            if let update = snapshot.value as? [String: AnyObject] {
                self.members.removeAll()
                
                for (_, value) in update {
                    guard let uid = value["uid"] as? String else { continue }
                    guard let name = value["name"] as? String else { continue }
                    guard let email = value["email"] as? String else { continue }
                    
                    // Don't allow connection to self
                    if uid == FAUser.shared.userID { continue }
                    
                    let member = FAMember(uid: uid, name: name, email: email)
                    
                    if let picURL = value["profilePic"] as? String {
                        member.profilePic = URL(string: picURL)
                    }
                    
                    self.members.append(member)
                }
                
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
        let member = members[indexPath.item]
        
        // Determine if connection already established
        if let _ = FAUser.shared.connections.index(where: { $0.uid == member.uid }) {
            cell.isSelected = true
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        
        cell.textLabel?.text = member.name
        return cell
    }
    
    
    // MARK: - Actions
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let member = members[indexPath.item]
            
            // Determine if connection already established
            // If connection established, remove connection
            if let _ = FAUser.shared.connections.index(where: { $0.uid == member.uid }) {
                cell.accessoryType = UITableViewCellAccessoryType.none
                FAUser.shared.removeConnection(member: member)
            }
            // Else, establish new connection
            else {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                FAUser.shared.addConnection(member: member)
            }
        
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    

    // MARK: - Navigation
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
