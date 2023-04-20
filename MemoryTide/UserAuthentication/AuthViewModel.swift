//
//  UserData.swift
//  MemoryTide
//
//  Created by William Laverty on 18/3/2023.
//

import Foundation
import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    
    @Published var userAuth: UserAuth?
    @Published var isLoading = false
    @Published var showHomeScreen = false
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        handle = Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            guard let strongSelf = self else {
                return
            }
            if let user = user {
                strongSelf.userAuth = UserAuth(uid: user.uid, email: user.email, name: user.displayName)
            } else {
                strongSelf.userAuth = nil
            }
        }
    }
    
    func signUp() {
            isLoading = true
            Auth.auth().createUser(withEmail: sanitizeString(email), password: sanitizeString(password)) { [weak self] authResult, error in
                guard let strongSelf = self else {
                    return
                }
                if let error = error {
                    print("Error signing up: \(error.localizedDescription)")
                    strongSelf.isLoading = false
                } else {
                    print("User signed up")
                    strongSelf.setLocalUser(authResult: authResult) // Call setLocalUser with authResult parameter
                }
                strongSelf.isLoading = false
            }
        }
        
        func signIn() {
            isLoading = true
            Auth.auth().signIn(withEmail: sanitizeString(email), password: sanitizeString(password)) { [weak self] authResult, error in
                guard let strongSelf = self else {
                    return
                }
                if let error = error {
                    print("Error signing in: \(error.localizedDescription)")
                    strongSelf.isLoading = false
                } else {
                    print("User signed in")
                    strongSelf.setLocalUser(authResult: authResult) // Call setLocalUser with authResult parameter
                }
                strongSelf.isLoading = false
            }
        }
    
    func setLocalUser(authResult: AuthDataResult?) {
        if let authResult = authResult {
            let changeRequest = authResult.user.createProfileChangeRequest()
            changeRequest.displayName = sanitizeString(self.name)
            changeRequest.commitChanges(completion: { error in
                if let error = error {
                    print("Error setting display name: \(error.localizedDescription)")
                } else {
                    // Fetch the user's display name from Firebase
                    authResult.user.reload(completion: { [weak self] error in
                        guard let strongSelf = self else {
                            return
                        }
                        if let error = error {
                            print("Error reloading user: \(error.localizedDescription)")
                        } else {
                            strongSelf.userAuth?.name = authResult.user.displayName ?? ""
                            print("Logged in as: \(strongSelf.userAuth?.name ?? "N/A")")
                            strongSelf.showHomeScreen = true
                            UserDefaults.standard.set(true, forKey: "isSignedIn")
                        }
                    })
                }
            })
        }
    }

    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    private func sanitizeString(_ string: String) -> String {
        // Replace any characters that could be used for SQL injection or XSS attacks
        let sanitizedString = string.replacingOccurrences(of: "'", with: "")
        return sanitizedString
    }
}

struct UserAuth {
    var uid: String
    var email: String?
    var name: String?
}
