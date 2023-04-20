//
//  HomeView.swift
//  MemoryTide
//
//  Created by William Laverty on 18/4/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Home Screen")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Image(systemName: "house.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .padding()
            Spacer()
        }
        .navigationBarTitle("Home")
    }
}
