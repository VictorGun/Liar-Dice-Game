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
    @State private var turns = 1
    @State private var turnNumber = 0
    @State var gameIsRunning = true
    var body: some View {
        
            VStack {
                Spacer()
                Text("Player \(turns)'s Turn")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text("Turn number: \(turnNumber)")
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    DiceView(score: $total1, gameRunning: $gameIsRunning)
                        .simultaneousGesture(TapGesture().onEnded {
                            if(turns != 2) {
                                turnNumber += 1
                            }
                            turns = 2
                            
                        })
                    
                    Spacer()
                    DiceView(score: $total2, gameRunning: not($gameIsRunning))
                        .simultaneousGesture(TapGesture().onEnded {
                            if(turns != 1) {
                                turnNumber += 1
                            }
                            turns = 1
                            
                        })
                }
                .padding()
                // winning or losing
                if total1 >= 20 {
                    Text("Player 1 Won!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .onAppear {
                           playSounds(sound: "Start")
                        }
                    NavigationLink(destination: ContentView()) {
                        Label("Back To Main Menu", systemImage: "arrowtriangle.right.fill")
                            .font(Font.custom("impact", size: 20))
                    }
                    
                } else if total1 <= -15  {
                    Text("Player 1 Lost!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .onAppear {
                           playSounds(sound: "Lose")
                        }
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
                    .onAppear {
                       playSounds(sound: "Start")
                    }
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
                    .onAppear {
                       playSounds(sound: "Lose")
                    }
                NavigationLink(destination: ContentView()) {
                    Label("Back To Main Menu", systemImage: "arrowtriangle.right.fill")
                        .font(Font.custom("impact", size: 20))
                }
            }
    }
    func not(_ value: Binding<Bool>) -> Binding<Bool> {
        Binding<Bool>(
            get: { !value.wrappedValue },
            set: { value.wrappedValue = !$0 }
        )
    }
    func playSounds(sound: String) {
        if let asset = NSDataAsset(name: sound){
            do {
                // Use NSDataAsset's data property to access the audio file stored in Sound.
                player = try AVAudioPlayer(data:asset.data, fileTypeHint:"wav")
                // Play the above sound file.
                player?.play()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

struct DiceMultiplayerView_Previews: PreviewProvider {
    static var previews: some View {
        DiceMultiplayerView()
    }
}
