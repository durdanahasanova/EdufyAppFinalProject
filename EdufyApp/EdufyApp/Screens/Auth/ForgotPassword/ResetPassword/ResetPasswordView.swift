//
//  ResetPasswordView.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import SwiftUI

struct ResetPasswordView: View {

    @StateObject private var viewModel = ResetPasswordViewModel()
    @Environment(\.dismiss) private var dismiss
    @Environment(\.tabBarVisibility) var tabBarVisibility

    let email: String
    let code: String
    var onSuccess: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
            ScrollView {
                VStack(alignment: .leading, spacing: 32) {

                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .frame(width: 28, height: 28)
                    }

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Şifrəni yenilə")
                            .appFont(.titleLSemibold)
                            .foregroundStyle(.whiteHigh)

                        Text(
                            "Mailinizə kod göndərildi. Zəhmət olmasa e-poçtunuza daxil olub, kodu daxil edin."
                        )
                        .appFont(.bodyTextMdRegular)
                        .foregroundStyle(.whiteMedium)
                    }

                    VStack(alignment: .leading, spacing: 24) {
                        EdufyTextField(
                            tittle: "Yeni şifrə",
                            placeholder: "Şifrəni yaz",
                            text: $viewModel.password,
                            error: viewModel.passwordError,
                            isSecure: true
                        )
                        .onChange(of: viewModel.password) {
                            oldValue,
                            newValue in
                            viewModel.touchPassword = true
                        }

                        EdufyTextField(
                            tittle: "Yeni şifrə təkrar",
                            placeholder: "Təkrar şifrəni yaz",
                            text: $viewModel.confirmPassword,
                            error: viewModel.confirmError,
                            isSecure: true
                        )
                        .onChange(of: viewModel.confirmPassword) {
                            oldValue,
                            newValue in
                            viewModel.touchConfirm = true
                        }
                    }

                    if viewModel.isLoading {
                        ProgressView()
                            .tint(.whiteHigh)
                            .frame(maxWidth: .infinity)
                    } else {
                        Buttons(
                            title: "Davam et",
                            style: viewModel.isFormValid
                                ? .primaryLargeButton : .disableLargeButton,
                            action: {
                                viewModel.resetPassword(
                                    email: email,
                                    code: code
                                )
                            }
                        )
                        .disabled(!viewModel.isFormValid)
                    }

                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .onTapGesture {
                    hideKeyboard()
                }
            }
        }
        .onAppear {
            tabBarVisibility?.isHidden = true
        }
        .navigationBarBackButtonHidden(true)
        .alert(
            viewModel.isSuccess ? "Uğurlu" : "Xəta",
            isPresented: $viewModel.showAlert
        ) {
            Button("OK", role: .cancel) {
                if viewModel.isSuccess {
                    // profile ekranina qayit
                    onSuccess?()
                }
            }
        } message: {
            Text(viewModel.alertMessage ?? "")
        }
    }
}
