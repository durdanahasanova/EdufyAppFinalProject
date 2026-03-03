//
//  ForgotPasswordViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//


import Foundation
import Combine

@MainActor
final class ForgotPasswordViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var touchEmail = false
    @Published var emailError: String? = nil
    
    @Published var isLoading = false
    @Published var apiError: String? = nil
    @Published var showAlert = false
    @Published var navigateToOTP = false
    
    var isValidEmail: Bool {
        let mail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return mail.range(of: pattern, options: .regularExpression) != nil
    }
    
    func sendCode() {
        touchEmail = true
        validate()
        guard isValidEmail else { return }
        
        // TODO: API qosulacaq
        navigateToOTP = true
    }
    
    private func validate() {
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
    }
}
