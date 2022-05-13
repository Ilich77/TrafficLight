//
//  ColorCircleView.swift
//  TrafficLight
//
//  Created by Iliya Mayasov on 13.05.2022.
//

import SwiftUI

struct ColorCircleView: View {
    
    var color: Color
    var lightOn = false
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color .white, lineWidth: 4))
        
    }
}

struct ColorCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .red)
    }
}
