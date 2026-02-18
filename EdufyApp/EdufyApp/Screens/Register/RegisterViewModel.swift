//
//  RegisterViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 12.02.26.
//

import SwiftUI
import Combine

import Foundation

@MainActor
final class RegisterViewModel: ObservableObject {
    
    // Inputs
    @Published var fullName: String = "" { didSet { validate() } }
    @Published var email: String = ""    { didSet { validate() } }
    @Published var password: String = "" { didSet { validate() } }
    
    //Touch
    @Published var touchFullName = false
    @Published var touchEmail = false
    @Published var touchPassword = false
    
    // Errors
    @Published var fullNameError: String? = nil
    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    
    
    var isActiveInput: Bool {
        isValidFullName && isValidEmail && isValidPassword
    }
    
    
    func register() {
        touchFullName = true
        touchEmail = true
        touchPassword = true
        
        validate()
        guard isActiveInput else { return }
        print("Register user: \(fullName), \(email)")
    }
    
    private var isValidFullName: Bool {
        !fullName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
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
        
        //Fullname error
        if touchFullName {
            fullNameError = isValidFullName ? nil : "Ad soyad bos ola bilmez"
        } else {
            fullNameError = nil
        }
        
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
        
        
        //Password
        if touchPassword {
            if password.isEmpty {
                passwordError = "Şifrə boş ola bilməz"
            } else if password.count < 6 {
                passwordError = "Şifrə ən az 6 simvol olmalıdır"
            } else {
                passwordError = nil
            }
        }
        else {
            passwordError = nil
        }
    }
}
