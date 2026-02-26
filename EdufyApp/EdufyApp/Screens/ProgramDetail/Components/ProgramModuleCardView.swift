import SwiftUI

struct ModuleCardView: View {
    let module: ProgramModule
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            HStack {
                Text(module.title)
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
            
            //Expandable content
            if isExpanded && !module.lessons.isEmpty {
                Divider()
                    .padding(.horizontal, 16)
                
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(module.lessons) { lesson in
                        
                        Text(lesson.title)
                            .appFont(.bodyTextMdRegular)
                            .foregroundColor(.black)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            ForEach(lesson.topics, id: \.self) { topic in
                                HStack(alignment: .top, spacing: 8) {
                                    Text("•")
                                    Text(topic)
                                        .appFont(.bodyTextSmRegular)
                                }
                                .foregroundColor(.black)
                            }
                        }
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

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 12) {
            // Baglı modul
            ModuleCardView(
                module: ProgramModule(id: "1", title: "Modul 1: Fundamentals", lessons: [
                    Lesson(id: "1a", title: "Lesson 1: Introduction to Swift",
                           topics: ["Xcode setup, Playgrounds",
                                    "Swift basics: Constants, Variables",
                                    "Basic Operators"])
                ]),
                isExpanded: false,
                onTap: {}
            )
            
            // Açıq modul
            ModuleCardView(
                module: ProgramModule(id: "2", title: "Modul 2: UI development with UIKit", lessons: [
                    Lesson(id: "2a", title: "Lesson 1: UIKit Basics",
                           topics: ["UIViewController", "Auto Layout", "UITableView"])
                ]),
                isExpanded: true,
                onTap: {}
            )
            
            // Dərsi olmayan modul
            ModuleCardView(
                module: ProgramModule(id: "3", title: "Modul 3: SwiftUI", lessons: []),
                isExpanded: false,
                onTap: {}
            )
        }
        .padding(16)
    }
}
