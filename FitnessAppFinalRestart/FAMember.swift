//
//  FAMember.swift
//  FitnessAppFinalRestart
//
//  Created by Nicholas Jaeger on 12/7/17.
//  Copyright © 2017 Nicholas Jaeger. All rights reserved.
//

import UIKit

class FAMember {
    var uid: String
    var name: String
    var email: String
    var profilePic: URL?
    
    
    init(uid: String, name: String, email: String) {
        self.uid = uid
        self.name = name
        self.email = email
    }

}
