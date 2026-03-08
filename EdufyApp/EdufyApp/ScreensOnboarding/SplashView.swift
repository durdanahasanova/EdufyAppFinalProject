//
//  SplashScreen.swift
//  EdufyApp
//
//  Created by Durdana on 06.03.26.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.yellowMedium.ignoresSafeArea()
            
            Text("Edufy")
                .font(.system(size: 48, weight: .black))
                .foregroundColor(.blackHigh)
        }
    }
}
