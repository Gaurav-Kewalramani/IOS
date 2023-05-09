//
//  FredyAiViewController.swift
//  Opineon
//
//  Created by Aniket Kumar on 27/12/22.
//

import UIKit

class FredyAiViewController: UIViewController {
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier != "Home" else {
            return false
        }
        return true
    }

    // MARK: - IB Actions
    
    @IBAction func backToHomeScreen(_ sender: Any) {
        self.performSegue(withIdentifier: "Home", sender: self)
    }
}
