//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 5/26/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") private var selectedTab: Tab = .home
    @EnvironmentObject var tabState: TabState
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
               Text("Explore")
                    .font(.title)
                    .foregroundColor(.primary)
            case .notifications:
               Text("Notifications")
                    .font(.title)
                    .foregroundColor(.primary)
            case .library:
                AccountView()
            }
            TabBar()
                .offset(y: tabState.showDetail ? 200 : 0)
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(TabState())
    }
}
