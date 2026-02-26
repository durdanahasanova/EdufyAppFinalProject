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
                    .foregroundColor(.blackHigh)
                    .frame(width: 40, height: 40)
                    .background(.primaryYellow.opacity(0.7))
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Tədris müddəti")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.whiteHigh)
                    Text("\(duration) ay")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.whiteHigh)
                }
            }
            
            Spacer()
            
            // Group Size
            HStack(spacing: 12) {
                Image(systemName: "person.2")
                    .font(.system(size: 18))
                    .foregroundColor(.blackHigh)
                    .frame(width: 40, height: 40)
                    .background(.primaryYellow.opacity(0.7))
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Qrup")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(.whiteHigh)
                    Text("\(groupSize) nefer")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.whiteHigh)
                }
            }
        }
    }
}

#Preview {
    ProgramInfoView(duration: "4.5", groupSize: "23")
}
