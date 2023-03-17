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
    
    var body: some View {
        
        VStack {
            Text("Hello, in BMI app!")
                .font(.title)
                .bold()
                .padding(20)
            
            Label("Height", systemImage: "pencil.and.ruler.fill")
                .font(.headline)
            
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
                    Text("Calculate BMI")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 3, x: 0, y: 2)
                }
                
                Spacer()
                
                Text(bmi)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 3)
                    )
            }
            
            Spacer()
            
            VStack(spacing: 20){
                Label("BODY MASS INDEX", systemImage: "figure.cooldown")
                    .font(.title)
                Text("UNDERWEIGHT <18,5")
                    .font(.title2)
                    .foregroundColor(.blue)
                Text("NORMAL 18,5 - 24,9")
                    .font(.title2)
                    .foregroundColor(.green)
                Text("OVERWEIGHT 25 - 29,9")
                    .font(.title2)
                    .foregroundColor(.yellow)
                Text("OBESE 30 - 34,9")
                    .font(.title2)
                    .foregroundColor(.orange)
                Text("EXTREMELY OBESE 35<")
                    .font(.title2)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
