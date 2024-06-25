//
//  SearchBarView.swift
//  PocketVerter
//
//  Created by Samuel Hernandez Vicera on 6/25/24.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchText: String = ""
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
            TextField("",text: $searchText)
                .fontDesign(.rounded)
                .foregroundColor(.white)
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.darkBackground)
                .shadow(
                    color: Color.teal.opacity(0.65),
                    radius: 10, x:0, y: 0
                )
        )
    }
}

#Preview {
    SearchBarView()
}
