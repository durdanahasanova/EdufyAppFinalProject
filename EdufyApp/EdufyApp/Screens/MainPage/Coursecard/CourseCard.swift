import SwiftUI

struct CourseCard: View {

    let course: Academy
    let backgroundColor: Color

    var body: some View {
        ZStack(alignment: .topTrailing) {

            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(backgroundColor)

            Image("shapesCard")
                .resizable()
                .scaledToFit()
                .frame(width: 170, height: 170)
                .opacity(0.4)

            HStack(alignment: .top) {

                VStack(alignment: .leading, spacing: 16) {

                    logoView
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            )
                        )

                    Text(course.name)
                        .multilineTextAlignment(.leading)
                        .appFont(.titleSmBold)
                        .foregroundColor(.black)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .frame(maxWidth: 160, alignment: .leading)
                }

                Spacer()

                Text("\(course.programCount) courses")
                    .appFont(.captionMdMedium)
                    .foregroundColor(.whiteHigh)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blackHigh)
                    .clipShape(Capsule())
            }
            .padding(16)
        }
        .frame(height: 200)
    }

    @ViewBuilder
    private var logoView: some View {
        if let url = URL(string: course.logoUrl) {

            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                default:
                    Image(systemName: "person.fill")
                }
            }

        } else {
            Image(systemName: "person.fill")
        }
    }
}
