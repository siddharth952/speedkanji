//
//  MainView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/24/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

struct MainView: View {
     var body: some View {
            VStack(alignment: .center, spacing: 20) {
                TopStack()
                    .padding(.horizontal)
                
                CardView()
                    .padding(.horizontal, 10)
                BottomStack()
            }
            .padding(.bottom, 15)
        }
    }





struct TopStack: View {
    var body: some View {
        HStack(alignment: .top) {
                    button(for: "person")
                        .padding(.leading)
                        .foregroundColor(.primary)
                        
                    Spacer()
                    button(for: "stop")
                        .foregroundColor(.primary)
                    Spacer()
                    button(for: "arrow.right.circle")
                        .padding(.trailing)
                        .foregroundColor(.primary)
                }
    }
}

struct UserImageView : View {
    var body: some View {
        Image("kanjiimg")
        .resizable()
        .scaledToFit()
            .overlay (
                Rectangle()
                    .fill (
                        LinearGradient(gradient: Gradient(colors: [.clear, .blue]),
                                       startPoint: .center, endPoint: .bottom)
                    )
                    .clipped()
            )
            .cornerRadius(10, antialiased: true)
    }
}


struct CardView : View {
    var body: some View {
        ZStack(alignment: .leading) {
            UserImageView()
            //UserInfoView()
        }
        .shadow(radius: 2)
    }
}

struct BottomStack : View {
    var body: some View {
        HStack {
            button(for: "flame")
            button(for: "flame")
            button(for: "flame")
            button(for: "flame")
            button(for: "flame")
        }
    }
}




//Helper: To create buttons based on image asset name
func button(for icon: String) -> some View {
    Button(action: {}) {
        Image(systemName:icon)
        .resizable()
            .frame(width: 32, height: 32, alignment: .center)
            
        
        
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
