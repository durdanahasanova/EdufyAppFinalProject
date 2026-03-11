//
//  Extension.swift
//  EdufyApp
//
//  Created by Durdana on 10.03.26.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
