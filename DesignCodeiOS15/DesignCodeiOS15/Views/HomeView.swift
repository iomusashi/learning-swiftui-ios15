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
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                featuredTabView
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
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(
                key: ScrollViewPreferenceKey.self,
                value: proxy.frame(in: .named("scrollView")).minY
            )
        }
        .frame(height: .zero)
    }
    
    var featuredTabView: some View {
        TabView {
            ForEach(Course.fakeData) { course in
                FeaturedItemView(course: course)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
