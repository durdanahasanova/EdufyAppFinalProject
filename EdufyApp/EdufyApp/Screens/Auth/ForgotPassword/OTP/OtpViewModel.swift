//
//  OtpViewModel.swift
//  EdufyApp
//
//  Created by Durdana on 03.03.26.
//

import Foundation
import Combine

@MainActor
final class OTPViewModel: ObservableObject {
    
    @Published var code: String = ""
    @Published var errorMessage: String? = nil
    @Published var isLoading = false
    @Published var navigateToReset = false
    
    func verifyCode(email: String) {
        guard code.count == 6 else {
            errorMessage = "Kod 6 reqem olmalidir"
            return
        }
        
        errorMessage = nil
        
        // TODO: API
        errorMessage = nil
        navigateToReset = true
    }
}
