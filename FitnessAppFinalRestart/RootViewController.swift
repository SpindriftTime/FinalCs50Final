//
//  RootViewController.swift
//  FitnessAppFinalRestart
//
//  Created by Nicholas Jaeger on 12/6/17.
//  Copyright © 2017 Nicholas Jaeger. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class RootViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable ability to navigate backwards
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Connections: \(FAUser.shared.connections.map { return $0.name })")
        FAUser.shared.persist()
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let _ = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signOut() {
        do {
            try Auth.auth().signOut()
            FAUser.shared.signOut()
            GIDSignIn.sharedInstance().signOut()
            print("[ROOT] Signed out user")
            self.navigationController?.popViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError)")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FAUser.shared.connections.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "connectionCell", for: indexPath)
        
        let connection = FAUser.shared.connections[indexPath.item]
        cell.textLabel?.text = connection.name
        cell.detailTextLabel?.text = connection.uid
        
        return cell
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Ensure we're handling the correct segue
        if segue.identifier == "connectionDetails" {
            // Ensure destination view controller is what is expected
            if let vc = segue.destination as? ConnectionDetailViewController {
                // Get the index path of the selected row
                if let index = tableView.indexPathForSelectedRow {
                    // Set the destination view controller connection property to the desired connection
                    vc.connection = FAUser.shared.connections[index.item]
                }
            }
        }
    }

}
