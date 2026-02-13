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
    var body: some Scene {
        WindowGroup {
            if showOnboarding {
                OnboardingView(showOnboarding: $showOnboarding)
            } else {
                LoginView()
            }
        }
    }
}
