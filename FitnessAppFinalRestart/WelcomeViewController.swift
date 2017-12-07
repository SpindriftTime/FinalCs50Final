//
//  WelcomeViewController.swift
//  FitnessAppFinalRestart
//
//  Created by Nicholas Jaeger on 12/6/17.
//  Copyright © 2017 Nicholas Jaeger. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class WelcomeViewController: UIViewController, GIDSignInUIDelegate {

    var handler: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        handler = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = auth.currentUser {
                FAUser.shared.signIn(user)
                self.performSegue(withIdentifier: "userAuthenticated", sender: nil)
                return
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Segueing to the root VC")
    }

}
