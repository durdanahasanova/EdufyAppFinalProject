//
//  ApplicationFormView.swift
//  EdufyApp
//
//  Created by Durdana on 25.02.26.
//

import SwiftUI

struct ApplicationFormView: View {
    @StateObject var viewModel: ProgramDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phone: String = ""
    @State private var showSuccess: Bool = false
    
    private var isFormValid: Bool {
        !firstName.isEmpty && !lastName.isEmpty && !phone.isEmpty
    }
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                
                
                //Header
                VStack(alignment: .leading, spacing: 20) {
                    Button  {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.whiteHigh)
                            .frame(width: 24, height: 24)
                    }
                    
                    Text("Müraciət et")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.white)
                    
                }
                
                //Input for apply
                VStack(spacing: 16) {
                    EdufyTextField(
                        tittle: "Adınız",
                        placeholder: "Adınızı daxil edin",
                        text: $firstName
                    )
                    EdufyTextField(
                        tittle: "Soyadınız",
                        placeholder: "Soyadınızı daxil edin",
                        text: $lastName
                    )
                    EdufyTextField(
                        tittle: "Əlaqə nömrəniz",
                        placeholder: "Əlaqə nömrənizi daxil edin",
                        text: $phone
                    )
                }
                
                //Info
                HStack(spacing: 12) {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.blue)
                    Text("Müraciət etdikdən sonra əməkdaşlar sizinlə qısa müddət ərzində əlaqə saxlayacaq")
                        .appFont(.bodyTextSmRegular)
                        .foregroundColor(.white)
                }
                .padding(16)
                .background(Color.blue.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
                //If error
                if let error = viewModel.submitError {
                    Text(error)
                        .appFont(.bodyTextSmRegular)
                        .foregroundColor(.red)
                        .padding(.top, 12)
                }
                
                Spacer()
                
                Buttons(title: viewModel.isSubmitting ? "Gonderilir" : "Muraciet et",
                        style: isFormValid ? .primaryLargeButton : .disableLargeButton,
                        action: {
                    Task {
                        await viewModel.submitApplication(
                            firstname: firstName,
                            lastname: lastName,
                            phone: phone)
                        
                        if viewModel.hasApplied {
                            showSuccess = true
                        }
                    }
                },
                        isEnabled: isFormValid && !viewModel.isSubmitting
                )
                
            }
            .padding(16)
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showSuccess) {
            ApplicationSuccessView {
                dismiss()
            }
        }
        
    }
}


#Preview {
    NavigationStack {
        ApplicationFormView(
            viewModel: ProgramDetailViewModel(programId: "1")
        )
    }
}
