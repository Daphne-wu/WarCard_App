//
//  ContentView.swift
//  war-challenge
//
//  Created by Daphne Wu on 8/23/22.
//

import SwiftUI

struct ContentView: View {
    
    //@State allows var to be mutable inside a struct and all references to state properites with get notified of changes
    //private changes the scope to onlu be accesable in struct
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    
    var body: some View {

        ZStack {
            
            Image("background").ignoresSafeArea()
            
            VStack {
                Spacer()
                Image("logo")
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
                    
                    //generate random number betweeen 2-14
                    let playerRan = Int.random(in: 2...14)
                    let cpuRan = Int.random(in: 2...14)
                    //update cards
                    playerCard = "card" + String(playerRan)
                    cpuCard = "card" + String(cpuRan)

                    //update score
                    if playerRan > cpuRan {
                        playerScore+=1;
                    } else if playerRan < cpuRan {
                        cpuScore+=1;
                    }
                    
                }, label: {
                    Image("dealbutton")
                        
                })
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player").font(.headline).foregroundColor(Color.white).padding(.bottom, 10.0)
                        Text(String(playerScore)).font(.largeTitle).foregroundColor(Color.gray)
                    }
                    Spacer()
                    VStack {
                        Text("CPU").font(.headline).foregroundColor(Color.white).padding(.bottom, 10.0)
                        Text(String(cpuScore)).font(.largeTitle).foregroundColor(Color.gray)
                    }
                    Spacer()
                }
                Spacer()
                
                Button {
                    playerScore = 0;
                    cpuScore = 0;
                    
                } label: {
                    Text("RESET")
                        .font(.headline)
                        .foregroundColor(Color.white)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
