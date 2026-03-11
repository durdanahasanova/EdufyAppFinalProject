import SwiftUI

struct ProgramInfoView: View {
    let duration: String
    let groupSize: String
    
    var body: some View {
        
        HStack(spacing: 24) {
            // Duration
            HStack(spacing: 12) {
                Image(systemName: "calendar")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(.yellowMedium)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Tədris müddəti")
                        .appFont(.textLMedium)
                        .foregroundColor(.whiteHigh)
                    Text(duration)
                        .appFont(.textMdRegular)
                        .foregroundColor(.whiteHigh)
                }
            }
            
            Spacer()
            
            // Group Size
            HStack(spacing: 12) {
                Image(systemName: "person.2")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .frame(width: 40, height: 40)
                    .background(.yellowMedium)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Qrup")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.whiteHigh)
                    Text(groupSize)
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(.whiteHigh)
                }
            }
        }
    }
}

#Preview {
    ProgramInfoView(duration: "4.5", groupSize: "23")
}
