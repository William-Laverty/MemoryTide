//
//  newUser.swift
//  MemoryTide
//
//  Created by William Laverty on 20/4/2023.
//

import SwiftUI

struct newUser: View {
    @State private var name: String = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State var isSigningUp = false
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    
                    HStack(spacing: 8) {
                        Image(systemName: "person.fill")
                            .foregroundColor(.secondary)
                            .padding(.leading, 8)
                        TextField("Full Name", text: $name)
                            .padding(.vertical)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .autocapitalization(.words)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
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
                    
                    HStack(spacing: 8) {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        SecureField("Confirm Password", text: $confirmPassword)
                            .padding(.vertical)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .autocapitalization(.none)
                }
                .padding(.horizontal)
                
                Button(action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                    authViewModel.name = name
                    authViewModel.email = email
                    authViewModel.password = password
                    authViewModel.signUp()
                    isSigningUp = true
                }) {
                    HStack {
                        Spacer()
                        Text("Sign Up")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .overlay(
                        Group {
                            if isSigningUp {
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
                Text("Already have an account?")
                    .padding(.top)
                    .foregroundColor(Color(.tertiaryLabel))
                    .font(.subheadline)
                NavigationLink(destination: LoginView()) {
                    Text("Sign In")
                        .padding(.top)
                        .foregroundColor(Color(.systemYellow))
                        .font(.subheadline)
                }
            }
        }
    }
}
