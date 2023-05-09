//
//  UserProfileViewController.swift
//  Opineon
//
//  Created by Aniket Kumar on 27/12/22.
//

import UIKit
import Firebase
import FirebaseAuth

class UserProfileViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IB Actions
    
    @IBAction func settingsButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "UserSettings", sender: self)
    }
}
