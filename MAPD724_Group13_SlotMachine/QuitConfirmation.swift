//
//  QuitConfirmation.swift
//
//  Created by Parth Maru on 2023-02-05.
//
//Authors: Parth Maru (301209761)
//         Khushboo Kodwani (301273818)
//         Deep Mehta (301212407)
//

import SwiftUI

struct QuitConfirmation: View {
    var body: some View {
        NavigationView{
        ZStack{
        Image("Jackpot1").resizable().ignoresSafeArea()
            VStack{
            Text("Are you sure you want to quit the game?").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                Text(" ")
                Text(" ")
                HStack{
                    NavigationLink(destination: QuitGame())
                    {
                        Text("YES").font(.largeTitle).fontWeight(.bold).foregroundColor(Color(red: 8/255, green: 98/255, blue: 32/255)).padding(10).padding(.horizontal, 20).background(Color.yellow).cornerRadius(30)
                    }
                    Text("      ")
                    NavigationLink(destination: ContentView())
                    {
                        Text("NO").font(.largeTitle).fontWeight(.bold).foregroundColor(Color(red: 8/255, green: 98/255, blue: 32/255)).padding(10).padding(.horizontal, 20).background(Color.yellow).cornerRadius(30)
                    }
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct QuitConfirmation_Previews: PreviewProvider {
    static var previews: some View {
        QuitConfirmation().previewInterfaceOrientation(.landscapeLeft)
    }
}
