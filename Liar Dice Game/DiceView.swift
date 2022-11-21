//
//  DiceView.swift
//  Liar Dice Game
//
//  Created by Leo Lai on 10/31/22.
//

import SwiftUI
import AVFoundation

struct DiceView: View {
    @Binding public var score:Int
    @State public var randomValue = 0
    @State public var rotation = 0.0
    @State public var odd = [1,3,5]
    @State public var even = [2,4,6]
    @Binding public var gameRunning: Bool
    @State public var gameOver = false
    @State private var player: AVAudioPlayer!
    var body: some View {
        VStack{
            
            Image("pips \(randomValue)")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .rotationEffect(.degrees(rotation))
                .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
        }
        
        .onTapGesture {
            if (-15 < score && score < 20){
                if gameRunning {
                    chooseRandom(times: 6)
                    playSounds(sound: "DiceRoll")
                    withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                        rotation += 360
                    }
                    gameRunning = false
                    
                }
            }
        }
    }
        func chooseRandom(times:Int) {
            if times > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    randomValue = Int.random(in: 1...6)
                    if(times == 1) {
                        if odd.contains(where: {$0 == randomValue}) {
                            score -= randomValue / 2
                        }
                        else {
                            score += randomValue / 2
                        }
                    }
                    
                    
                    chooseRandom(times: times - 1)
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
    

    struct otherView: View {
        @State var figures = 0
        @State var gameIsRunning = true
        
        var body: some View {
            VStack {
                Text("\(figures)")
                DiceView(score: $figures, gameRunning: $gameIsRunning)
            }
        }
    }
    
    struct DiceView_Previews: PreviewProvider {
        static var previews: some View {
            otherView()
        }
    }
    
    
