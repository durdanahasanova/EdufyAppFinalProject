//
//  TeacherMockData.swift
//  EdufyApp
//
//  Created by Durdana on 26.02.26.
//

import Foundation

struct TeacherMockData {
    
    static let aysel = TeacherDetail(
        id: "1",
        name: "Aysel Heydərova",
        subject: "iOS instructor",
        photoUrl: nil,
        bio: "ABB Tech Akademiyası proqramlaşdırmanın əsas istiqamətləri üzrə intensiv 'bootcamp' proqramları təşkil edir. Bu proqram çərçivəsində namizədlər Akademiyaya 4 seçim mərhələsini keçməklə qəbul olunur, burada IT sahəsində bilik və bacarıqlar qazanırlar.",
        monthlyPrice: "100 AZN",
        address: "Bakı",
        phone: "+994 255 00 00",
        demoVideos: [
            DemoVideo(
                id: "1",
                title: "Swift UI Lesson",
                thumbnailUrl: nil,
                videoUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                duration: "00:21",
                teacherName: "Durdana Hasan"
            ),
            DemoVideo(
                id: "2",
                title: "Swift UI Lesson",
                thumbnailUrl: nil,
                videoUrl: "https://example.com/video2",
                duration: "00:21",
                teacherName: "Sever Jafarli"
            )
        ]
    )
}
