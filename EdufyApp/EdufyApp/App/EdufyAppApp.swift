//
//  EdufyAppApp.swift
//  EdufyApp
//
//  Created by Durdana on 22.01.26.
//

import SwiftUI

@main
struct EdufyAppApp: App {
    @State private var showSplash = true
    @State private var showOnboarding = !UserDefaults.standard.bool(
        forKey: "hasSeenOnboarding"
    )
    @State private var isLoggedIn = TokenManager.shared.isLoggedIn

    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                if showSplash {
                    SplashView()
                        .transition(.opacity)
                } else if showOnboarding {
                    OnboardingView(showOnboarding: $showOnboarding)
                        .transition(.opacity)
                } else if !isLoggedIn {
                    LoginView(isLoggedIn: $isLoggedIn)
                        .transition(.opacity)
                } else {
                    MainTabView(isLoggedIn: $isLoggedIn)
                        .transition(.opacity)
                }

            }
            .animation(.easeInOut(duration: 0.3), value: showSplash)
            .animation(.easeInOut(duration: 0.3), value: isLoggedIn)
            .task {
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showSplash = false
            }

            .onChange(of: showOnboarding) { _, newValue in
                if !newValue {
                    UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                }
            }
        }
    }
}
