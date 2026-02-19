import SwiftUI

struct RegisterView: View {

    @StateObject private var viewModel = RegisterViewModel()
    @Binding var isLoggedIn: Bool

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()

                VStack(spacing: 32) {
                    Text("Edufy-a \nxoş gəldiniz!")
                        .appFont(.headerBold)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.whiteHigh)

                    VStack(alignment: .leading, spacing: 48) {

                        // MARK: - Field
                        VStack(alignment: .leading, spacing: 20) {

                            EdufyTextField(
                                tittle: "Tam adınız",
                                placeholder: "Ad soyad daxil et",
                                text: $viewModel.fullName,
                                error: viewModel.fullNameError
                            )
                            .onChange(of: viewModel.fullName) { _ in
                                viewModel.touchFullName = true
                            }

                            EdufyTextField(
                                tittle: "Email",
                                placeholder: "Enter email",
                                text: $viewModel.email,
                                error: viewModel.emailError
                            )
                            .onChange(of: viewModel.email) { _ in
                                viewModel.touchEmail = true
                            }

                            EdufyTextField(
                                tittle: "Password",
                                placeholder: "Enter password",
                                text: $viewModel.password,
                                error: viewModel.passwordError,
                                isSecure: true
                            )
                            .onChange(of: viewModel.password) { _ in
                                viewModel.touchPassword = true
                            }
                        }

                        // MARK: - Register button
                        Buttons(
                            title: "Qeydiyyatdan keç",
                            style: viewModel.isActiveInput ? .primaryLargeButton : .disableLargeButton,
                            action: { viewModel.register() }
                        )
                        .disabled(!viewModel.isActiveInput)
                    }

                    Spacer()

                    VStack(spacing: 24) {
                        Text("Hesabınız var?")
                            .foregroundStyle(.whiteHigh)
                            .appFont(.bodyTextMdRegular)

                        NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn)) {
                            
                            Buttons(title: "Daxil ol", style: .secondaryLargeButton)
                        }
                    }
                }
                .padding(.top, 80)
                .padding(.horizontal, 16)
            }
        }
    }
}

//#Preview {
//    RegisterView()
//}
