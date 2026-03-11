//
//  HideTabBar.swift
//  EdufyApp
//
//  Created by Durdana on 08.03.26.
//

import Combine
import SwiftUI

class TabBarVisibility: ObservableObject {
    @Published var isHidden = false
}

struct TabBarVisibilityKey: EnvironmentKey {
    static let defaultValue: TabBarVisibility? = nil
}

extension EnvironmentValues {
    var tabBarVisibility: TabBarVisibility? {
        get { self[TabBarVisibilityKey.self] }
        set { self[TabBarVisibilityKey.self] = newValue }
    }
}

