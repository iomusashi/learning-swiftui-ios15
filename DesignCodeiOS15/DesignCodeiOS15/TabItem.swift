//
//  Tab.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/12/22.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var text: String
    var icon: String
}

extension TabItem {
    static let contentBarItems = [
        TabItem(text: "Learn Now", icon: "house"),
        TabItem(text: "Explore", icon: "magnifyingglass"),
        TabItem(text: "Notifications", icon: "bell"),
        TabItem(text: "Library", icon: "rectangle.stack"),
    ]
}
