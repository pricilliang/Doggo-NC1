//
//  ContentView.swift
//  DoggoApp_HarusnyaBener
//
//  Created by Pricillia Ang on 28/04/22.
//

import SwiftUI


struct ContentView: View {
    
var body: some View {
    NavigationView {
            ZStack{
                ZStack {}
                    .frame( maxWidth: .infinity, maxHeight: .infinity)
                    .background(Image("Background").resizable())
                                .ignoresSafeArea()
                VStack (spacing: 10){
                    Text("Holla!\nWelcome to DOGGO")
                        .font(.custom("Ding Dong", size:35))
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .foregroundColor(.white)
                    Text("We're here to help remind you to feed your Little Buddy!\nGukguk!")
                        .font(.custom("Ding Dong", size:20))
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 80)
                        .foregroundColor(.white)
                        .padding(30)
                    
                    Spacer () .frame(height: 0)
                    NavigationLink  (destination: MainView(), label: {

                        Capsule()
                            .fill(Color.white)
                            .frame(width: 200, height: 50)
                            .overlay(Text("START")
                                .font(.custom("Ding Dong", size:20))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.brown))
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
