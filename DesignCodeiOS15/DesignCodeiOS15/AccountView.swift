//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 6/9/22.
//

import SwiftUI

struct AccountView: View {
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
                    Label("Settings", systemImage: "gear")
                        .imageScale(.large)
                    Label("Billing", systemImage: "creditcard")
                        .imageScale(.large)
                    Label("Help", systemImage: "questionmark")
                        .imageScale(.large)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.automatic)
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
