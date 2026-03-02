//
//  ProfileView.swift
//  EdufyApp
//
//  Created by Durdana on 02.03.26.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @Binding var isLoggedIn: Bool
    
    var body: some View {
  
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                Text("Profil")
                    .appFont(.titleLSemibold)
                    .foregroundStyle(.whiteHigh)
                    .padding(.top, 16)
                
                
                //MARK: - USer Profile Card
                VStack(spacing: 16) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(viewModel.userEmail)
                                .appFont(.headingMdRegular)
                                .foregroundStyle(.whiteHigh)
                            
                            HStack(spacing: 6) {
                                Image(systemName: "phone.fill")
                                    .foregroundStyle(.secondaryYellow)
                                    .font(.system(size: 14))
                                
                                Text(viewModel.userEmail)
                                    .appFont(.bodyTextMdRegular)
                                    .foregroundStyle(.whiteHigh)
                            }
                        }
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 70, height: 70)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: 30))
                                    .foregroundStyle(.gray)
                            )
                    }
                    
                    HStack(spacing: 12) {
                        ProfileSmallButton(title: "Editle") {}
                        ProfileSmallButton(title: "şəkli dəyiş") {}
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 20)
                .background(.profileBackground)
                .cornerRadius(16)
                
                VStack(alignment: .leading, spacing: 8) {
                    ProfileMenuItem(icon: "person", title: "Salam") {
                        
                    }
                    
                    ProfileMenuItem(icon: "person", title: "Salam") {
                        
                    }
                    
                    ProfileMenuItem(icon: "rectangle.portrait.and.arrow.right", title: "Çıxış et") {
                        viewModel.showLogoutAlert = true
                    }
                }
                
                Spacer()
            }
            
            .padding()
            .task {
                 viewModel.fetchUser()
            }
            
            
        }
        
        //ALERT
        .alert("Çıxış et", isPresented: $viewModel.showLogoutAlert) {
            Button("Beli", role: .destructive) {
                viewModel.logout()
            }
            Button("Xeyr", role: .cancel) {}
        } message: {
            Text("Çıxış etmək istədiyinizdən əminsiniz?")
        }
        
        // Switch Login page
        .onChange(of: viewModel.didLogout) { oldValue, newValue in
            if newValue {
                isLoggedIn = false
            }
        }
    }
}
