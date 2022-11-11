//
//  DiceView.swift
//  Liar Dice Game
//
//  Created by Leo Lai on 10/31/22.
//

import SwiftUI

struct DiceView: View {
    @Binding public var score:Int
    @State public var randomValue = 0
    @State public var rotation = 0.0
    @State public var odd = [1,3,5]
    @State public var even = [2,4,6]
    
    var body: some View {
        VStack{
            
            Image("pips \(randomValue)")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(.degrees(rotation))
                .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
        }
        
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
                if(times == 1) {
                    if odd.contains(where: {$0 == randomValue}) {
                        score -= randomValue
                    }
                    else {
                        score += randomValue
                    }
                }
                
                
                chooseRandom(times: times - 1)
            }
        }
    }
}


struct otherView: View {
    @State var figures = 12
    
    
    var body: some View {
        VStack {
            Text("\(figures)")
            DiceView(score: $figures)
        }
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        otherView()
    }
}


