//
//  SplashScreenView.swift
//  EdufyApp
//
//  Created by Durdana on 23.01.26.
//

import SwiftUI

struct OnboardingStep {
    var title: String
    var description: String
    var image: String
    var color: Color
}

struct OnboardingView: View {
    
    private let steps = [
        
        OnboardingStep(title: "Yeni biliklər\nkəşf et", description: "Yüzlərlə kurs arasından sənə\nən uyğun olanı tap", image: "splashfirstimage", color: Color( "primaryPurple")),
        OnboardingStep(title: "Öz biliklərini\npaylaş!", description: "Öz kursunu yarat və biliklərini\nhər kəsə çatdır", image: "splashsecondimage", color: Color("primaryOrange"))
    ]
    
    @State private var currentStep = 0
    
    var body: some View {
        ZStack {
            
            steps[currentStep].color
                .ignoresSafeArea()
                .animation(.easeInOut, value: currentStep)
            
            VStack(spacing: 12) {
                Spacer()
                
                VStack(spacing: 16) {
                    Text(steps[currentStep].title)
                        .appFont(.headerBold)
                        .multilineTextAlignment(.center)
                    
                    Text(steps[currentStep].description)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
                
                Image(steps[currentStep].image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 390)
                    .id(steps[currentStep].image)
                
                Spacer()
                
                VStack(spacing: 24){
                    HStack(spacing: 8) {
                        Capsule()
                            .fill(currentStep == 0 ? Color.black : Color.white.opacity(0.5))
                            .frame(width: currentStep == 0 ? 36 : 10, height: 10)
                        
                        Capsule()
                            .fill(currentStep == 1 ? Color.black : Color.white.opacity(0.5))
                            .frame(width: currentStep == 1 ? 36 : 10, height: 10)
                    }
                    
                    HStack{
                        
                        Button(action: {
                            if currentStep > 0 {
                                withAnimation { currentStep -= 1 }
                            }
                        }) {
                            Text("Back")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 24)
                        }
                        .opacity(currentStep == 0 ? 0 : 1)
                        .disabled(currentStep == 0)
                        
                        Spacer()
                        
                        
                        Button(action: {
                            if currentStep < steps.count - 1 {
                                withAnimation { currentStep += 1 }
                            } else {
                                print("Onboarding bitdi")
                                
                            }
                        }){
                            HStack(spacing: 10) {
                                Text(currentStep == steps.count - 1 ? "Başla" : "Növbəti")
                                    .fontWeight(.semibold)
                                Image(systemName: "chevron.right")
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 25)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
            
        }
    }
    
    //    var backgroundColor: Color {
    //        currentStep == 0 ? Color("primaryPurple") : Color("primaryOrange")
    //    }
}


#Preview {
    OnboardingView()
}






