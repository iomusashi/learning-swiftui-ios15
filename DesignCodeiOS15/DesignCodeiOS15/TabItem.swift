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
    var tab: Tab
}

extension TabItem {
    static let contentBarItems = [
        TabItem(text: "Learn Now", icon: "house", tab: .home),
        TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore),
        TabItem(text: "Notifications", icon: "bell", tab: .notifications),
        TabItem(text: "Library", icon: "rectangle.stack", tab: .library)
    ]
}
