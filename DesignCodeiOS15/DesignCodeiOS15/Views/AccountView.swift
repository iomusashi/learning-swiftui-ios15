//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/9/22.
//

import SwiftUI

struct AccountView: View {
    @State private var isDeleted = false
    @State private var isMarkedAsDone = false
    @State private var isPinned = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .symbolRenderingMode(.palette)
                .font(.system(size: 32))
                .foregroundStyle(.blue.opacity(0.3), .blue)
                .padding()
                .background(.ultraThinMaterial, in: Circle())
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 0)
                        .scaleEffect(0.6)
                )
            Text("@username")
                .font(.title)
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("PH")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink { HomeView() } label: {
                Label("Settings", systemImage: "gear")
                    .imageScale(.large)
            }
            NavigationLink { Text("Billing") } label: {
                Label("Billing", systemImage: "creditcard")
                    .imageScale(.large)
            }
            NavigationLink { Text("Help") } label: {
                Label("Help", systemImage: "questionmark")
                    .imageScale(.large)
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://example.org")!) {
                    HStack {
                        Label {
                            if isMarkedAsDone {
                                Text("Website")
                                    .strikethrough()
                            } else {
                                Text("Website")
                            }
                        } icon: { Image(systemName: "house") }
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        isDeleted = true
                    } label: {
                        Label("Archive", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        isMarkedAsDone.toggle()
                    } label: {
                        Label("Mark as Done", systemImage: "checkmark")
                    }
                    .tint(.green)
                }
            }
            Link(destination: URL(string: "https://youtube.com")!) {
                HStack {
                    Label("Youtube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .accentColor(.primary)
    }
    
    var pinButton: some View {
        Button {
            isPinned.toggle()
        } label: {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPinned ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
