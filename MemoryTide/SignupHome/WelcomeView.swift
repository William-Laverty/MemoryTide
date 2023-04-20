//
//  WelcomeView.swift
//  MemoryTide
//
//  Created by William Laverty on 16/3/2023.
//

import SwiftUI
import Firebase
import GoogleSignIn
import GoogleSignInSwift

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HomeViewHeader()
                SignupOptions()
                NavigationLink(destination: LoginView()) {
                    Text("Existing User")
                        .padding(.top)
                        .foregroundColor(Color(.tertiaryLabel))
                        .font(.subheadline)
                }
                .padding(.horizontal)
                Spacer()
                
                Text("Version 1.0")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
            }
        }
    }
}

