//
//  LoginViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 30.01.26.
//
import SwiftUI
import Combine

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    
    // Inputs
    @Published var email: String = ""    { didSet { validate() } }
    @Published var password: String = "" { didSet { validate() } }
    
    //Touch
    @Published var touchEmail = false
    @Published var touchPassword = false
    
    // Errors
    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    
    
    var isActiveInput: Bool {
      isValidEmail && isValidPassword
    }
    
    
    func login() {
        touchEmail = true
        touchPassword = true
        
        validate()
        guard isActiveInput else { return }
        print("Register user: \(email)")
    }
    
    private var isValidEmail: Bool {
        let mail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return mail.range(of: pattern, options: .regularExpression) != nil
    }
    
    private var isValidPassword: Bool {
        password.count >= 8
    }
    
    private func validate() {
        
        //Email error
        if touchEmail {
            let mail = email.trimmingCharacters(in: .whitespacesAndNewlines)
            if mail.isEmpty {
                emailError = "Email boş ola bilməz"
            } else {
                emailError = isValidEmail ? nil : "Email formatı yanlışdır"
            }
        } else {
            emailError = nil
        }
        
        
        //Password error
        if touchPassword {
            if password.isEmpty {
                passwordError = "Şifrə boş ola bilməz"
            } else if password.count < 6 {
                passwordError = "Şifrə Yanlisdir"
            } else {
                passwordError = nil
            }
        }
        else {
            passwordError = nil
        }
    }
}
