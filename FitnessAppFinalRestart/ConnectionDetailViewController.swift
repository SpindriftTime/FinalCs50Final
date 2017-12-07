//
//  ConnectionDetailViewController.swift
//  FitnessAppFinalRestart
//
//  Created by Nicholas Jaeger on 12/7/17.
//  Copyright © 2017 Nicholas Jaeger. All rights reserved.
//

import UIKit

class ConnectionDetailViewController: UIViewController {

    // MARK: - Properties
    var connection: FAMember?
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let connection = connection {
            nameLabel.text = connection.name
            emailLabel.text = connection.email
            
            if let url = connection.profilePic {
                if let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    imageView.image = image
                }
            }
            
            if imageView.image == nil {
                imageView.backgroundColor = UIColor.gray
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
