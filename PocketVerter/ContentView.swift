//
//  ContentView.swift
//  PocketVerter
//
//  Created by Samuel Hernandez Vicera on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var initialValue = 0
    @State private var initialUnit = "Fahrenheit"
    @State private var convertedUnit = "Fahrenheit"
    @State private var convertedValue = 0
    
    @FocusState private var amountIsFocused: Bool

    
    var tempConversion : Double {
        let initialUnit = initialUnit
        var initialValue = Double(initialValue)
        
        switch initialUnit{
        case "Fahrenheit":
            if convertedUnit == initialUnit {
                return initialValue
            }
            else if convertedUnit == "Celsius"{
                return (initialValue - 32) * (5/9)
            }
            else { return (initialValue + 459.67 ) / 1.8 } // kelvin conversion
       
        case "Celsius":
            if convertedUnit == initialUnit {
                return initialValue
            }
            else if convertedUnit == "Fahrenheit"{
                return (1.8 * initialValue) + 32
            }
            else {return (initialValue + 273.15)} // kelvin conversion
       
        case "Kelvin":
            if convertedUnit == initialUnit {
                return initialValue
            }
            else if convertedUnit == "Fahrenheit"{
                return (1.8 * (initialValue - 273) + 32)
            }
            else { return initialValue - 273.15} // celcius conversion
            
        default:
        print("Something likely went wrong")
        
            
        }
        
        return 0
        
    }
    
    let possibleUnits = ["Fahrenheit", "Celsius", "Kelvin"]
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Initial Unit", selection: $initialUnit){
                        ForEach(possibleUnits, id:\.self){
                         Text($0)
                        }
                    }
                }
                
                Section("Value You Would Like Converted"){
                    TextField("Value", value: $initialValue, format: .number)
                }
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)
                
                Section{
                    Picker("Desired Unit", selection: $convertedUnit){
                        ForEach(possibleUnits, id:\.self){
                         Text($0)
                        }
                    }
                }
                
                Section{
                    Text("Your converted value in \(convertedUnit): \(String(format: "%.2f", tempConversion))")
                }
            }
            .navigationTitle("PocketVerter")
            .toolbar(){
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
