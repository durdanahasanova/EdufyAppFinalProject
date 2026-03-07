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
    @State private var showResetPassword = false
    
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.background.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("Profil")
                        .appFont(.titleLSemibold)
                        .foregroundStyle(.whiteHigh)
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                    
                    
                    //MARK: - USer Profile Card
                    VStack(spacing: 16) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(viewModel.userEmail)
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundStyle(.whiteHigh)
                                
                                HStack(spacing: 6) {
                                    Image("email")
                                        .foregroundStyle(.secondaryYellow)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text(viewModel.userEmail)
                                        .appFont(.bodyTextMdRegular)
                                        .foregroundStyle(.whiteHigh)
                                }
                            }
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 20)
                        .background(.profileBackground)
                        .cornerRadius(16)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            ProfileMenuItem(icon: "lock", title: "Parolu dəyiş") {
                                showResetPassword = true
                            }
                            
                            ProfileMenuItem(icon: "logout", title: "Çıxış et") {
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
                .navigationDestination(isPresented: $showResetPassword, destination: {
                    //ResetPasswordView(email: "", code: "")
                    ForgotPasswordView(prefillEmail: viewModel.userEmail)
                })
                
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
    }
    
}
