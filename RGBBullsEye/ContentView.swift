//
//  ContentView.swift
//  RGBBullsEye
//
//  Created by 하진호 on 2022/06/27.
//

import SwiftUI

struct ContentView: View {
    @State private var game = Game()
    @State private var guess = RGB()
    @State private var showScore = false
    
    var body: some View {
        ZStack {
            VStack {
                ColorCircle(rgb: game.target)
                if !showScore {
                    Text("R: ??? G: ??? B: ???")
                        .padding()
                } else {
                    Text(game.target.intString())
                        .padding()
                }
                ColorCircle(rgb: guess)
                Text(guess.intString())
                    .padding()
                ColorSlider(value: $guess.red, trackColor: .red, sliderTitle: "R")
                ColorSlider(value: $guess.green, trackColor: .green, sliderTitle: "G")
                ColorSlider(value: $guess.blue, trackColor: .blue, sliderTitle: "B")
                
                Button("Hit Me!") {
                    showScore = true
                    game.check(guess: guess)
                }
                .alert("Your Score", isPresented: $showScore) {
                    Button("OK", role: .cancel) {
                        game.startNewRound()
                        guess = RGB()
                    }
                } message: {
                    Text(String(game.scoreRound))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    let trackColor: Color
    let sliderTitle: String
    
    var body: some View {
        Slider(value: $value, in: 0...1) {
            Text("Color Slider")
        } minimumValueLabel: {
            Text(sliderTitle + " " + "0")
        } maximumValueLabel: {
            Text("255")
        }
        .tint(trackColor)
        .padding(.horizontal)
    }
}

struct ColorCircle: View {
    let rgb: RGB
    
    var body: some View {
        Circle()
            .fill(Color(rgbStruct: rgb))
    }
}
