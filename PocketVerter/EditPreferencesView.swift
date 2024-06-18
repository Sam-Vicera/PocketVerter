//
//  EditPreferencesView.swift
//  PocketVerter
//
//  Created by Samuel Hernandez Vicera on 6/13/24.
//
import SwiftUI

struct EditPreferencesView: View {
    @State private var allConversionTypes: [String] = ["Temperature", "Time", "Money", "Distance"]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Starred Conversions")) {
                    ForEach(allConversionTypes, id: \.self) { conversion in
                        Text(conversion)
                    }
                }
                
                Section(header: Text("Other Conversions")) {
                    ForEach(allConversionTypes.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }, id: \.self) { conversion in
                        Text(conversion)
                    }
                }
            }
            .searchable(text: $searchText, placement: .sidebar)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Starred Conversions")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    EditPreferencesView()
}
