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
    
    private let networkService: NetworkService = DefaultNetworkService()
    
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
    
    //API
    @Published var isLoading = false
    @Published var apiError: String? = nil
    @Published var registerSuccess = false
    @Published var showAlert = false
    
    
    var isActiveInput: Bool {
        isValidFullName && isValidEmail && isValidPassword
    }
    
    
    func register() {
        touchFullName = true
        touchEmail = true
        touchPassword = true
        
        validate()
        guard isActiveInput else { return }
        
        Task {
            await performRegister()
            print("Register user: \(fullName), \(email)")
        }
        
        
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
        let password = password
        let hasMinLength = password.count >= 8
        let hasUppercase = password.range(of: "[A-Z]", options: .regularExpression) != nil
        let hasLowercase = password.range(of: "[a-z]", options: .regularExpression) != nil
        let hasSpecialChar = password.range(of: "[^A-Za-z0-9]", options: .regularExpression) != nil
        return hasMinLength && hasUppercase && hasLowercase && hasSpecialChar
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
            } else if password.count < 8 {
                passwordError = "Şifrə ən az 8 simvol olmalıdır"
            } else if password.range(of: "[A-Z]", options: .regularExpression) == nil {
                passwordError = "Ən az 1 böyük hərf olmalıdır"
            } else if password.range(of: "[a-z]", options: .regularExpression) == nil {
                passwordError = "Ən az 1 kiçik hərf olmalıdır"
            } else if password.range(of: "[^A-Za-z0-9]", options: .regularExpression) == nil {
                passwordError = "Ən az 1 xüsusi simvol olmalıdır (@, #, ! və s.)"
            } else {
                passwordError = nil
            }
        } else {
            passwordError = nil
        }
    }
    
    private func performRegister() async {
        isLoading = true
        apiError = nil
        
        defer {
            isLoading = false
        }
        
        let request = RegisterRequest(fullName: fullName, email: email, password: password)
        do {
            let response: APIResponse<LoginData> = try await networkService.request(AuthEndpoint.register(request))
            
            if response.success, let data = response.data {
                TokenManager.shared.saveTokens(access: data.accessToken, refresh: data.refreshToken)
                registerSuccess = true
                print("LOG: Register token ugurla yaradildi")
            } else {
                apiError = response.message ?? "LOG: Qeydiyyat ugursuz oldu"
                showAlert = true
            }
            
            
        } catch let error as NetworkError {
            if case .serverError(let statusCode) = error {
                if statusCode == 409 {
                    apiError = "Bu email artıq mövcuddur"
                } else if statusCode == 400 {
                    apiError = "Məlumatlar tələblərə uyğun deyil"
                } else {
                    apiError = "Xəta baş verdi"
                }
            } else {
                apiError = "İnternet bağlantınızı yoxlayın."
            }
            showAlert = true 
        }
        catch {
            apiError = "Xəta baş verdi."
            showAlert = true
        }
    }
}
