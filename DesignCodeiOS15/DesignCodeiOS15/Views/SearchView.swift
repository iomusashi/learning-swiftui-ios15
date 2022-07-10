//
//  SearchView.swift
//  DesignCodeiOS15
//
//  Created by インヤキ on 7/10/22.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var text = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Course.fakeCourses.filter {
                    $0.title.contains(text)
                    || text.isEmpty
                }) { item in
                    Text(item.title)
                }
            }
            .searchable(
                text: $text,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: Text("SwiftUI, React, UI Design")
            )
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Done").bold()
                }
            )
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
