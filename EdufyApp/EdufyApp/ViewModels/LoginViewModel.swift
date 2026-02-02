//
//  LoginViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 30.01.26.
//
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    var email: String = ""
    var password: String = ""
    var passwordError: String? = nil
    
    var isActiveInput: Bool {
        !email.isEmpty && password.count >= 8
    }
    
    func login() {
        if password.count < 8 {
            passwordError = "Parol ən az 8 simvoldan ibarət olmalıdır"
        } else {
            passwordError = nil
            print("LOG: Sorgu icra olunur")
        }
    }
}
