//
//  SignupView.swift
//  MemoryTide
//
//  Created by William Laverty on 16/3/2023.
//

import SwiftUI
import Firebase

struct SignupView: View {
    
    @State private var name: String = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State var isSigningUp = false
    
    @ObservedObject var authViewModel = AuthViewModel()
    
    
    var body: some View {
        NavigationView {
            if authViewModel.showHomeScreen {
                HomeView()
            } else {
                newUser()
                    .navigationBarTitle("", displayMode: .inline)
                    .environmentObject(authViewModel)
            }
        }
    }
}
