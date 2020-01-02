//
//  MainView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/24/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI


//if(network.database.isEmpty)
//{for i in kanjiN5{
//    network.fetchData(input_kanji: "\(i)")
//}}

//Networking
let network = NetworkManager()
var options:[String] = []


struct MainView: View {
    //State Variables
    @State var value: CGFloat = 0.0
    var running:Bool = false
    
    
    
    //MARK:Functions
     
    
     var body: some View {
        
        ZStack {
            
            VStack(alignment: .center, spacing: 20) {
                
                Button(action: {print(network.database[0])
                    
                    
                    
                }) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                }
                    Spacer()
                    
                 
                VStack{
                    
                    ForEach(options,id: \.self){ option in
                        HStack {
                            Text(option)
                            gradientButton(btnText: option)
                        }

                    }
                    
                }
               
                HStack{
                    SimpleProgressBar()
                    Button(action: {print(network.database.count)}){
                        
                        Image(systemName: running == true ? "pause.fill" : "play.fill")
                        .resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                            .padding(.top,30)
                        
                    }
                    
                }
                }
            .padding(.bottom, 15)
        }
        }
    }

struct UserImageView : View {
    let image:String
    var body: some View {
        Image(image)
        .resizable()
        .scaledToFit()
        .shadow(radius: 0)
    }
}


struct CardView : View {
    let image:String
    var body: some View {
        ZStack(alignment: .leading) {
            
                UserImageView(image: image)
            
            //UserInfoView()
        }
        .shadow(radius: 10)
    }
}



//struct BottomStack : View {
//    var body: some View {
//        VStack {
//            HStack {
//
//                gradientButton(btnText: "とうきょう")
//                    .padding(16)
//
//                gradientButton(btnText: "ひがし")
//                .padding(16)
//
//            }
//            //HStack 2
//            HStack{
//                gradientButton(btnText: "あいだ")
//                .padding(16)
//                gradientButton(btnText: "たか")
//                .padding(16)
//
//            }
//        }
//    }
//
//
//}


struct gradientButton:View{
    let btnText:String
    
    var body:some View{
        
            Button(action: {
                if(network.database.isEmpty)
                {for i in kanjiN5{
                    network.fetchData(input_kanji: "\(i)")
                }}
                 }) {
                Text(self.btnText)
                    .fontWeight(.medium).foregroundColor(.white).padding()
                
            }.frame(width: 150).background(LinearGradient(gradient: .init(colors: [.orange,.red]), startPoint: .leading, endPoint: .trailing)).cornerRadius(20).shadow(radius: 10)
            
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
              .previewDevice(PreviewDevice(rawValue: "iPhone XR"))
              .previewDisplayName("iPhone 11")
        
        
    }
}
