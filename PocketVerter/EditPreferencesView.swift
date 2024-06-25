//
//  EditPreferencesView.swift
//  PocketVerter
//
//  Created by Samuel Hernandez Vicera on 6/13/24.
//
import SwiftUI

struct EditPreferencesView: View {
    @State private var allConversionTypes: [String] = ["Temperature", "Time", "Money", "Distance", "Weight", "Height"]
    
    @State private var starredConversionTypes: [String] = []
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Starred Conversions")) {
                    ForEach(starredConversionTypes, id: \.self) { conversion in
                        HStack {
                            Text(conversion)
                            Spacer()
                            Button() {
                                toggleStar(for: conversion)
                            }
                        label: {
                                Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            }
                            
                        }
                    }
                }
                
                Section(header: Text("Other Conversions")) {
                    ForEach(allConversionTypes.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }, id: \.self) { conversion in
                        HStack{
                            Text(conversion)
                            Spacer()
                            Button() {
                                print("label pressed")
                                toggleStar(for: conversion)
                            }
                        label: {
                                Image(systemName: "star")
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, placement: .sidebar)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Starred Conversions")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    // function allows a user to make conversions starred in order for quicker access in another view
    private func toggleStar(for conversion: String) {
        if let index = starredConversionTypes.firstIndex(of: conversion) {
            starredConversionTypes.remove(at: index)
            allConversionTypes.append(conversion)
        } else {
            starredConversionTypes.append(conversion)
            if let index = allConversionTypes.firstIndex(of: conversion) {
                allConversionTypes.remove(at: index)
            }
        }
    }
}

#Preview {
    EditPreferencesView()
}
