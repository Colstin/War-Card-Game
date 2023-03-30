//
//  ContentView.swift
//  WarCardGame
//
//  Created by Colstin Donaldson on 3/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    // @State signifies that its a piece of data that the view code relies upon to display the UI. Furthermore, state properties will allow you to change the data it stores.
    
    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
                    .padding()
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    
                    // Generate a random number 2 - 14
                    let playerRandom = Int.random(in: 2...14)
                    let cpuRandom = Int.random(in: 2...14)
                    
                    // update the cards
                    playerCard = "card" + String(playerRandom)
                    cpuCard = "card" + String(cpuRandom)
                    
                    // update the score
                    if playerRandom > cpuRandom {
                        playerScore += 1
                    } else if cpuRandom > playerRandom{
                        cpuScore += 1
                    } else {
                        playerScore += 0
                        cpuScore += 0
                    }
                
                    
                }, label: {
                    Image("dealbutton")
                    
                })
                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                    }
                Spacer()

                }
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .font(.title)
                .padding(.bottom, 50.0)
             

                Spacer()
                
           
            } // Main V
        } // Main Z
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
