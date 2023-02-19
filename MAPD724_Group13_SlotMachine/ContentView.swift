//
//  ContentView.swift
//  MAPD724_Group13_SlotmachinApp.swift
//
//  Date: 2023-02-19
//
//Authors: Parth Maru (301209761)
//         Khushboo Kodwani (301273818)
//         Deep Mehta (301212407)
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Score.highScore, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Score>
    
    private var slots = ["slot1", "slot2", "slot3"]
    
    @State private var betCoins = 10
    @State private var jackpot = 100
    @State private var numbers = [1, 2, 0]
    @State private var coins = 5000
    @State private var wins = 0
    @State private var losses = 0
    @State private var winRatio: Float = 0
    @State private var highScore: Int = UserDefaults.standard.integer(forKey: "highScore")
    
    var body: some View {
        NavigationView{
        ZStack{
            
            // Background Image
            
            Image("Jackpot1").resizable().ignoresSafeArea()
            
            VStack{
               HStack{
                    VStack{
                        
                        HStack{
                            
                        // Tracking wins and losses
                            
                        Text("   Wins:").foregroundColor(Color.white)
                        Text(String(wins)).foregroundColor(Color.white)
                        }.padding(.bottom, 1.0)
                        HStack{
                        Text("Losses:").foregroundColor(Color.white)
                        Text(String(losses)).foregroundColor(Color.white)
                        }
                        .padding(.bottom, 1.0)
                        HStack{
                        Text("High Score:").foregroundColor(Color.white)
                            Text(String(self.highScore)).foregroundColor(Color.white)
                        }
                            
                     }
                    Spacer()
                   
                       // Displaying Jackpot to win
                       
                   Text("Win Jackpot").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white)
                   Text(String(self.betCoins*10) + "!!").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white)
                       
                    Spacer()
                
                    
                   HStack{
                       
                   Image("money").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                       Text(String(coins))
                           .font(.largeTitle)
                           .fontWeight(.heavy)
                           .foregroundColor(Color.white)
                   }
                       
                }
                Spacer()
                HStack{
                    
                    //Resetting the game

                    Button(action:{
                        self.wins = 0
                        self.losses = 0
                        self.winRatio = 0
                        self.coins = 5000
                        self.betCoins = 10
                    })
                    {
                        Image("reset").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                    Image(slots[numbers[0]]).resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).background(Color.white.opacity(0.9)).frame(width: 175.0, height: 175.0).cornerRadius(20)
                    Image(slots[numbers[1]]).resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).background(Color.white.opacity(0.9)).frame(width: 175.0, height: 175.0).cornerRadius(20)
                    Image(slots[numbers[2]]).resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).background(Color.white.opacity(0.9)).frame(width: 175.0, height: 175.0).cornerRadius(20)
                    Spacer()
                    
                    // Spin Button
                    
                    Button(action: {
                        
                        // Synchronizing High Score
                        
                        if self.coins > self.highScore {
                            self.highScore = self.coins
                            
                            UserDefaults.standard.set(highScore, forKey: "highScore")
                        }
                        
                        // Changing the images
                        self.numbers[0] = Int.random(in: 0...self.slots.count - 1)
                        
                        self.numbers[1] = Int.random(in: 0...self.slots.count - 1)
                        
                        self.numbers[2] = Int.random(in: 0...self.slots.count - 1)
                        
                        
                        // Checking Wins and Losses
                        
                        if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2]
                        {
                            // Won
                            self.coins += self.betCoins * 10
                            self.wins += 1
                        }
                        
                        // Lost
                        else {
                            self.coins -= self.betCoins
                            self.losses += 1
                        }
                        
                        self.winRatio = Float(self.wins * 100 / (self.losses + self.wins))
                            
                    })
                    {
                        Image("spin").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0)
                    }
                    
                }
                HStack{
                    Text("BET: ").font(.largeTitle).fontWeight(.medium).foregroundColor(Color.white)
                    
                    Image("money").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 30.0, height: 30.0)
                    
                    Text(String(betCoins)).font(.largeTitle).fontWeight(.medium).foregroundColor(.white)
                    
                    Spacer()
                    
                    // Betting options
                    
                    Button(action:{
                        self.betCoins = 5
                    })
                    {
                    Text("5").font(.title).fontWeight(.bold).foregroundColor(Color(red: 8/255, green: 98/255, blue: 32/255)).padding(5).padding(.horizontal, 10).background(Color.yellow).cornerRadius(20)
                    }
                    
                    Button(action:{
                        self.betCoins = 10
                    })
                    {
                    Text("10").font(.title).fontWeight(.bold).foregroundColor(Color(red: 8/255, green: 98/255, blue: 32/255)).padding(5).padding(.horizontal, 10).background(Color.yellow).cornerRadius(20)
                    }
                    
                    Button(action:{
                        self.betCoins = 100
                    })
                    {
                    Text("100").font(.title).fontWeight(.bold).foregroundColor(Color(red: 8/255, green: 98/255, blue: 32/255)).padding(5).padding(.horizontal, 10).background(Color.yellow).cornerRadius(20)
                    }
                    
                    Button(action:{
                        self.betCoins = 1000
                    })
                    {
                    Text("1000").font(.title).fontWeight(.bold).foregroundColor(Color(red: 8/255, green: 98/255, blue: 32/255)).padding(5).padding(.horizontal, 10).background(Color.yellow).cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    HStack{
                        
                        // Help and Support
                        
                        NavigationLink(destination: Help())
                        {
                        Image("help").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 50.0, height: 50.0)
                        }
                     Text("  ")
                    
                    // Quit Game
                    
                    NavigationLink(destination: QuitConfirmation())
                    {
                        Image("quit").resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    }
                    }
                    
                    
                }
                Spacer()
              
               
            }
        }
       
        }.navigationViewStyle(StackNavigationViewStyle()).onAppear(){
            
            // Loading the High Score
            
            if self.coins > self.highScore {
                self.highScore = self.coins
                
                UserDefaults.standard.set(highScore, forKey: "highScore")
            }
            
        }
    
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Landscape Mode
        
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
