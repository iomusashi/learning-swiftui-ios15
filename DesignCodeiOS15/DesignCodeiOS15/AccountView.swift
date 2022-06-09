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
    
    var body: some View {
        NavigationView {
            List {
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .symbolVariant(.circle.fill)
                        .symbolRenderingMode(.palette)
                        .font(.system(size: 32))
                        .foregroundStyle(.blue.opacity(0.3), .blue)
                        .padding()
                        .background(.ultraThinMaterial, in: Circle())
                        .background(
                            Image(systemName: "hexagon")
                                .symbolVariant(.fill)
                                .foregroundStyle(.blue)
                                .font(.system(size: 200))
                                .offset(x: -50, y: -100)
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
                
                Section {
                    NavigationLink { ContentView() } label: {
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
                }
                .accentColor(.primary)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
