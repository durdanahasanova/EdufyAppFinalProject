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
    
    private let networkService: NetworkService = DefaultNetworkService()
    
    var isValidEmail: Bool {
        let mail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return mail.range(of: pattern, options: .regularExpression) != nil
    }
    
    func sendCode() {
        touchEmail = true
        validate()
        guard isValidEmail else { return }
        
        Task { await performSendCode() }
        
    }
    
    private func performSendCode() async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let response: APIResponse<String?> = try await networkService.request(AuthEndpoint.forgotPassword(email))
            
            if response.success {
                print("LOG: OTP kodu gonderildi")
                navigateToOTP = true
            } else {
                apiError = response.message ?? "Xəta baş verdi"
                showAlert = true
            }
        } catch let error as NetworkError {
            if case .serverError(let code) = error {
                if code == 404 {
                    apiError = "Bu email ilə hesab tapılmadı"
                }
                else {
                    apiError = "Xəta baş verdi. Yenidən cəhd edin"
                }
            }
            else {
                apiError = "Internet baglantinizi yoxlayin"
            }
            showAlert = true
        } catch {
            apiError = "Xəta baş verdi"
            showAlert = true
        }
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
