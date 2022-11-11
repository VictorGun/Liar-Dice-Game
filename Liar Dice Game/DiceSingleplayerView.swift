//
//  DiceSingleplayerView.swift
//  Liar Dice Game
//
//  Created by Leo Lai on 11/7/22.
//

import SwiftUI

struct DiceSingleplayerView: View {
    @State private var total = 0
    var body: some View {
        VStack {
            Spacer()
            HStack {
                DiceView(score: $total)
                DiceView(score: $total)
            }
            
            Spacer()
            Text("YOUR SCORE")
                .font(Font.custom("impact", size: 20))
                .padding()
            HStack {
                Text("\(total)")
                    .font(Font.custom("impact", size: 20))
            }
                
            
        }
    }
}

struct DiceSingleplayerView_Previews: PreviewProvider {
    static var previews: some View {
        DiceSingleplayerView()
    }
}
