//
//  SearchBar.swift
//  JeffToDoApp
//
//  Created by Jeff Handy on 12/5/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchQuery: String

    var body: some View {
        TextField("Search tasks", text: $searchQuery)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}


