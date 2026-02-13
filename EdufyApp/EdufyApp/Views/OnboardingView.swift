import SwiftUI

struct OnboardingStep {
    let tittle: String
    let describtion: String
    let image: String
    let color: Color
}

struct OnboardingView: View {
    
    @Binding var showOnboarding: Bool
    private let steps: [OnboardingStep] = [
        OnboardingStep(tittle: "Yeni biliklər\nkəşf et", describtion: "Yüzlərlə kurs arasından sənə\nən uyğun olanı tap", image: "splashfirstimage" , color: Color("primaryPurple")),
        
        OnboardingStep(tittle: "Öz biliklərini\npaylaş!", describtion: "Öz kursunu yarat və biliklərini\nhər kəsə çatdır", image: "splashsecondimage", color: Color("primaryOrange"))
        
    ]
    
    @State private var currentIndex = 0
    private var isLastStep: Bool { currentIndex == steps.count - 1 }
    private var currentStep: OnboardingStep { steps[currentIndex] }
    
    var body: some View {
        ZStack {
            currentStep.color
                .ignoresSafeArea()
                .animation(.easeInOut, value: currentIndex)
            
            VStack(spacing: 12) {
                Spacer()
                
                VStack(spacing: 16) {
                    Text(currentStep.tittle)
                        .appFont(.headerBold)
                        .multilineTextAlignment(.center)
                    
                    Text(currentStep.describtion)
                        .appFont(.headingMdMedium)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                }
                
                Spacer()
                
                Image(currentStep.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 390)
                
                Spacer()
                
                VStack(spacing: 24) {
                    HStack(spacing: 8) {
                        ForEach(0 ..< steps.count, id: \.self) { index in
                            Capsule()
                                .fill(currentIndex == index ? .black : .white.opacity(0.5))
                                .frame(width: currentIndex == index ? 36 : 10, height: 10)
                            
                        }
                    }
                    .animation(.spring(), value: currentIndex)
                    
                    HStack {
                        Button {
                            withAnimation(.easeInOut) {
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                } else {
                                    showOnboarding = false
                                }
                            }
                        } label: {
                            Text("Back")
                                .appFont(.headingMdMedium)
                                .foregroundColor(.black)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 24)
                        }
                        .opacity(currentIndex == 0 ? 0 : 1)
                        .disabled(currentIndex == 0)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.easeInOut) {
                                if currentIndex < 1 {
                                    currentIndex += 1
                                } else {
                                    showOnboarding = false
                                    print("Onboarding bitdi")
                                }
                            }
                        }) {
                            HStack(spacing: 10) {
                                Text(isLastStep ? "Başla" : "Növbəti")
                                    .appFont(.headingMdMedium)
                                Image("chevron_right")
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 25)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 32)
                }
            }
        }
    }
}


