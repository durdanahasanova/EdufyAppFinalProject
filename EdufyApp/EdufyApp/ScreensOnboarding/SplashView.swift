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
            Color.black.ignoresSafeArea()
            
            Text("Edufy")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.primaryYellow)
        }
    }
}
