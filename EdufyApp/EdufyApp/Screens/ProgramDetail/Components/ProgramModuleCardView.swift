import SwiftUI

struct ModuleCardView: View {
    let module: ProgramModule
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                Text(module.name)
                    .appFont(.bodyTextMdBold)
                    .foregroundColor(.blackHigh)
                
                Spacer()
                
                Image(systemName: "arrow.up.right")
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(Color.blackHigh)
                    .clipShape(Circle())
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
                    .animation(.easeInOut(duration: 0.25), value: isExpanded)
            }
            .padding(16)
            .contentShape(Rectangle())
            .onTapGesture { onTap() }
            
            if isExpanded && !module.lessons.isEmpty {
                Divider()
                    .padding(.horizontal, 16)
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(module.lessons) { lesson in
                        HStack(alignment: .top, spacing: 8) {
                            Text("•")
                            Text(lesson.name)
                                .appFont(.bodyTextSmRegular)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(16)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(Color.moduleBack)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .animation(.easeInOut(duration: 0.25), value: isExpanded)
    }
}
