//
//  TeacherMockData.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//


struct TeacherMockData {
    
    static func getTeacher(by id: String) -> TeacherDetail {
        switch id {
        case "1": return aysel
        case "2": return nicat
        case "3": return sebine
        default: return aysel
        }
    }
    
    static let aysel = TeacherDetail(
        id: "1",
        name: "Aysel Heydərova",
        subject: "iOS instructor",
        photoUrl: nil,
        bio: "iOS sahəsində 5 illik təcrübəyə malik müəllim.",
        monthlyPrice: "100 AZN",
        address: "Bakı",
        phone: "+994 50 255 00 00",
        demoVideos: [
                DemoVideo(
                    id: "1",
                    title: "SwiftUI Əsasları",
                    thumbnailUrl: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=400",
                    videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                    duration: "12:30",
                    teacherName: "Aysel Heydərova",
                    teacherId: "1"
                ),
                DemoVideo(
                    id: "2",
                    title: "SwiftUI Layout",
                    thumbnailUrl: "https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=400",
                    videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                    duration: "08:45",
                    teacherName: "Aysel Heydərova",
                    teacherId: "1"
                )
            ]
    )
    
    static let nicat = TeacherDetail(
        id: "2",
        name: "Nicat Əliyev",
        subject: "Python instructor",
        photoUrl: nil,
        bio: "Data Science və Python üzrə mütəxəssis.",
        monthlyPrice: "80 AZN",
        address: "Bakı",
        phone: "+994 50 300 00 00",
        demoVideos: []
    )
    
    static let sebine = TeacherDetail(
        id: "3",
        name: "Səbinə Məmmədova",
        subject: "Flutter instructor",
        photoUrl: nil,
        bio: "Flutter ilə mobil tətbiq hazırlamada təcrübəli.",
        monthlyPrice: "90 AZN",
        address: "Bakı",
        phone: "+994 50 400 00 00",
        demoVideos: [
                DemoVideo(
                    id: "1",
                    title: "SwiftUI Əsasları",
                    thumbnailUrl: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=400",
                    videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                    duration: "12:30",
                    teacherName: "Səbinə Məmmədova",
                    teacherId: "1"
                ),
                DemoVideo(
                    id: "2",
                    title: "SwiftUI Layout",
                    thumbnailUrl: "https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=400",
                    videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                    duration: "08:45",
                    teacherName: "Səbinə Məmmədova",
                    teacherId: "1"
                )
            ]
    )
}
