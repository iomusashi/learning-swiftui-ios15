//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/13/22.
//

import SwiftUI

struct HomeView: View {
    @State private var hasScrolled = true
    @State var show = false
    
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                featuredTabView
                Text("Courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                if !show {
                    CourseItemView(
                        show: $show,
                        namespace: namespace
                    )
                    .onTapGesture {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            show.toggle()
                        }
                    }
                }
            }
            .coordinateSpace(name: "scrollView")
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 70)
            }
            .overlay(
                NavigationBar(
                    title: "Featured",
                    hasScrolled: $hasScrolled
                )
            )
            
            if show {
                CourseView(
                    show: $show,
                    namespace: namespace
                )
            }
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
        .onPreferenceChange(
            ScrollViewPreferenceKey.self,
            perform: { value in
                withAnimation(.easeInOut) {
                    hasScrolled = value < 0
                }
            }
        )
    }
    
    var featuredTabView: some View {
        TabView {
            ForEach(Course.fakeData) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItemView(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(
                            .degrees(minX / -10),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX / 40))
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        )
                }
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
        Group {
            HomeView()
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}
