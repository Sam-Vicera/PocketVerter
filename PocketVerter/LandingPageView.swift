//
//  LandingPageView.swift
//  PocketVerter
//
//  Created by Samuel Hernandez Vicera on 6/13/24.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        NavigationStack {
            VStack{
                
                
                VStack(alignment: .center ,spacing: 65){
                    Text("PocketVerter")
                        .foregroundStyle(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Image("Delta")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .background(Color.gray)
                }
                Spacer()
                
                VStack(spacing: 35){
                    
                    Button("Quick Access / Starred") {
                        print("Button pressed!")
                    }
                    .buttonStyle(pocketVerterButtonStyle())
                    
                    Button("Time Conversions") {
                        print("Button pressed!")
                    }
                    .buttonStyle(pocketVerterButtonStyle())
                    
                    Button("Temperature Conversions") {
                        print("Button pressed!")
                    }
                    .buttonStyle(pocketVerterButtonStyle())
                    
                    Button("Distance Conversions") {
                        print("Button pressed!")
                    }
                    .buttonStyle(pocketVerterButtonStyle())            }
             
                Spacer()
            }
            .frame(minWidth: 500, minHeight: 500)
            .background(.darkBackground)
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: EditPreferencesView()) {
                        Label("Edit user preferences", systemImage: "gear")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: EditPreferencesView()) {
                        Label("Edit user preferences", systemImage: "magnifyingglass")
                    }
                }
            }
        }
        
        
    }
        
}
extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 1/255, green: 6/255, blue: 28/255)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
struct pocketVerterButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 250)
            .padding()
            .foregroundStyle(.white)
            .background(Color(red: 0, green: 0.3, blue: 0.5))
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.4 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}


#Preview {
    LandingPageView()
}
