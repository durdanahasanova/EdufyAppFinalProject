
import SwiftUI

struct TeacherCard: View {

    let teacherPhoto: String?
    let lessonPrice: Int
    let teacherName: String
    let subject: String
    var onTapDetails: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            // Image + Price
            ZStack(alignment: .bottomLeading) {
                cardImage
                    .frame(height: 140)
                    .frame(maxWidth: .infinity)
                    .clipped()

                Text("\(lessonPrice) AZN")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(.black.opacity(0.7))
                    .clipShape(Capsule())
                    .padding(12)
            }
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))

            // Teacher Name & Subject
            VStack(alignment: .leading, spacing: 6) {
                Text(teacherName)
                    .appFont(.bodyTextMdBold)
                    .foregroundStyle(.black)
                    .lineLimit(1)


                Text(subject)
                    .appFont(.textMdMedium)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
            }
            .padding(.horizontal, 4)

            // Button etrafli
            Button {
                onTapDetails?()
            } label: {
                Text("Ətraflı bax")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.35))
                    .clipShape(Capsule())
            }
            .buttonStyle(.plain)
            .padding(.top, 2)
        }
        .padding(14)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(color: .black.opacity(0.10), radius: 10, x: 0, y: 6)
    }

    @ViewBuilder
    private var cardImage: some View {
        if let teacherPhoto, let url = URL(string: teacherPhoto) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(_):
                    placeholderImage
                case .empty:
                    placeholderImage
                @unknown default:
                    placeholderImage
                }
            }
        } else {
            placeholderImage
        }
    }

    private var placeholderImage: some View {
        ZStack {
            Color.gray.opacity(0.2)
            Image(systemName: "person.fill")
                .font(.system(size: 40, weight: .semibold))
                .foregroundStyle(.gray.opacity(0.6))
        }
    }
}


//#Preview {
//    TeacherCard(teacherPhoto: "https://via.placeholder.com/150", lessonPrice: 120, teacherName: "Durdana Hasanova", subject: "IOS Developer", onTapDetails: nil)
//}
