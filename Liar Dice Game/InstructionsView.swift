//
//  InstructionsView.swift
//  Liar Dice Game
//
//  Created by Victor Gunderson on 11/2/22.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("HOW TO PLAY/RULES")
                .font(Font.custom("impact", size: 50))
            Text("""
• Roll the dice to try to get a even or odd number

• If the score is equal to 25, then you win!

• If the score is equal to -15, then you lose :(

• If the dice lands on a even pip it will give you points, if the dice lands on a odd pip it will take away points.

(NUMBERS ON THE PIPS ARE DIVDED BY 2 SO THE GAME ISNT AS EASY... Ex: IF THE DICE LANDS ON 6 PIPS, THEN YOU GET 3 POINTS... 6/2 = 3)


• In multiplayer, choose your own dice (EITHER P1 or P2) and start rolling. The other player shouldnt be able to roll the dice when the player is going.

Multiplayer win/lose/score is the same as single player

""") .font(Font.custom("impact", size: 18))
                .padding(5)
            Spacer()
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}
