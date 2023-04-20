//
//  LoginView.swift
//  MemoryTide
//
//  Created by William Laverty on 16/3/2023.
//

import Firebase
import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isSigningIn = false
    
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            if authViewModel.showHomeScreen {
                HomeView()
            } else {
                existingUser()
                    .navigationBarTitle("", displayMode: .inline)
                    .environmentObject(authViewModel)
            }
        }
    }
}
