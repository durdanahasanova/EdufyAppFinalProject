//
//  OTPView.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import SwiftUI

struct OTPView: View {
    
    let email: String
    var onSuccess: (() -> Void)? = nil
    @StateObject private var viewModel = OTPViewModel()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.tabBarVisibility) var tabBarVisibility
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
            
            VStack(alignment: .leading, spacing: 32) {
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("OTP kodu")
                        .appFont(.titleLSemibold)
                        .foregroundStyle(.whiteHigh)
                    
                    Text("Mail-ə kod göndərildi. Zəhmət olmasa email-ə daxil olub, kodu daxil edəsiniz")
                        .appFont(.bodyTextMdRegular)
                        .foregroundStyle(.whiteMedium)
                    
                }
                EdufyTextField(
                    tittle: "OTP kodu",
                    placeholder: "OTP kodunu daxil edin",
                    text: $viewModel.code,
                    error: viewModel.errorMessage
                )
                .keyboardType(.numberPad)
                .onChange(of: viewModel.code) { oldValue, newValue in
                    if newValue.count > 6 {
                        viewModel.code = String(newValue.prefix(6))
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.whiteHigh)
                        .frame(maxWidth: .infinity)
                } else {
                    Buttons(
                        title: "Davam et",
                        style: viewModel.code.count == 6 ? .primaryLargeButton : .disableLargeButton,
                        action: {
                            viewModel.verifyCode(email: email)
                        }
                    )
                    .disabled(viewModel.code.count != 6)
                }
                
                Spacer()
            }
            .onTapGesture {
                hideKeyboard()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .onAppear {
            tabBarVisibility?.isHidden = true
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $viewModel.navigateToReset) {
            ResetPasswordView(email: email, code: viewModel.code) {
                if let onSuccess = onSuccess {
                    onSuccess()
                } else {
                    dismiss()
                }
            }
        }
    }
}
