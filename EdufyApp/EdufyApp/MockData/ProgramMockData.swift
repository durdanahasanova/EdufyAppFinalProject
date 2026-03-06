import Foundation

struct ProgramMockData {
    
    // iOS Proqrami

        static let iOSProgram = ProgramDetail(
            id: 1,
            name: "Mobil Tərtibatçılıq iOS",
            about: "iOS Mobil Tərtibatçılıq proqramı karyeranızı yüksəltmək və bu sahənin peşəkar mütəxəssisi olmaq istəyənlər üçün xüsusi hazırlanıb.",
            duration: "4 ay",
            groupSize: "15-20 nəfər",
            modules: [
                ProgramModule(id: 1, name: "Modul 1: Fundamentals", lessons: [
                    Lesson(id: 1, name: "Introduction to Swift"),
                    Lesson(id: 2, name: "Xcode Setup & Playgrounds"),
                    Lesson(id: 3, name: "Swift Basics")
                ]),
                ProgramModule(id: 2, name: "Modul 2: UI Development with UIKit", lessons: [
                    Lesson(id: 4, name: "UIKit Architecture"),
                    Lesson(id: 5, name: "Auto Layout & Constraints")
                ]),
                ProgramModule(id: 3, name: "Modul 3: SwiftUI & Animations", lessons: [
                    Lesson(id: 6, name: "SwiftUI Fundamentals")
                ]),
                ProgramModule(id: 4, name: "Modul 4: Application Architecture", lessons: [])
            ],
            instructor: Instructor(
                id: 1,
                fullName: "Aysel Heyderova",
                specialization: "iOS instructor",
                bio: "ABB Bank-da Senior iOS developer olaraq fəaliyyət göstərir. 5 ildən artıq təcrübəyə malikdir.",
                photoUrl: nil,
                linkedInUrl: "https://linkedin.com"
            )
        )
    
    
}
