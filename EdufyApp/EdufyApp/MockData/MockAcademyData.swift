//
//  MockAcademyData.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import Foundation

struct MockAcademyData {
    
    static let sampleAcademy = AcademyDetail(
        id: 1,
        name: "ABB\nTech Academy",
        logoUrl: "https://ui-avatars.com/api/?name=ABB+Academy&size=200&background=FF8B94&color=fff",
        about: """
        ABB Tech Akademiyası proqramlaşdırmanın əsas istiqamətləri üzrə intensiv \
        "bootcamp" proqramları təşkil edir. Bu proqram çərçivəsində namizədlər \
        Akademiyaya 4 seçim mərhələsini keçməklə qəbul olunur, burada IT sahəsində \
        bilik və bacarıqlar qazanırlar.
        Akademiyanın missiyası Azərbaycanın informasiya texnologiyaları bazarının \
        beynəlxalq standartlara və gələcəyin texnoloji çağırışlarına uyğunlaşmaq və \
        yeni nəsil peşəkarlara bu perspektivli əmək bazarında yeni imkanların \
        yaradılmasına dəstək verməkdir.
        """,
        programs: samplePrograms,
        totalApplications: 9000,
        totalStudents: 1600,
        graduationRate: 68
    )
    
    static let samplePrograms: [Program] = [
        Program(
            id: 1,
            name: "Marketing Automation &\nReporting",
            duration: "4 ay",
            instructorPhotoUrl: "examplephoto",
            status: 1
        ),
        Program(
            id: 2,
            name: "iOS Developer",
            duration: "4 ay",
            instructorPhotoUrl: "examplephoto",
            status: 1
        ),
        Program(
            id: 3,
            name: "Backend Java Developer",
            duration: "4 ay",
            instructorPhotoUrl: "examplephoto",
            status: 2
        ),
        Program(
            id: 4,
            name: "Backend Java Developer",
            duration: "4 ay",
            instructorPhotoUrl: "person",
            status: 2
        ),
        Program(
            id: 5,
            name: "Backend Java Developer",
            duration: "4 ay",
            instructorPhotoUrl: "person",
            status: 2
        )
    ]
}
