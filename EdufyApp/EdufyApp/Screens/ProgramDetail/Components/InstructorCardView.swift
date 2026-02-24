import SwiftUI
import Kingfisher

struct InstructorCardView: View {
    let instructor: Instructor
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Image("instructorbackground")
                .resizable()
                .scaledToFill()
                .cornerRadius(16)
                .clipped()
            
            Color.black.opacity(0.7)
                .cornerRadius(16)
            
            HStack(alignment: .bottom, spacing: 4) {
                
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(instructor.name)
                            .appFont(.titleMdSemibold)
                            .foregroundColor(.white)
                    }
                    
                    Text(instructor.bio)
                        .appFont(.bodyTextSmRegular)
                        .foregroundColor(.white)
                        .lineLimit(6)
                    
                    Spacer()
                    
                    // LinkedIn button
                    HStack(spacing: 0) {
                        Text("Linkedin")
                            .appFont(.textLRegular)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 12)
                        
                        Button(action: {}) {
                            Image(systemName: "arrow.up.right")
                                .foregroundColor(.black)
                                .frame(width: 42, height: 42)
                                .background(.primaryYellow)
                                .cornerRadius(22)
                        }
                    }
                    .background(.white)
                    .cornerRadius(24)
                }
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Muellim sekli
                VStack {
                    Spacer()
                    
                    instructorView
                }
                .padding(.leading, 0)
                .padding(.leading, 20)
                .padding(.bottom, 0)
            }
        }
        .frame(height: 280)
        .cornerRadius(20)
    }
    
    
    
    @ViewBuilder
    private var instructorView: some View {
        if let url = URL(string: instructor.imageUrl!)
        {
            KFImage(url)
                .placeholder {
                    Image("instructor_image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 145, height: 250)
                    
                    //                    ProgressView()
                    //                        .frame(width: 145, height: 250)
                    
                }
                .resizable()
                .scaledToFill()
                .frame(width: 145, height: 250)
                .clipped()
        } else {
            Image(systemName: "person.fill")
                .scaledToFill()
                .frame(width: 145, height: 250)
                .clipped()
        }
        
    }
    
    //    private var instructorView: some View {
    //        if let url = URL(string: instructor.imageUrl)
    //        {
    //            AsyncImage(url: url) { phase in
    //                switch phase {
    //                case .success(let image):
    //                    image
    //                        .resizable()
    //                        .scaledToFill()
    //                        .frame(width: 145, height: 250)
    //                        .clipped()
    //                default:
    //                    Image(systemName: "person.fill")
    //                        .scaledToFill()
    //                        .frame(width: 145, height: 250)
    //                        .clipped()
    //                }
    //            }
    //
    //        } else {
    //            Image(systemName: "person.fill")
    //                .scaledToFill()
    //                .frame(width: 145, height: 250)
    //                .clipped()
    //        }
    //    }
}



#Preview {
    InstructorCardView(instructor: Instructor(id: "1",
                                              name: "Aysel Heyderova",
                                              bio: "ABB Bank-da Senior iOS developer olaraq fəaliyyət göstərir. 5 ildən artıq təcrübəyə malikdir.",
                                              imageUrl: "https://example.com/aysel.jpg",
                                              linkedinUrl: "https://linkedin.com/in/aysel"))
}
