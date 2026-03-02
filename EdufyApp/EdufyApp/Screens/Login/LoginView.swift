import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()
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

                    VStack(alignment: .leading, spacing: 40) {

                        EdufyTextField(
                            tittle: "Email",
                            placeholder: "Enter email",
                            text: $viewModel.email,
                            error: viewModel.emailError
                        )
                        .onChange(of: viewModel.email) { oldValue, newValue in
                            viewModel.touchEmail = true
                        }

                        EdufyTextField(
                            tittle: "Password",
                            placeholder: "Enter password",
                            text: $viewModel.password,
                            error: viewModel.passwordError,
                            isSecure: true
                        )
                        .onChange(of: viewModel.password) { oldValue, newValue in
                            viewModel.touchPassword = true
                        }
                    }
                    
//                    if let error = viewModel.apiError {
//                        Text(error)
//                            .font(.system(size: 14))
//                            .foregroundStyle(.red)
//                            .multilineTextAlignment(.center)
//                    }

                    
                    if viewModel.isLoading {
                      ProgressView()
                            .tint(.whiteHigh)
                    } else {
                        Buttons(
                            title: "Daxil ol",
                            style: viewModel.isActiveInput ? .primaryLargeButton : .disableLargeButton,
                            action: {
                                viewModel.login()
                                    //isLoggedIn = true
                            }
                        )
                        .disabled(!viewModel.isActiveInput)
                    }

                    Spacer()

                    VStack(spacing: 24) {
                        Text("Hesabınız yoxdur?")
                            .foregroundStyle(.whiteHigh)
                            .appFont(.bodyTextMdRegular)

                        NavigationLink(destination: RegisterView(isLoggedIn: $isLoggedIn)) {
                            Buttons(title: "Qeydiyyatdan keç", style: .secondaryLargeButton)
                        }
                    }
                }
                .padding(.top, 80)
                .padding(.horizontal, 16)
                
                .onChange(of: viewModel.loginSuccess) { oldValue, newValue in
                    if newValue {
                        isLoggedIn = true
                    }
                }
                .alert("Xəta", isPresented: $viewModel.showAlert) {
                    Button("Bağla", role: .cancel) {}
                } message: {
                        Text(viewModel.apiError ?? "")
                    }
            }
        }
    }
}
