//
//  SignupOptions.swift
//  MemoryTide
//
//  Created by William Laverty on 20/4/2023.
//

import SwiftUI

struct SignupOptions: View {
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: "envelope.fill")
                    .imageScale(.medium)
                Text("Continue with Email")
            }
            .font(.body.weight(.medium))
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .clipped()
            .foregroundColor(Color(.displayP3, red: 244/255, green: 188/255, blue: 73/255))
            .background {
                NavigationLink(destination: SignupView()) {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.clear.opacity(0.25), lineWidth: 0)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.yellow.opacity(0.1)))
                }
            }
            
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: "envelope.fill")
                    .imageScale(.medium)
                Text("Continue with Gmail")
            }
            .font(.body.weight(.medium))
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .clipped()
            .foregroundColor(Color(.displayP3, red: 244/255, green: 188/255, blue: 73/255))
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.clear.opacity(0.25), lineWidth: 0)
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.yellow.opacity(0.1)))
            }
            
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: "applelogo")
                    .imageScale(.medium)
                Text("Continue with Apple")
            }
            .font(.body.weight(.medium))
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .clipped()
            .foregroundColor(Color(.systemBackground))
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.primary)
            }
        }
        .padding(.horizontal, 15)
    }

}
