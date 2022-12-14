//
//  DiceSingleplayerView.swift
//  Liar Dice Game
//
//  Created by Leo Lai on 11/7/22.
//

import SwiftUI
import AVFoundation

struct DiceSingleplayerView: View {
    @State private var total = 0
    @State private var player: AVAudioPlayer!
    @State var gameIsRunning = true
    var body: some View {
            VStack {
                Spacer()
                HStack {
                    DiceView(score: $total, gameRunning: $gameIsRunning).onChange(of: gameIsRunning) { _ in
                        gameIsRunning = true
                    }
                }
                .padding()
                
                // winning or losing
                if total >= 20 {
                    Text("You Won!")
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
                    
                } else if total <= -15 {
                    Text("You Lose!")
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
                Text("YOUR SCORE")
                    .font(Font.custom("impact", size: 20))
                    .padding()
                HStack {
                    Text("\(total)")
                        .font(Font.custom("impact", size: 20))
                }
                
                
            }
    }
    
    //stealing the thing from the simon project
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
    
    //USE OF THE PLAY SOUNDS playSounds("file(no extension)(remove brackets")
}



struct DiceSingleplayerView_Previews: PreviewProvider {
    static var previews: some View {
        DiceSingleplayerView()
    }
}
