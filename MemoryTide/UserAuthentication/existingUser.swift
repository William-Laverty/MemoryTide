//
//  existingUser.swift
//  MemoryTide
//
//  Created by William Laverty on 20/4/2023.
//

import SwiftUI

struct existingUser: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var isSigningIn = false

    var body: some View {
        VStack {
            Text("Welcome back!")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    HStack(spacing: 8) {
                        Image(systemName: "envelope")
                            .foregroundColor(.secondary)
                            .padding(.leading, 8)
                        TextField("Email", text: $email)
                            .padding(.vertical)
                            .keyboardType(.emailAddress)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .autocapitalization(.none)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        SecureField("Password", text: $password)
                            .padding(.vertical)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .autocapitalization(.none)
                }
                .padding(.horizontal)
                
                Button(action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    authViewModel.email = email
                    authViewModel.password = password
                    authViewModel.signIn()
                    isSigningIn = true
                }) {
                    HStack {
                        Spacer()
                        Text("Sign In")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .overlay(
                        Group {
                            if authViewModel.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                            }
                        }
                    )
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            Spacer()
            HStack {
                Text("Don't have an account?")
                    .padding(.top)
                    .foregroundColor(Color(.tertiaryLabel))
                    .font(.subheadline)
                NavigationLink(destination: SignupView()) {
                    Text("Register")
                        .padding(.top)
                        .foregroundColor(Color(.systemYellow))
                        .font(.subheadline)
                }
            }
        }
    }
}
