//
//  MainTabView.swift
//  EdufyApp
//
//  Created by Durdana on 17.02.26.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        TabView {
            
            MainPageView()
                .tabItem {
                    Image("tab_home")
                    Text("Ana səhifə")
                }
       
            DiscoverView()
                .tabItem {
                    Image("tab_explore")
                    Text("Kəşfet")
                }
            
            FavoritesView()
                .tabItem {
                    Image("tab_heart")
                    Text("Sevimlilər")
                }
            
            ProfileView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}
