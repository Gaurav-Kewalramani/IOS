//
//  LaunchViewController.swift
//  Opineon
//
//  Created by Rohit Kumar on 15/11/22.
//

import UIKit

class LaunchViewController: UIViewController {
    
    // MARK: - PROPERTY
    
    let viewModel = LaunchScreenViewModel()

    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    // MARK: - Setup
    
    func setup() {
        if (viewModel.isLoggedIn()) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2)  { [weak self] in
                self?.gotoHomeScreen()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2)  { [weak self] in
                self?.gotoLoginScreen()
            }
            
        }
    }
}

// MARK: - NAVIGATION

extension LaunchViewController {
    
    func gotoHomeScreen() {
        let homeController = UIStoryboard.viewController(in: .home, withIdentifier: .homeViewController)
        navigationController?.pushViewController(homeController, animated: true)

    }
    
    func gotoLoginScreen() {
        let phoneAuthController = UIStoryboard.viewController(in: .auth, withIdentifier: .authViewContoller)
        navigationController?.pushViewController(phoneAuthController, animated: true)
    }
}
