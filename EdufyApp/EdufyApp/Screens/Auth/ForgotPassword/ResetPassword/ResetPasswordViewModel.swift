//
//  ResetPasswordViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import Foundation
import Combine

@MainActor
final class ResetPasswordViewModel: ObservableObject {
    
    @Published var password: String = "" { didSet { validate() } }
    @Published var confirmPassword: String = "" { didSet { validate() } }
    
    @Published var touchPassword = false
    @Published var touchConfirm = false
    
    @Published var passwordError: String? = nil
    @Published var confirmError: String? = nil
    
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var alertMessage: String? = nil
    @Published var isSuccess = false
    
    private let networkService: NetworkService = DefaultNetworkService()
    
    var isFormValid: Bool {
        password.count >= 8
        && password.range(of: "[A-Z]", options: .regularExpression) != nil
        && password.range(of: "[a-z]", options: .regularExpression) != nil
        && password.range(of: "[^A-Za-z0-9]", options: .regularExpression) != nil
        && password == confirmPassword
        && !confirmPassword.isEmpty
    }
    
    func resetPassword(email: String, code: String) {
        touchPassword = true
        touchConfirm = true
        validate()
        guard isFormValid else { return }
        
        // TODO: API qosulacaq
        isSuccess = true
        alertMessage = "Sifreniz ugurla yenilendi"
        showAlert = true
    }
    
    private func performResetPassword(email: String, code: String) async {
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            let response: APIResponse<String?> = try await networkService.request(
                AuthEndpoint.resetPassword(email, code, password))
            
            if response.success {
                print("LOG: Şifrə uğurla yeniləndi")
                isSuccess = true
                alertMessage = "Şifrəniz uğurla yeniləndi"
                showAlert = true
            } else {
                isSuccess = false
                alertMessage = response.message ?? "Xəta baş verdi"
                showAlert = true
            }
            
            
        } catch let error as NetworkError {
            if case .serverError(let statusCode) = error {
                if statusCode == 400 {
                    alertMessage = "Kod yanlış və ya müddəti bitib"
                } else {
                    alertMessage = "Xəta baş verdi. Yenidən cəhd edin"
                }
            } else {
                alertMessage = "İnternet bağlantınızı yoxlayın"
            }
            isSuccess = false
            showAlert = true
        }
        
        catch  {
            alertMessage = "Xəta baş verdi"
            isSuccess = false
            showAlert = true
        }
    }
    
    private func validate() {
        // Password validation
        if touchPassword {
            if password.isEmpty {
                passwordError = "Sifre bos ola bilmez"
            } else if password.count < 8 {
                passwordError = "Sifre en az 8 simvol olmalidir"
            } else if password.range(of: "[A-Z]", options: .regularExpression) == nil {
                passwordError = "En az 1 boyuk herf olmalidir"
            } else if password.range(of: "[a-z]", options: .regularExpression) == nil {
                passwordError = "En az 1 kicik herf olmalidir"
            } else if password.range(of: "[^A-Za-z0-9]", options: .regularExpression) == nil {
                passwordError = "En az 1 xususi simvol olmalidir (@, #, ! ve s.)"
            } else {
                passwordError = nil
            }
        } else {
            passwordError = nil
        }
        
        // Confirm validation
        if touchConfirm {
            if confirmPassword.isEmpty {
                confirmError = "Sifreni tekrar daxil edin"
            } else if confirmPassword != password {
                confirmError = "Sifreler uygun gelmir"
            } else {
                confirmError = nil
            }
        } else {
            confirmError = nil
        }
    }
}
