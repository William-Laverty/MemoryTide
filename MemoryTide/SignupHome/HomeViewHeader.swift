//
//  HomeViewHeader.swift
//  MemoryTide
//
//  Created by William Laverty on 20/4/2023.
//

import SwiftUI

struct HomeViewHeader: View {
    
    var body: some View {
        VStack {
            Image("friends")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 356, height: 480)
                .blur(radius: 3)
                .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.12), radius: 8, x: 0, y: 4)
                .clipped()
                .overlay(alignment: .topLeading) {
                    VStack(alignment: .leading, spacing: 11) {
                        RoundedRectangle(cornerRadius: 17, style: .continuous)
                            .fill(.yellow)
                            .frame(width: 72, height: 72)
                            .clipped()
                            .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.12), radius: 8, x: 0, y: 4)
                            .overlay {
                                Image(systemName: "camera.macro")
                                    .imageScale(.large)
                                    .font(.system(size: 31, weight: .regular, design: .default))
                            }
                        VStack(alignment: .leading, spacing: 1) {
                            Text("MemoryTide")
                                .font(.largeTitle.weight(.medium))
                                .foregroundColor(.white)
                            Text("Create Memories, Share Moments.")
                                .font(.headline.weight(.medium))
                                .foregroundColor(.white)
                                .frame(width: 190, alignment: .leading)
                                .clipped()
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding()
                    .padding(.top, 42)
                }
                .overlay(alignment: .bottom) {
                    HStack {
                        Group {
                            Spacer()
                            Image(systemName: "camera")
                                .foregroundColor(.secondary)
                            Spacer()
                            Image(systemName: "person.3.fill")
                                .imageScale(.medium)
                                .foregroundColor(.yellow)
                            Spacer()
                            Image(systemName: "photo")
                                .foregroundColor(.secondary)
                        }
                        Group {
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .padding()
                    .background {
                        Rectangle()
                            .fill(.clear)
                            .background(Material.thin)
                            .mask {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                            }
                            .opacity(0.72)
                    }
                    .padding()
                }
                .mask {
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                }
                .padding()
                .padding(.top, 40)
                .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.15), radius: 18, x: 0, y: 14)
        }
    }
}
