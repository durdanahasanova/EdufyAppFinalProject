import SwiftUI
import Kingfisher

struct InstructorCardView: View {
    let instructor: Instructor
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            
            // Sol: mətn və LinkedIn
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(instructor.name)
                        .appFont(.titleMdSemibold)
                        .foregroundColor(.white)
                    
                    Text(instructor.bio)
                        .appFont(.bodyTextSmRegular )
                        .foregroundColor(.white)
                        .lineLimit(6)
                }
                
                Spacer(minLength: 0)
                
                // LinkedIn button
                HStack(spacing: 0) {
                    Text("Linkedin")
                        .appFont(.textLRegular)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                    
                    Button(action: {}) {
                        Image(systemName: "arrow.up.right")
                            .foregroundColor(.black)
                            .frame(width: 42, height: 42)
                            .background(Color.primaryYellow)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 4)
                }
                .background(Color.white)
                .clipShape(Capsule())
            }
            .padding(20)
            .frame(maxHeight: .infinity)
            
            // Sağ: şəkil
            instructorImage
                .frame(width: 145)
                .clipped()
        }
        .frame(height: 280)
        .background(Color.instructorCard)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        
    }
    
    @ViewBuilder
    private var instructorImage: some View {
        if let urlString = instructor.imageUrl,
           let url = URL(string: urlString) {
            KFImage(url)
                .placeholder {
                    Image("instructor_image")
                        .resizable()
                        .scaledToFill()
                }
                .resizable()
                .scaledToFill()
        } else {
            Image("instructor_image")
                .resizable()
                .scaledToFill()
        }
    }
}


#Preview {
    InstructorCardView(instructor: Instructor(id: "1",
                                              name: "Aysel Heyderova",
                                              bio: "ABB Bank-da Senior iOS developer olaraq fəaliyyət göstərir. 5 ildən artıq təcrübəyə malikdir.",
                                              imageUrl: "https://example.com/aysel.jpg",
                                              linkedinUrl: "https://linkedin.com/in/aysel"))
}
