//
//  ApplicationSuccessView.swift
//  EdufyApp
//
//  Created by Durdana on 25.02.26.
//

import SwiftUI

struct ApplicationSuccessView: View {
    
    let onOk: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image("successApply")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 182, height: 192)
                
                // Metnler
                VStack(alignment: .center, spacing: 16) {
                    Text("Müraciət uğurla göndərildi")
                        .appFont(.titleSmBold)
                        .foregroundStyle(.whiteHigh)
                        .multilineTextAlignment(.center)
                    
                    Text("Əməkdaşlar sizin ilə qısa müddət ərzində əlaqə saxlayacaq")
                        .appFont(.textMdMedium)
                        .foregroundStyle(.whiteMedium)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 36)
                .padding(.horizontal, 56)
                
                Spacer()
                
                Buttons(
                    title: "OK",
                    style: .primaryLargeButton,
                    action: {
                        dismiss()
                        onOk()
                    }
                )
            }
            .padding(16)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        ApplicationSuccessView(onOk: {})
    }
}

