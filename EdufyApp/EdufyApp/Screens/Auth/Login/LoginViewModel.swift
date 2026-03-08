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
    
    //API
    private let networkService: NetworkService = DefaultNetworkService()
    @Published var isLoading = false
    @Published var apiError: String? = nil
    @Published var loginSuccess = false
    @Published var showAlert = false
    
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
        //print("Register user: \(email)")
        Task {
            await performLogin()
        }
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
    
    private func performLogin() async {
        isLoading = true
        apiError = nil
        
        defer {
            isLoading = false
        }
        
        let request = LoginRequest(email: email, password: password)
        
        do {
            
            let response: APIResponse<LoginData> = try await networkService.request(AuthEndpoint.login(request))
            
            if response.success, let data = response.data {
                TokenManager.shared.saveTokens(
                    access: data.accessToken,
                    refresh: data.refreshToken
                )
                loginSuccess = true
                print("LOG: Login ugurludur")
            } else {
                apiError = response.message ?? "Giriş uğursuz oldu"
                showAlert = true
            }
            
        } catch let error as NetworkError {
            if case .serverError(let statusCode) = error {
                if statusCode == 401 {
                    apiError = "Mail ve ya sifre yanlisdir"
                } else if statusCode == 404 {
                    apiError = "Bu mail ile hesab tapilmadi"
                } else {
                    apiError = "Xəta baş verdi. İnternet bağlantınızı yoxlayın."
                }
            }
            showAlert = true
            
        }
        catch {
            apiError = "Xəta baş verdi.İnternet bağlantınızı yoxlayın"
            showAlert = true
        }
        
    }
}
