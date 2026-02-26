import Foundation

struct ProgramMockData {
    
    // iOS Proqramı
    static let iOSProgram = ProgramDetail(
        id: "1",
        name: "Mobil Tərtibatçılıq IOS",
        description: "iOS Mobil Tərtibatçılıq proqramı karyerasını yüksəltmək və ya yeni peşəkar mütəxəssisi olmaq istəyənlərdən ötru xüsusi hazırlanıb. Proqram iştirakçıları Application Architecture, SwiftUI və Multitasking ilə məşğul olacaq. Həmrəkkəb və animasiyalı UI, proqram arxitekturasının qurulması və çoxşaxəli problemlərin həlli üzrə intensiv praktik təcrübə qazanacaqlar.",
        duration: "4-5 ay",
        groupSize: "15-20 nəfər",
        logoName: "abb_logo",
        modules: [
            ProgramModule(
                id: "1",
                title: "Modul 1: Fundamentals",
                lessons: [
                    Lesson(id: "1a", title: "Introduction to Swift", topics: [
                        "Xcode setup, Playgrounds",
                        "Swift basics: Constants, Variables, Type Safety",
                        "Inference, Basic Operators"
                    ])
                ]
            ),
            ProgramModule(
                id: "2",
                title: "Modul 2: UI development with UIKit",
                lessons: [
                    Lesson(id: "2a", title: "Building User Interfaces", topics: [
                        "UIKit fundamentals",
                        "Auto Layout",
                        "Table Views and Collection Views",
                        "Navigation Patterns"
                    ])
                ]
            ),
            ProgramModule(
                id: "3",
                title: "Modul 3: Advanced Swift",
                lessons: [
                    Lesson(id: "3a", title: "Advanced Swift Concepts", topics: [
                        "Protocols and Extensions",
                        "Generics",
                        "Error Handling",
                        "Memory Management"
                    ])
                ]
            ),
            ProgramModule(
                id: "4",
                title: "Modul 4: Final Project",
                lessons: [
                    Lesson(id: "4a", title: "Final Project", topics: [
                        "Project Planning",
                        "Architecture Design",
                        "Implementation",
                        "Testing and Deployment"
                    ])
                ]
            )
        ],
        instructor: Instructor(
            id: "1",
            name: "Aysel Heyderova",
            bio: "ABB Bank-da Senior iOS developer olaraq fəaliyyət göstərir. 5 ildən artıq təcrübəyə malikdir. Mənzil Park layihəsinin qurucusudur.",
            imageUrl: nil,
            linkedinUrl: "https://linkedin.com"
        )
    )
    
    // Marketing Proqramı
    static let marketingProgram = ProgramDetail(
        id: "2",
        name: "Marketing Automation & Reporting",
        description: "Bu proqram marketinq avtomatlaşdırması və hesabat sistemləri üzrə peşəkar mütəxəssislər hazırlamaq üçün nəzərdə tutulub.",
        duration: "4 ay",
        groupSize: "15-20 nəfər",
        logoName: "abb_logo",
        modules: [
            ProgramModule(
                id: "1",
                title: "Modul 1: Marketing Fundamentals",
                lessons: [
                    Lesson(id: "1a", title: "Introduction to Marketing", topics: [
                        "Marketing Strategy",
                        "Customer Segmentation",
                        "Market Analysis"
                    ])
                ]
            ),
            ProgramModule(
                id: "2",
                title: "Modul 2: Automation Tools",
                lessons: [
                    Lesson(id: "2a", title: "Modern Marketing Tools", topics: [
                        "HubSpot CRM",
                        "Mailchimp",
                        "Google Analytics"
                    ])
                ]
            )
        ],
        instructor: Instructor(
            id: "2",
            name: "Nigar Məmmədova",
            bio: "10 illik marketing təcrübəsi olan mütəxəssis.",
            imageUrl: nil,
            linkedinUrl: "https://linkedin.com"
        )
    )
    
    // Backend Java Proqramı
    static let backendJavaProgram = ProgramDetail(
        id: "3",
        name: "Backend Java Developer",
        description: "Java Backend Development proqramı müasir enterprise həllər hazırlamaq üçün nəzərdə tutulub. Spring Boot, Microservices və Database dizaynı öyrənilir.",
        duration: "4 ay",
        groupSize: "15-20 nəfər",
        logoName: "abb_logo",
        modules: [
            ProgramModule(
                id: "1",
                title: "Modul 1: Java Fundamentals",
                lessons: [
                    Lesson(id: "1a", title: "Core Java Concepts", topics: [
                        "OOP Principles",
                        "Collections Framework",
                        "Exception Handling",
                        "Multithreading"
                    ])
                ]
            ),
            ProgramModule(
                id: "2",
                title: "Modul 2: Spring Framework",
                lessons: [
                    Lesson(id: "2a", title: "Spring Boot Development", topics: [
                        "Dependency Injection",
                        "Spring MVC",
                        "REST APIs",
                        "Spring Data JPA"
                    ])
                ]
            ),
            ProgramModule(
                id: "3",
                title: "Modul 3: Database Design",
                lessons: [
                    Lesson(id: "3a", title: "SQL and NoSQL", topics: [
                        "PostgreSQL",
                        "MongoDB",
                        "Database Optimization",
                        "Transactions"
                    ])
                ]
            )
        ],
        instructor: Instructor(
            id: "3",
            name: "Elvin Əliyev",
            bio: "Senior Backend Developer, 8 illik təcrübə. Bir neçə böyük enterprise proyektdə iştirak edib.",
            imageUrl: nil,
            linkedinUrl: "https://linkedin.com"
        )
    )
}
