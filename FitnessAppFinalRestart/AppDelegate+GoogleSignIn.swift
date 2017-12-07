//
//  AppDelegate+GoogleSignIn.swift
//  FitnessAppFinalRestart
//
//  Created by Nicholas Jaeger on 12/7/17.
//  Copyright © 2017 Nicholas Jaeger. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

extension AppDelegate: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print("[APPDELEGATE] ERROR: \(error)")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("[APPDELEGATE] ERROR: \(error)")
                return
            }
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here...
    }
    
}
