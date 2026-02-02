//
//  LoginView.swift
//  EdufyApp
//
//  Created by Durdana on 29.01.26.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        
        
        ZStack {
            
            Color.background.ignoresSafeArea()
            
            VStack {
                Text("Edufy-a \nxoş gəldiniz!")
                    .appFont(.headerBold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.whiteHigh)
                
                VStack(alignment: .leading, spacing: 40) {
                    
                    VStack(alignment: .leading, spacing: 2){
                        
                        //MARK: - Email inputu
                        VStack {
                            
                            EdufyTextField(tittle: "Email",
                                           placeholder: "Enter email",
                                           text: $viewModel.email)
                        }
                        .padding(20)
                        
                        //MARK: -Parol inputu
                        VStack {
                            
                            EdufyTextField(tittle: "Password",
                                           placeholder: "Enter password",
                                           text: $viewModel.password,
                                           error: viewModel.passwordError,
                                           isSecure: true )
                        }
                        .padding(20)
 
                    }
                    
                    //MARK: - Daxil ol button
                    Buttons(title: "Daxil ol", style: .disableLargeButton, action: {})
                        .disabled(!viewModel.isActiveInput)
//                        .padding(.top, 40)
                }
                
                
                Spacer()
                
                VStack {
                    
                    Text("Hesabiniz yoxdur?")
                        .foregroundStyle(.whiteHigh)
                        .appFont(.bodyTextMdRegular)
                    
                    
                    Buttons(title: "Qeydiyyatdan kec", style: .secondaryLargeButton, action: {})
                }
                
            }
            .padding(.top, 80)
            
        }
        
    }
}


#Preview {
    LoginView()
}
