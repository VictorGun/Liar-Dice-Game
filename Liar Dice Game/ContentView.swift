//
//  ContentView.swift
//  Liar Dice Game
//
//  Created by Victor Gunderson on 10/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                Text("Liars Dice Game:" )
                    .padding(1)
                    .font(Font.custom("impact", size: 40))
                    .preferredColorScheme(.dark)
                Spacer()
                NavigationLink(destination: DiceSingleplayerView()) {
                    Label("SINGLE PLAYER", systemImage: "arrowtriangle.right.fill")
                        .font(Font.custom("impact", size: 20))
                }
                .padding(50)
                NavigationLink(destination: DiceMultiplayerView()) {
                    Label("MULTIPLAYER", systemImage: "arrowtriangle.right.fill")
                        .font(Font.custom("impact", size: 20))
                }
                .padding(50)
                NavigationLink(destination: InstructionsView()) {
                    Text("Instructions")
                }.padding(20).font(Font.custom("impact", size: 20))
               Spacer()
            }
        }
      // GeometryReader { geo in
            //ZStack {
               // Image("DiceBackground")
                   // .resizable()
                   // .scaledToFit()
                    //.edgesIgnoringSafeArea(.all)
                    //.frame(width: geo.size.width, height: geo.size.height,alignment: .center)
                   // .opacity(1.0)
         //   }
      //  }
        // This is for inserting a background. Not sure about how to put it in background without removing the text already there
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
