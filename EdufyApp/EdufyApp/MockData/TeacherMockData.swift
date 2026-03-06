//
//  TeacherMockData.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//


import Foundation

struct TeacherMockData {
    
    static func getTeacher(by id: Int) -> TeacherDetail {
        all.first { $0.id == id } ?? all[0]
    }
    
    static let all: [TeacherDetail] = [durdana, murad, aysel, nicat, sebine, tural]
    
    static let durdana = TeacherDetail(
        id: 1, name: "Durdana Hasanova", subject: "iOS Developer",
        photoUrl: "https://ui-avatars.com/api/?name=Durdana+Hasanova&size=200&background=random",
        bio: "5 ildən artıq iOS development sahəsində təcrübəyə malikdir. Swift və SwiftUI ilə müasir mobil tətbiqlər hazırlayır. MVVM, Clean Architecture və SOLID prinsipləri üzrə dərslər keçir.",
        monthlyPrice: "120 AZN", address: "Bakı", phone: "+994 50 255 00 00",
        demoVideos: [
            DemoVideo(id: 101, title: "SwiftUI ilə UI Qurmaq",
                      thumbnailUrl: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=400",
                      videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                      duration: "12:30", teacherName: "Durdana Hasanova", teacherId: 1),
            DemoVideo(id: 102, title: "MVVM Arxitekturası",
                      thumbnailUrl: "https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=400",
                      videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                      duration: "08:45", teacherName: "Durdana Hasanova", teacherId: 1)
        ]
    )
    
    static let murad = TeacherDetail(
        id: 2, name: "Murad Hasanov", subject: "iOS Developer",
        photoUrl: "https://ui-avatars.com/api/?name=Murad+Hasanova&size=200&background=random",
        bio: "Apple ekosistemində 4 illik təcrübəyə malik iOS developerdır. Xüsusilə Swift Concurrency, Combine framework və network layer quruluşu üzrə ixtisaslaşıb.",
        monthlyPrice: "120 AZN", address: "Bakı", phone: "+994 50 300 00 00",
        demoVideos: [
            DemoVideo(id: 201, title: "Swift Concurrency Dərsi",
                      thumbnailUrl: "https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=400",
                      videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
                      duration: "10:15", teacherName: "Murad Hasanov", teacherId: 2),
            DemoVideo(id: 202, title: "API İnteqrasiyası",
                      thumbnailUrl: "https://images.unsplash.com/photo-1627398242454-45a1465c2479?w=400",
                      videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
                      duration: "09:30", teacherName: "Murad Hasanov", teacherId: 2)
        ]
    )
    
    static let aysel = TeacherDetail(
        id: 3, name: "Aysel Heydərova", subject: "Flutter Developer",
        photoUrl: "https://ui-avatars.com/api/?name=Aysel+Heyderova&size=200&background=random",
        bio: "3 ildən artıq Flutter ilə cross-platform mobil tətbiqlər hazırlayır. Dart proqramlaşdırma dili və state management üzrə dərin biliyə malikdir.",
        monthlyPrice: "100 AZN", address: "Bakı", phone: "+994 50 400 00 00",
        demoVideos: [
            DemoVideo(id: 301, title: "Flutter Widget Sistemi",
                      thumbnailUrl: "https://images.unsplash.com/photo-1551650975-87deedd944c3?w=400",
                      videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                      duration: "15:20", teacherName: "Aysel Heydərova", teacherId: 3)
        ]
    )
    
    static let nicat = TeacherDetail(
        id: 4, name: "Nicat Əliyev", subject: "Backend Developer",
        photoUrl: "https://ui-avatars.com/api/?name=Nicat+Aliyev&size=200&background=FFE66D&color=333",
        bio: "Node.js və .NET Core ilə backend development sahəsində 4 illik təcrübəsi var. RESTful API dizaynı və verilənlər bazası idarəetməsi üzrə ixtisaslaşıb.",
        monthlyPrice: "90 AZN", address: "Bakı", phone: "+994 50 500 00 00",
        demoVideos: [
            DemoVideo(id: 401, title: "REST API Dizaynı",
                      thumbnailUrl: "https://images.unsplash.com/photo-1627398242454-45a1465c2479?w=400",
                      videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
                      duration: "11:00", teacherName: "Nicat Əliyev", teacherId: 4)
        ]
    )
    
    static let sebine = TeacherDetail(
        id: 5, name: "Ləman Quliyeva", subject: "UI/UX Designer",
        photoUrl: "https://ui-avatars.com/api/?name=Leman+Quliyeva&size=200&background=A8E6CF&color=333",
        bio: "UI/UX dizayn sahəsində 3 illik peşəkar təcrübəyə malikdir. Figma, Adobe XD və Sketch alətləri ilə istifadəçi interfeysləri hazırlayır.",
        monthlyPrice: "80 AZN", address: "Bakı", phone: "+994 50 600 00 00",
        demoVideos: [
            DemoVideo(id: 501, title: "Figma ilə UI Dizayn",
                      thumbnailUrl: "https://images.unsplash.com/photo-1561070791-2526d30994b5?w=400",
                      videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
                      duration: "06:50", teacherName: "Ləman Quliyeva", teacherId: 5)
        ]
    )
    
    static let tural = TeacherDetail(
        id: 6, name: "Tural Əhmədov", subject: "Python Developer",
        photoUrl: "https://ui-avatars.com/api/?name=Tural+Ahmedov&size=200&background=FF8B94&color=fff",
        bio: "Python ilə Data Science və Machine Learning sahəsində 5 illik təcrübəyə malikdir. Data analizi və model qurma üzrə ixtisaslaşıb.",
        monthlyPrice: "85 AZN", address: "Bakı", phone: "+994 50 700 00 00",
        demoVideos: [
            DemoVideo(id: 601, title: "Python Data Analizi",
                      thumbnailUrl: "https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=400",
                      videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
                      duration: "08:45", teacherName: "Tural Əhmədov", teacherId: 6)
        ]
    )
}
