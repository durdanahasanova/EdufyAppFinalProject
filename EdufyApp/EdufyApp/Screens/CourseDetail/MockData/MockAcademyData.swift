//
//  MockAcademyData.swift
//  EdufyApp
//
//  Created by Durdana on 18.02.26.
//

import Foundation

struct MockAcademyData {
    
    static let sampleAcademy = AcademyDetail(
        id: "1",
        name: "ABB\nTech Academy",
        logoName: "abb_logo",
        aboutText: """
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
        applicationCount: "9000+",
        studentCount: "1600+",
        graduatePercentage: "68%"
    )
    
    static let samplePrograms: [Program] = [
        Program(
            id: "p1",
            title: "Marketing Automation &\nReporting",
            duration: "4 ay",
            imageName: "program_thumbnail",
            status: .active
        ),
        Program(
            id: "p2",
            title: "iOS Developer",
            duration: "4 ay",
            imageName: "program_thumbnail",
            status: .active
        ),
        Program(
            id: "p3",
            title: "Backend Java Developer",
            duration: "4 ay",
            imageName: "program_thumbnail",
            status: .active
        ),
        Program(
            id: "p4",
            title: "Backend Java Developer",
            duration: "4 ay",
            imageName: "program_thumbnail",
            status: .active
        ),
        Program(
            id: "p5",
            title: "Backend Java Developer",
            duration: "4 ay",
            imageName: "program_thumbnail",
            status: .active
        )
    ]
}
