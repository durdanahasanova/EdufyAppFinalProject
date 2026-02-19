//
//  MainTabView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {

            MainPageView()
                .tabItem {
                    Image("tab_home")
                    Text("Ana səhifə")
                }

            Text("Kəşfet səhifəsi")
                .tabItem {
                    Image("tab_explore")
                    Text("Kəşfet")
                }

            Text("Sevimlilər səhifəsi")
                .tabItem {
                    Image("tab_fav")
                    Text("Sevimlilər")
                }

            Text("Profile səhifəsi")
                .tabItem {
                    Image("tab_profile")
                    Text("Profile")
                }
        }
    }
}
