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
            HStack {
                Text("\(total)")
                    Spacer()
                Text("\(total)")
            }
                
            
        }
    }
}

struct DiceSingleplayerView_Previews: PreviewProvider {
    static var previews: some View {
        DiceSingleplayerView()
    }
}
