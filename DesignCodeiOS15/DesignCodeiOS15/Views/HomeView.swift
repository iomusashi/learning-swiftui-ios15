//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/13/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItemView()
            Color.clear.frame(height: 1000)
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 70)
        }
        .overlay(
            NavigationBar(title: "Featured")
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
