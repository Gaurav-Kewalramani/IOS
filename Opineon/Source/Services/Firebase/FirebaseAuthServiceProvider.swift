//
//  FirebaseAuthServiceProvider.swift
//  Opineon
//
//  Created by Deepanshu Agarwal on 21/12/22.
//
import UIKit
import FirebaseAuth
import Firebase
import FirebaseCore

class FirebaseAuthServiceProvider: NSObject {
    
    // MARK: - Other Properties
        
    let phoneAuthProvider = PhoneAuthProvider.provider()
    
    // MARK: - verifying the user's phone number
        
    func verifyNumber(phone number: String, completion: @escaping (_ providerId: String?, _ error: Error?) -> Void) {
            phoneAuthProvider.verifyPhoneNumber(number, uiDelegate: nil) { (verificationID, error) in
                guard error == nil else {
                    completion(nil, error)
                    return
                }
                completion(verificationID, nil)
            }
        }
        
    // MARK: - verifying the one time code from user
        
    func signIn(withProviderId providerId: String, oneTimeCode: String, completion: @escaping(_ user: User?, _ error: Error?) -> Void) {
            let credential = phoneAuthProvider.credential(
                withVerificationID: providerId,
                verificationCode: oneTimeCode)
            Auth.auth().signIn(with: credential) { [weak self] (authResult, error) in
                guard error == nil, let user = authResult?.user else {
                    completion(nil, error)
                    return
                }
                completion(user, nil)
            }
        }
    }
