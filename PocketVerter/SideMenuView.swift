//
//  SideMenuView.swift
//  PocketVerter
//
//  Created by Samuel Hernandez Vicera on 6/25/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    @State private var allConversionTypes: [String] = ["Temperature", "Time", "Money", "Distance", "Weight", "Height"]
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack(){
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                HStack {
                    VStack(alignment: .center , spacing: 20) {
                        Text("Search for your conversion here")
                            .foregroundStyle(.white)
                            .padding()
                        
                        SearchBarView(searchText: $searchText)
                            .padding()
                        
                        List {
                            ForEach(allConversionTypes.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }, id: \.self) { conversion in
                                Text(conversion)
                                    .foregroundStyle(.white)
                                    .listRowBackground(Color.darkBackground)
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .listStyle(.insetGrouped)
                       
                      
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: 330, alignment: .leading)
                    .background(.darkBackground)
                    Spacer()
                }
                
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: isShowing)
       
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true))
}
