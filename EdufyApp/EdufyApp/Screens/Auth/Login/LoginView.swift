import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel = LoginViewModel()
    @Binding var isLoggedIn: Bool
    @State private var showForgotPassword = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView{
                    VStack(spacing: 32) {
                        
                        Text("Edufy-a \nxoş gəldiniz!")
                            .appFont(.headerBold)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.whiteHigh)
                            //.fixedSize(horizontal: false, vertical: true)
                        
                        VStack(alignment: .leading, spacing: 40) {
                            
                            EdufyTextField(
                                tittle: "Email",
                                placeholder: "Mail daxil edin",
                                text: $viewModel.email,
                                error: viewModel.emailError
                            )
                            .onChange(of: viewModel.email) { oldValue, newValue in
                                viewModel.touchEmail = true
                            }
                            
                            EdufyTextField(
                                tittle: "Parol",
                                placeholder: "Parolu daxil et",
                                text: $viewModel.password,
                                error: viewModel.passwordError,
                                isSecure: true
                            )
                            .onChange(of: viewModel.password) {
                                oldValue,
                                newValue in
                                viewModel.touchPassword = true
                            }
                            
                            //MARK: - Forgot password
//                            NavigationLink {
//                                ForgotPasswordView()
//                            } label: {
//                                Text("Parolu unutmuşam")
//                                    .appFont(.bodyTextMdRegular)
//                                    .foregroundStyle(.whiteHigh)
//                            }
                            Button {
                                showForgotPassword = true
                            } label: {
                                Text("Parolu unutmuşam")
                                    .appFont(.bodyTextMdRegular)
                                    .foregroundStyle(.whiteHigh)
                            }
                            
                        }
                        
                        if viewModel.isLoading {
                            ProgressView()
                                .tint(.whiteHigh)
                        } else {
                            Buttons(
                                title: "Daxil ol",
                                style: viewModel.isActiveInput
                                ? .primaryLargeButton : .disableLargeButton,
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
                            
                            NavigationLink(
                                destination: RegisterView(isLoggedIn: $isLoggedIn)
                            ) {
                                Buttons(
                                    title: "Qeydiyyatdan keç",
                                    style: .secondaryLargeButton
                                )
                            }
                        }
                    }
                    
                    .padding(.top, 80)
                    .padding(.horizontal, 16)
                }
                .navigationDestination(isPresented: $showForgotPassword) {
                    ForgotPasswordView(onSuccess: {
                        showForgotPassword = false
                    })
                }
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
