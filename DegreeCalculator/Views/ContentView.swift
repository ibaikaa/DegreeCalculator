//
//  ContentView.swift
//  DegreeCalculator
//
//  Created by ibaikaa on 14/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var number: String = ""
    @State private var power: String = ""
    @State private var isIncorrectInput: Bool = false
    @State private var result: Double?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Number:")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 16)
                
                TextField("Enter the number you want to raise to a power", text: $number)
                    .textFieldStyle(.roundedBorder)
                    .font(.body)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                
                Text("Power:")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 16)
                
                TextField("Enter the power you want to raise the number to", text: $power)
                    .textFieldStyle(.roundedBorder)
                    .font(.body)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    
                    Button {
                        guard let num = Double(number), let power = Double(power)
                        else {
                            isIncorrectInput = true
                            return
                        }
                        
                        result = pow(num, power)

                    } label: {
                        Text("Count!")
                            .padding(.horizontal, 16)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .alert(isPresented: $isIncorrectInput) {
                        Alert(
                            title: Text("Error!"),
                            message: Text("Please, fill the fields correctly.")
                        )
                    }
                    .background(.blue)
                    .cornerRadius(30)
                    
                    Spacer()
                }
                .padding(.bottom, 30)
                
                if let result = result {
                    HStack {
                        Spacer()
                        Text("Result: \(result)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Spacer()
                    }
               
                }
                Spacer()
            }
            .navigationTitle("Power Calculator 🧮")
            .navigationBarTitleDisplayMode(.inline)
            .background(.orange)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .background(.yellow)
    }
}
