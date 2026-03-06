
import SwiftUI

struct ProgramCard: View {
    
    let program: Program
    var onArrowTap: (() -> Void)?
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            HStack(alignment: .top,spacing: 12) {
                
                // Sekil + Badge
                ZStack(alignment: .bottomLeading) {
                    
                    AsyncImage(url: URL(string: program.instructorPhotoUrl)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        default:
                            ZStack {
                                Color.gray.opacity(0.3)
                                Image(systemName: "photo")
                                    .foregroundColor(.blackHigh)
                            }
                        }
                    }
                    .frame(width: 100, height: 85)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.blackHigh, lineWidth: 2)
                    )
                    
                    
                    // Badge
                    Text(program.statusLabel)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(.greenBadge)
                        .clipShape(Capsule())
                        .offset(x: 10, y: -10)
                }
                
                //Title + Duration
                VStack(alignment: .leading, spacing: 6) {
                    Text(program.name)
                        .appFont(.bodyTextMdBold)
                        .foregroundColor(.blackHigh)
                        .lineLimit(2)
                    
                    Text("Müddət: \(program.duration)")
                        .appFont(.bodyTextSmRegular)
                        .foregroundColor(.blackMedium)
                }
                
                Spacer()
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
            )
            
            //Black button
            Button {
                onArrowTap?()
            } label: {
                Image(systemName: "arrow.up.right")
                    .foregroundColor(.whiteHigh)
                    .frame(width: 36, height: 36)
                    .background(.blackHigh)
                    .clipShape(Circle())
            }
            .padding(16)
        }
        .background(.secondaryYellow)
        .cornerRadius(20)
    }
    
}


#Preview {
    VStack(spacing: 12) {
        ProgramCard(program: MockAcademyData.samplePrograms[0])
        ProgramCard(program: MockAcademyData.samplePrograms[1])
    }
    
}
