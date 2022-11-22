//
//  DiceMultiplayerView.swift
//  Liar Dice Game
//
//  Created by Victor Gunderson on 11/2/22.
//

import SwiftUI
import AVFoundation

struct DiceMultiplayerView: View {
    @State private var total1 = 0
    @State private var total2 = 0
    @State private var player: AVAudioPlayer!
    @State private var turns = ""
    @State var gameIsRunning = true
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("\(turns)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    DiceView(score: $total1, gameRunning: $gameIsRunning)
                    
                    Spacer()
                    DiceView(score: $total2, gameRunning: $gameIsRunning)
                }
                .padding()
                // winning or losing
                if total1 >= 20 {
                    Text("Player 1 Won!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    NavigationLink(destination: ContentView()) {
                        Label("Back To Main Menu", systemImage: "arrowtriangle.right.fill")
                            .font(Font.custom("impact", size: 20))
                    }
                } else if total1 <= -15  {
                    Text("Player 1 Lost!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    NavigationLink(destination: ContentView()) {
                        Label("Back To Main Menu", systemImage: "arrowtriangle.right.fill")
                            .font(Font.custom("impact", size: 20))
                    }
                }
                Spacer()
                HStack {
                    Text("PLAYER 1")
                        .font(Font.custom("impact", size: 20))
                    Spacer()
                        .frame(width: 134)
                    Text("PLAYER 2")
                        .font(Font.custom("impact", size: 20))
                        .padding()
                }
                HStack {
                    Text("\(total1)")
                        .font(Font.custom("impact", size: 20))
                    Spacer()
                        .frame(width: 225)
                    Text("\(total2)")
                        .font(Font.custom("impact", size: 20))
                }
            }
            if total2 >= 20 {
                Text("Player 2 Won!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                NavigationLink(destination: ContentView()) {
                    Label("Back To Main Menu", systemImage: "arrowtriangle.right.fill")
                        .font(Font.custom("impact", size: 20))
                }
            }
            else if total2 <= -15  {
                Text("Player 2 Lost!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                NavigationLink(destination: ContentView()) {
                    Label("Back To Main Menu", systemImage: "arrowtriangle.right.fill")
                        .font(Font.custom("impact", size: 20))
                }
            }
        }
    }
}

struct DiceMultiplayerView_Previews: PreviewProvider {
    static var previews: some View {
        DiceMultiplayerView()
    }
}
