//
//  DiceMultiplayerView.swift
//  Liar Dice Game
//
//  Created by Victor Gunderson on 11/2/22.
//

import SwiftUI
import AVFoundation

struct DiceMultiplayerView: View {
    @State private var total = 0
    @State private var player: AVAudioPlayer!
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack {
                    DiceView(score: $total)
                    Spacer()
                    DiceView(score: $total)
                }
                .padding()
                
                // winning or losing
                if total >= 20 {
                    Text("You Won!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    NavigationLink(destination: ContentView()) {
                        Label("Back To Main Menu", systemImage: "arrowtriangle.right.fill")
                            .font(Font.custom("impact", size: 20))
                    }
                } else if total <= -15  {
                    Text("You Lose!")
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
                    Text("\(total)")
                        .font(Font.custom("impact", size: 20))
                        Spacer()
                        .frame(width: 225)
                    Text("\(total)")
                        .font(Font.custom("impact", size: 20))
                }
            }
            if total >= 2 {
                Text("You Won!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
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
