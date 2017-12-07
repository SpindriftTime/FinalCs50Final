//
//  User.swift
//  FitnessAppFinalRestart
//
//  Created by Nicholas Jaeger on 12/7/17.
//  Copyright © 2017 Nicholas Jaeger. All rights reserved.
//

import UIKit
import Firebase

class FAUser {
    
    var userID: String?
    var name: String?
    var email: String?
    var profilePic: URL?
    var isAuthenticated: Bool = false
    var connections = [FAMember]()
    
    static var shared: FAUser = {
        let instance = FAUser()
        // Setup FAUser as desired
        return instance
    }()
    
    private init() {}
    
    // MARK: - Authentication
    func signIn(_ user: User?) {
        guard let uid = user?.uid else { return }
        
        self.isAuthenticated = true
        self.userID = uid
        self.name = user?.displayName
        self.email = user?.email
        self.profilePic = user?.photoURL
        
        // Repopulate connections
        // self.connections = [FAMember]()
        FAPersistence.db.child("users").child(uid).observeSingleEvent(of: .value) { (snapshot) in
            if let response = snapshot.value as? [String: AnyObject] {
                if let reconnections = response["connections"] as? [String] {
                    for connection in reconnections {
                        print(connection)
                    }
                }
            }
        }
    }
    
    func signOut() {
        self.isAuthenticated = false
        self.userID = nil
        self.name = nil
        self.email = nil
        //self.connections = [FAMember]()
    }
    
    
    // MARK: - Modifications
    func addConnection(member: FAMember) {
        self.connections.append(member)
    }
    
    func removeConnection(member: FAMember) {
        // Check if member exists in connections, if so, remove connection
        if let index = self.connections.index(where: { return $0.uid == member.uid }) {
            self.connections.remove(at: index)
        }
    }
    
    // MARK: - Persistence
    func persist() {
        // If we don't have a UID, we can't update the database, abort.
        guard let uid = self.userID else {
            return
        }
        
        let dict: [String: Any] = [
            "uid" : uid,
            "name" : self.name ?? "",
            "email" : self.email ?? "",
            "profilePic" : self.profilePic?.absoluteString ?? "",
            "connections" : self.connections.map { return $0.uid }
        ]
        
        FAPersistence.db.child("users").child(uid).setValue(dict)
    }
}

