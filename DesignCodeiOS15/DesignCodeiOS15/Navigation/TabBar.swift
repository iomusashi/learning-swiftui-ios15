//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/12/22.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") private var selectedTab: Tab = .home
    @State private var selectedTabColor: Color = .teal
    @State private var tabItemWidth: CGFloat = .zero
    
    var body: some View {
        GeometryReader { proxy in
            let hasHomeIndicator = proxy.safeAreaInsets.bottom > 20
            HStack {
                buttons
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: hasHomeIndicator ? 88 : 62, alignment: .top)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(
                    cornerRadius: hasHomeIndicator ? 34 : 0,
                    style: .continuous
                )
            )
            .background(
                background
            )
            .overlay(
                overlay
            )
            .vibrantStrokeStyle(cornerRadius: hasHomeIndicator ? 34 : 0)
            .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        }
    }
    
    var buttons: some View {
        ForEach(TabItem.contentBarItems) { item in
            Button {
                withAnimation(
                    .spring(response: 0.3, dampingFraction: 0.7)
                ) {
                    selectedTab = item.tab
                    selectedTabColor = item.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(
                        key: TabPreferenceKey.self,
                        value: proxy.size.width
                    )
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
    var background: some View {
        HStack {
            if selectedTab == .library { Spacer() }
            if selectedTab == .explore { Spacer() }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Circle()
                .fill(selectedTabColor)
                .frame(width: tabItemWidth)
            if selectedTab == .home { Spacer() }
            if selectedTab == .notifications { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
    
    var overlay: some View {
        HStack {
            if selectedTab == .library { Spacer() }
            if selectedTab == .explore { Spacer() }
            if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(selectedTabColor)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab == .home { Spacer() }
            if selectedTab == .notifications { Spacer() }
            if selectedTab == .explore {
                Spacer()
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
