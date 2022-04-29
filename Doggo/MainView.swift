//
//  MainView.swift
//  DoggoApp_HarusnyaBener
//
//  Created by Pricillia Ang on 28/04/22.
//

import SwiftUI

struct MainView: View {
    @State var count = 0;
    @State var active = 0;
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
    
    var body: some View {
        VStack{
            TitleText()
                .font(.custom("Ding Dong", size:35))
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 5)
                .foregroundColor(.brown)
                .padding(30)
            Image (self.active <= self.count && self.active <= 2 ? "Lapar" : "Kenyang")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 275.0, height: 275.0, alignment: .center)
                .clipped()
            
            Spacer () .frame (height: 0)
            HStack (spacing: 35){
                Button(action: {
                    self.count = 0;
                }, label: {
                    Image (self.count == 0 ? "MakananSelected" : "Makanan")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.count == 0 ? 130.0 : 65.0, height: self.count == 0 ? 130.0 : 65.0, alignment: .center)
                        .clipped()
                    
                })
                Button(action: {
                    self.count = 1;
                }, label: {
                    Image (self.count == 1 ? "SnackSelected" : "Snack")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.count == 1 ? 130.0 : 65.0, height: self.count == 1 ? 130.0 : 65.0, alignment: .center)
                        .clipped()
                    
                })
                Button(action: {
                    self.count = 2;
                }, label: {
                    Image (self.count >= 2 ? "MakananSelected" : "Makanan")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: self.count >= 2 ? 130.0 : 65.0, height: self.count >= 2 ? 130.0 : 65.0, alignment: .center)
                        .clipped()
                    
                })
                
            }
            
            Spacer() .frame(height: 0)
            
            DescriptionText()
                .font(.custom("Ding Dong", size:20))
                .multilineTextAlignment(.center)
                .frame(width: 300, height: self.active == 3 && self.count >= 2 ? 150 : 90)
                .foregroundColor(.brown)
//                .padding(0)
            
            ImageDescription()
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65.0, height: 65.0, alignment: .center)
                .clipped()
            if (self.count == 0 || self.count >= 2)
            {
                Text("Use 250 milliliters cup")
                    .font(.custom("Ding Dong", size:10))
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 5)
                    .foregroundColor(.brown)
                    .padding(0)
            }
            
            Spacer () .frame(height: 30)
            Button(action: {
                if (self.count < 3){
                    self.count = self.count + 1;
                }
                
                if (self.active < self.count){
                    self.active = self.count;
                }
                
            }, label: {
                if (self.active < 3 && self.count == self.active){
                    Capsule()
                        .fill(Color.brown)
                        .frame(width: 200, height: 50)
                        .overlay(Text("DONE")
                            .font(.custom("Ding Dong", size:20))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white))
                }
                else{
                    Spacer()
                        .frame(width: 200, height: 50)
                }
            })
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
    
    func TitleText() -> Text{
        var title = "";
        if (self.count == 0){
            title = "Time for breakfast";
        }
        else if (self.count == 1){
            title = "Time for snack";
        }
        else {
            title = "Time for dinner";
        }
        return Text(title);
    }
    
    func DescriptionText() -> Text{
        var description = "";
        if (self.active <= self.count && self.active < 3){
            if (self.count == 0){
                description = "Breakfast time at 8 A.M\n\nGive them a quarter cup of Dog Food";
            }
            else if (self.count == 1){
                description = "Snack time at 4 P.M\n\ngive them their favorite snack while playing or training them!";
            }
            else {
                description = "Dinner time at 8 P.M\n\ngive them three-quarter cup of Dog Food";
            }
        }
        else{
            description = "Horay! You already fed your dog!\n\n";
            if (self.count == 0){
                description += "Don’t forget Snack time at 4 P.M";
            }
            else if (self.count == 1){
                description += "Don’t forget Dinner time at 8 P.M";
            }
            else {
                description = "Wooho! your dog has had enough for today!\n\nDon't forget to have breakfast time,\ntomorrow at 8 A.M";
            }
        }
        return Text(description);
    }
    
    func ImageDescription() -> Image{
        var fileName = "";
        if (self.count == 0){
            fileName = "Cup";
        }
        else if (self.count == 1){
            fileName = "Snack2";
        }
        else {
            fileName = "Cup2";
        }
        return Image(fileName);
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
