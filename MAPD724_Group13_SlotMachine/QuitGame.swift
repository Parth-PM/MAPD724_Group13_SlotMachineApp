//
//  SwiftUIView.swift
//
//  Created by Parth Maru on 2023-02-05.
//
//Authors: Parth Maru (301209761)
//         Khushboo Kodwani (301273818)
//         Deep Mehta (301212407)
//

import SwiftUI

struct QuitGame: View {
    var body: some View {
        ZStack{
        Image("Jackpot1").resizable().ignoresSafeArea()
            Text("Thanks for playing!!").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
        }
    }
}

struct QuitGame_Previews: PreviewProvider {
    static var previews: some View {
        QuitGame().previewInterfaceOrientation(.landscapeLeft)
    }
}
