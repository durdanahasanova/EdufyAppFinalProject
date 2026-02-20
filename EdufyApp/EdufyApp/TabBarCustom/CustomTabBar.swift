//
//  CustomTabBar.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

enum TabItem: CaseIterable {
    case home, explore, favorites, profile
    
    var title: String {
        switch self {
        case .home: return "Ana səhifə"
        case .explore: return "Kəşfet"
        case .favorites: return "Sevimlilər"
        case .profile: return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "tab_home"
        case .explore: return "tab_explore"
        case .favorites: return "tab_fav"
        case .profile: return "tab_profile"
        }
    }
}

struct CustomTabBar: View {
    var body: some View {
        Rectangle()
            .fill(.border)
            .frame(height: 0.5)

    }
}
