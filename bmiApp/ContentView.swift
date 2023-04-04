//
//  ContentView.swift
//  bmiApp
//
//  Created by Myroslav Somov on 17/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing = false
    @State private var heightSlider: Float = 1
    @State private var weightSlider: Float = 100
    @State private var bmi = ""
    @State private var showResult = false
    
    var body: some View {
        
        ZStack {
            Color(.systemGray4)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                VStack {
                    Text("HELLO, in BMI app!")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                        .bold()
                        .padding(20)
                }
                .background(Color(.gray).opacity(0.4))
                .cornerRadius(15)
                .padding()
                
                
                Label("Height", systemImage: "pencil.and.ruler.fill")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Slider(value: $heightSlider, in: 0...2, step: 0.01) {
                    Text("Height")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("2")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("\(heightSlider, specifier: "%.2f") m")
                    .foregroundColor(isEditing ? .red : .blue)
                
                
                Label("Weight", systemImage: "dumbbell")
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(30)
                
                Slider(value: $weightSlider, in: 0...200, step: 1) {
                    Text("Weight")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("200")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("\(weightSlider, specifier: "%.0f") kg")
                    .foregroundColor(isEditing ? .red : .blue)
                
                VStack {
                    Button(action: {
                        let bmiValue = weightSlider / (heightSlider * heightSlider)
                        bmi = String(format: "%.1f", bmiValue)
                        
                    }) {
                        Label("Calculate BMI", systemImage: "")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.blue).opacity(0.7))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3, x: 0, y: 2)
                    }
                    
                    Spacer()
                    VStack {
                        
                        if (self.showResult) {
                            Text("Calculate")
                        }
                        Button(action: {
                            withAnimation() {
                                self.showResult.toggle()
                            }
                        }) {
                            Text(bmi)
                                .font(.title3)
                                .foregroundColor(.blue)
                                .padding(10)
                                .cornerRadius(10)
                                
                        }
                    }
                    
//                    Text(bmi)
//                        .font(.title3)
//                        .foregroundColor(.blue)
//                        .padding(10)
//                        .cornerRadius(10)

                }
                
                Spacer()
                
                VStack {
                    Label("BODY MASS INDEX", systemImage: "figure.cooldown")
                        .font(.title)
                    VStack(spacing: 10){
                        
                        Text("UNDERWEIGHT <18,5")
                            .font(.title3)
                            .foregroundColor(.blue)
                        Text("NORMAL 18,5 - 24,9")
                            .font(.title3)
                            .foregroundColor(.green)
                        Text("OVERWEIGHT 25 - 29,9")
                            .font(.title3)
                            .foregroundColor(.yellow)
                        Text("OBESE 30 - 34,9")
                            .font(.title3)
                            .foregroundColor(.orange)
                        Text("EXTREMELY OBESE 35<")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(.white).opacity(0.4))
                    .cornerRadius(15)
                                        
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
