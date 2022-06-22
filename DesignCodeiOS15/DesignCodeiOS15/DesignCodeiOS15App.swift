//
//  DesignCodeiOS15App.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 5/26/22.
//

import SwiftUI

@main
struct DesignCodeiOS15App: App {
    @StateObject var tabState = TabState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(tabState)
        }
    }
}
