//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 5/26/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("Logo 2")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10.0)
                .padding(9)
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                )
                .vibrantStrokeStyle(cornerRadius: 16.0)
            Text("SwiftUI for iOS 15")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(
                    .linearGradient(
                        colors: [.primary, .primary.opacity(0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            Text(/*@START_MENU_TOKEN@*/"20 sections - 3 hours"/*@END_MENU_TOKEN@*/.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text(/*@START_MENU_TOKEN@*/"Build an iOS app for iOS 15 with custom layouts, animations and ..."/*@END_MENU_TOKEN@*/)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.secondary)
        }
        .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .vibrantStrokeStyle()
        .padding(.horizontal, 20)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
        .overlay(
            Image("Illustration 5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
