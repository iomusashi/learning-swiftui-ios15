//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/13/22.
//

import SwiftUI

struct HomeView: View {
    @State private var hasScrolled = true
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Color.clear.preference(
                    key: ScrollViewPreferenceKey.self,
                    value: proxy.frame(in: .named("scrollView")).minY
                )
            }
            .frame(height: .zero)
            
            FeaturedItemView()
            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(
            ScrollViewPreferenceKey.self,
            perform: { value in
                withAnimation(.easeInOut) {
                    hasScrolled = value < 0
                }
            }
        )
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 70)
        }
        .overlay(
            NavigationBar(
                title: "Featured",
                hasScrolled: $hasScrolled
            )
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
