//
//  FAPersistence.swift
//  FitnessAppFinalRestart
//
//  Created by Nicholas Jaeger on 12/7/17.
//  Copyright © 2017 Nicholas Jaeger. All rights reserved.
//

import UIKit
import Firebase

class FAPersistence: DatabaseReference {
    
    static var db: DatabaseReference = {
        let instance = Database.database().reference()
        return instance
    }()

    override private init() {
        super.init()
    }
}
