//
//  SideMenuView.swift
//  PocketVerter
//
//  Created by Samuel Hernandez Vicera on 6/25/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
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
                    VStack(alignment: .center , spacing: 32) {
                        Text("Search for your conversion here")
                        
                        Spacer()
                    }
                    .padding()
                    .frame(minWidth: 300, alignment: .leading)
                    .background(.white)
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
