//
//  DiceView.swift
//  Liar Dice Game
//
//  Created by Leo Lai on 10/31/22.
//

import SwiftUI

struct DiceView: View {
    @State private var randomValue = 0
    @State private var rotation = 0.0
    var body: some View {
        Image("pips \(randomValue)")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .rotationEffect(.degrees(rotation))
            .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
            .onTapGesture {
                chooseRandom(times: 6)
                withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                    rotation += 360
                }
            }
    }
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        randomValue = Int.random(in: 1...6)
                        chooseRandom(times: times - 1)
                    }
                }
        }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}


