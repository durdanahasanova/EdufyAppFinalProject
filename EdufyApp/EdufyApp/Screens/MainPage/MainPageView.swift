import SwiftUI


struct MainPageView: View {

    @StateObject private var viewModel = MainPageViewModel()
    //@State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                    .onTapGesture {
                        hideKeyboard()
                    }

                ScrollView {

                    VStack(alignment: .leading, spacing: 28) {

                        Text("Salam \n\(viewModel.userName)!")
                            .appFont(.titleLSemibold)
                            .foregroundStyle(.whiteHigh)

                        //MARK: - Search
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.whiteHigh)

                            TextField(
                                "Kurs və ya müəllim axtar...",
                                text: $viewModel.searchText
                            )
                            .foregroundColor(.whiteHigh)
                            .autocorrectionDisabled()

                            if !viewModel.searchText.isEmpty {
                                Button {
                                    viewModel.searchText = ""
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.whiteHigh)
                                }
                            }
                        }
                        .padding(14)
                        .background(.graySecondary)
                        .cornerRadius(32)

                        //MARK: -Kurslar
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Kurslar")
                                .appFont(.titleSmBold)
                                .foregroundStyle(.whiteHigh)

                            CourseGridView(searchText: viewModel.searchText)
                        }

                        //MARK: -Muellimler
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Müəllimlər")
                                .appFont(.titleSmBold)
                                .foregroundStyle(.whiteHigh)
                            TeacherGridView(searchText: viewModel.searchText)
                        }
                    }
                    .onTapGesture {
                        hideKeyboard()
                    }

                }
                .padding()

            }
        }
        .task {
            await viewModel.fetchUserData()
        }
    }

}

#Preview {
    MainPageView()
}
