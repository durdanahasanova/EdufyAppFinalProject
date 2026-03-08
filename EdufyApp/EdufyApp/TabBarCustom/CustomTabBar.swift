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
        case .home:      return "Ana səhifə"
        case .explore:   return "Kəşfet"
        case .favorites: return "Sevimlilər"
        case .profile:   return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .home:      return "tab_home"
        case .explore:   return "tab_explore"
        case .favorites: return "tab_favorites"
        case .profile:   return "tab_profile"
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        VStack(spacing: 0) {
            // Separator
            Rectangle()
                .fill(Color.white.opacity(0.1))
                .frame(height: 0.5)
            
            HStack(spacing: 0) {
                ForEach(TabItem.allCases, id: \.self) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        VStack(spacing: 6) {
                            Image(tab.icon)
                                .renderingMode(.template)
                                .foregroundColor(
                                    selectedTab == tab ? .primaryYellow : .whiteDisable
                                )
                            
                            Text(tab.title)
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(
                                    selectedTab == tab ? .primaryYellow : .whiteDisable
                                )
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                    }
                }
            }
            .background(Color.background)
        }
    }
}
