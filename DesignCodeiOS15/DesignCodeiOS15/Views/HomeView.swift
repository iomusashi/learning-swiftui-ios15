//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/13/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var tabState: TabState
    
    @State private var hasScrolled = true
    @State private var show = false
    @State private var showStatusBar = true
    @State private var selectedCourseId = UUID()
    
    @Namespace var namespace
}

// MARK: Body

extension HomeView {
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
                
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 300), spacing: 20)
                    ],
                    spacing: 20
                ) {
                    if !show {
                        courseCards
                    } else {
                        placeholderCards
                    }
                }
                .padding(.horizontal, 20)
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
                cardDetailView
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCardSpring) {
                showStatusBar = newValue ? false : true
            }
        }
    }
}

// MARK: Internal Subviews

extension HomeView {
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
            ForEach(Course.fakeFeaturedCourses) { course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItemView(course: course)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
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
    
    var courseCards: some View {
        ForEach(Course.fakeCourses) { course in
            CourseItemView(
                show: $show,
                namespace: namespace,
                course: course
            )
            .onTapGesture {
                withAnimation(.openCardSpring) {
                    show.toggle()
                    tabState.showDetail.toggle()
                    selectedCourseId = course.id
                }
            }
        }
    }
    
    var placeholderCards: some View {
        ForEach(Course.fakeCourses) { _ in
            Rectangle()
                .fill(.white)
                .frame(height: 300)
                .cornerRadius(30)
                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                .opacity(0.3)
                .padding(.horizontal, 30)
        }
    }
    
    var cardDetailView: some View {
        ForEach(Course.fakeCourses) { course in
            if course.id == selectedCourseId {
                CourseView(
                    show: $show,
                    namespace: namespace,
                    course: course
                )
                .zIndex(1)
                .transition(
                    .asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))
                    )
                )
            }
        }
    }
}

// MARK: Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
            HomeView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(TabState())
    }
}
