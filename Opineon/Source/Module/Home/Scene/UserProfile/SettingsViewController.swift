//
//  SettingsViewController.swift
//  Opineon
//
//  Created by Gaurav Kewalramani on 30/12/22.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    // MARK: - Other Properties
    
    lazy var currentUser: User? = {
        return Auth.auth().currentUser
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier != "Auth" else {
            return false
        }
        return true
    }
    
    //MARK: - IB Action
    
    @IBAction func logOutButton(_ sender: Any) {
        signOutUser()
    }
}

extension SettingsViewController {
    
    // MARK: - SignOut User from screen
    
    func signOutUser() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            self.performSegue(withIdentifier: "Auth" , sender: self)
        }
        catch {}
    }
}
