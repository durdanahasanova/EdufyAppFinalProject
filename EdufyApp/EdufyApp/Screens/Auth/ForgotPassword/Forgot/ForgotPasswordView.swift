//
//  ForgotPasswordView.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import SwiftUI

struct ForgotPasswordView: View {

    @StateObject private var viewModel = ForgotPasswordViewModel()
    @Environment(\.dismiss) private var dismiss
    var prefillEmail: String = ""

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 32) {

                // Back button
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
                        "E-poçt ünvanınızı daxil edin. Şifrənizi yeniləmək üçün sizə kod göndəriləcək."
                    )
                    .appFont(.bodyTextMdRegular)
                    .foregroundStyle(.whiteMedium)
                }

                EdufyTextField(
                    tittle: "Mail",
                    placeholder: "E-poçt ünvanınızı daxil edin",
                    text: $viewModel.email,
                    error: viewModel.emailError
                )
                .onChange(of: viewModel.email) { oldValue, newValue in
                    viewModel.touchEmail = true
                }
                .disabled(!prefillEmail.isEmpty)

                if viewModel.isLoading {
                    ProgressView()
                        .tint(.whiteHigh)
                        .frame(maxWidth: .infinity)
                } else {
                    Buttons(
                        title: "Davam et",
                        style: viewModel.isValidEmail
                            ? .primaryLargeButton : .disableLargeButton,
                        action: {
                            viewModel.sendCode()
                        }
                    )
                    .disabled(!viewModel.isValidEmail)
                }

                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            if !prefillEmail.isEmpty {
                viewModel.email = prefillEmail
            }
        }
        .navigationDestination(isPresented: $viewModel.navigateToOTP) {
            OTPView(email: viewModel.email)
        }
        .alert("Xəta", isPresented: $viewModel.showAlert) {
            Button("Bağla", role: .cancel) {}
        } message: {
            Text(viewModel.apiError ?? "")
        }
    }
}
