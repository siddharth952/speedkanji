//
//  MainView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/24/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

//Networking
let network = NetworkManager()




struct MainView: View {
    //State Variables
    @State var value: CGFloat = 0.0
    
   
    

     var body: some View {
        
        ZStack {
            Color("appBackground").edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 20) {
                    TopStack()
                        .padding(.horizontal)
                    Spacer()
                    
                    CardView()
                        .padding(.horizontal, 10)
                 
                    BottomStack()
               
                    
                    SimpleProgressBar()
                }
            .padding(.bottom, 15)
        }
        }
    }


struct TopStack: View {
    var body: some View {
        HStack(alignment:.center) {
                    button(for: "person")
                        .foregroundColor(.primary)
                    Spacer()
                    button(for: "stop")
                        .padding(.trailing)
                        .foregroundColor(.primary)
                    
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
        VStack {
            HStack {
                Button(action: {network.fetchData(input_kanji: "東") }) {
                     Text("ときう")
                        .customButton(width:180)
                        .padding(.all,10)
                    .shadow(radius: 10)
                    
                }
                
                Button(action: {network.fetchN5()}) {
                     Text("ときう")
                        .customButton(width:180)
                        .padding(.all,10)
                    .shadow(radius: 10)
                    
                }
                
            }
            //HStack 2
            HStack{
                Button(action: {network.printDatabase()}) {
                     Text("ときう")
                        .customButton(width:180)
                        .padding(.all,10)
                    .shadow(radius: 10)
                    
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                     Text("ときう")
                        .customButton(width:180)
                        .padding(.all,10)
                    .shadow(radius: 10)
                    
                }
                
            }
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
