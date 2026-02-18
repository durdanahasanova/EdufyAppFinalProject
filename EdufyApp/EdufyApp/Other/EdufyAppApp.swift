//
//  EdufyAppApp.swift
//  EdufyApp
//
//  Created by Durdana on 22.01.26.
//

import SwiftUI

@main
struct EdufyAppApp: App {
    @State private var showOnboarding = true
    @State private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.black   
                    .ignoresSafeArea()

                if showOnboarding {
                    OnboardingView(showOnboarding: $showOnboarding)
                } else if !isLoggedIn {
                    LoginView(isLoggedIn: $isLoggedIn)
                } else {
                    MainTabView()
                }
                
                
            }
        }
    }
}
