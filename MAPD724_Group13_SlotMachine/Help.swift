//
//  Help.swift
//  MAPD724_Group13_SlotmachinApp.swift
//
//  Date: 2023-02-19
//
//Authors: Parth Maru (301209761)
//         Khushboo Kodwani (301273818)
//         Deep Mehta (301212407)
//

import SwiftUI

struct Help: View {
    var body: some View {
        ZStack{
            
        Image("Jackpot1").resizable().ignoresSafeArea()
            
            VStack{
                Text("HELP").font(.title).fontWeight(.bold).foregroundColor(Color(red: 8/255, green: 98/255, blue: 32/255)).multilineTextAlignment(.center).padding(5).padding(.horizontal, 10).background(Color.yellow).cornerRadius(20)
            
            
            VStack(alignment: .leading){
                
                Text("  ")
                
                // Game Instructions
                
                Text("- Bet your coins and click on START button to spin!").font(.title).fontWeight(.bold).foregroundColor(.white)
               Text("")
                
                // Winning Combinations
                Text("- Winning Combinations:").font(.title).fontWeight(.bold).foregroundColor(.yellow)
                HStack{
                    
                Image("slot1").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Image("slot1").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Image("slot1").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Text(" : bet * 10")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                }
                
                HStack{
                    
                Image("slot2").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Image("slot2").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Image("slot2").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Text(" : bet * 10")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                }
                
                HStack{
                    
                Image("slot3").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Image("slot3").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Image("slot3").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                    Text(" : bet * 10")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                }
                
    
            }
        }
    }
}
}

struct Help_Previews: PreviewProvider {
    static var previews: some View {
        Help().previewInterfaceOrientation(.landscapeLeft)
    }
}
