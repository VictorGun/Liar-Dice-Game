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
    
    //stealing the thing from the website
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
