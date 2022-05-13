//
//  ContentView.swift
//  TrafficLight
//
//  Created by Iliya Mayasov on 13.05.2022.
//

import SwiftUI

struct ContentView: View {
    private let col = 0.3
    @State private var redRound = ColorCircleView(color: .red.opacity(0.3))
    @State private var yellowRound = ColorCircleView(color: .yellow.opacity(0.3))
    @State private var greenRound = ColorCircleView(color: .green.opacity(0.3))
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                redRound
                yellowRound
                greenRound
                Spacer()
                buttonChangeColor
            }
            .padding()
        }
    }
    
    
    @State private var text = "START"
    
    private var buttonChangeColor: some View {
        Button(action: {
            text = "NEXT"
            if redRound.lightOn == false && yellowRound.lightOn == false
                && greenRound.lightOn == false {
                redRound.lightOn = true
                redRound.color = .red.opacity(1.0)
            } else if redRound.lightOn == true && yellowRound.lightOn == false {
                redRound.lightOn = false
                redRound.color = .red.opacity(0.3)
                yellowRound.lightOn = true
                yellowRound.color = .yellow.opacity(1.0)
            } else if yellowRound.lightOn == true && greenRound.lightOn == false {
                yellowRound.lightOn = false
                yellowRound.color = .yellow.opacity(0.3)
                greenRound.lightOn = true
                greenRound.color = .green.opacity(1.0)
            } else {
                greenRound.lightOn = false
                greenRound.color = .green.opacity(0.3)
                redRound.lightOn = true
                redRound.color = .red.opacity(1.0)
            }
        }) {
            Text(text)
        }
        .font(.title)
        .frame(minWidth: 200, minHeight: 80)
        .background(.blue)
        .foregroundColor(.white)
        .overlay(RoundedRectangle(cornerRadius: 35)
                    .stroke(Color .white, lineWidth: 6))
        .cornerRadius(35)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
