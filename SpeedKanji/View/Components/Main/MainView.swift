//
//  MainView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/24/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI


//if(network.database.isEmpty)
//{for i in kanjiN5{
//    network.fetchData(input_kanji: "\(i)")
//}}

//Networking
let network = NetworkManager()
var options:[String] = []
var options_0_1:[String] = []
var options_2_3:[String] = []

struct MainView: View {
    ///State Variables
    @State var value: CGFloat = 0.0
        @State var progress:CGFloat = 0.00
        @State var wordsCount:Int = kanjiN5.count
    @State var curr_imageURL:String = ""
    

    
    
    var running:Bool = false
    
    
    

    
     var body: some View {
        
        ZStack {
            
            VStack(alignment: .center, spacing: 20) {
                
                Button(action: {print(network.database)
                }) {
                Text("[DEBUG]Print")
                }
                
               WebImage(url: URL(string: "https://media.kanjialive.com/kanji_strokes/1_1.svg"))
                .antialiased(true)
                .resizable() // Resizable like SwiftUI.Image
                .placeholder(Image("photo")) // Placeholder Image
                .scaledToFit()
                .frame(width: 200, height: 300, alignment: .center)
                
                
                
                
                    Spacer()
                    
                 
                VStack{
                    
                    
                    HStack {
                        ForEach(options_0_1,id: \.self){ option in
                        
                            
                            Button(action: {
                            self.checkAnswer(tappedAnswer: option)}) {
                            Text(option)
                                .fontWeight(.medium).foregroundColor(.white).padding()
                            
                                }.frame(width: 150).background(LinearGradient(gradient: .init(colors: [.orange,.red]), startPoint: .leading, endPoint: .trailing)).cornerRadius(20).shadow(radius: 10)
                            
                            

                        }
                    }.padding()
                    
                    HStack {
                        ForEach(options_2_3,id: \.self){ option in
                        
                            
                            Button(action: {
                            self.checkAnswer(tappedAnswer: option)}) {
                            Text(option)
                                .fontWeight(.medium).foregroundColor(.white).padding()
                            
                                }.frame(width: 150).background(LinearGradient(gradient: .init(colors: [.orange,.red]), startPoint: .leading, endPoint: .trailing)).cornerRadius(20).shadow(radius: 10)
                            
                            

                        }
                    }
                    
               
                HStack{
                    //SimpleProgressBar(currentProgress: progress, wordsleft: wordsCount)
                    VStack {
                        HStack{
                            Text("Words left:\(String(wordsCount))")
                                .fontWeight(.heavy)
                        }
                        ZStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.gray)
                                    .frame(width:300,height: 20)
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.red)
                                    .frame(width:300*self.progress+0.2,height:20)
                                
                            }
                        }

                    Button(action: {print(network.database.count)}){
                        
                        Image(systemName: running == true ? "pause.fill" : "play.fill")
                        .resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                            .padding(.top,30)
                    }

                    }
                    
                }
                }
            .padding(.bottom, 15)
        }
        }
    
    
    //MARK:Functions
       func generateOptions(currentKanji:Int){
                  ///First element of options array is always the correct option
                  var correctOption:String
                  var number:Int

                      options.removeAll()
                  
                  
                  //Correct options
                  correctOption = network.database[currentKanji].kunyomi
                  options.append(correctOption)
                  
                  //Random Options
                  for _ in 0...2{
                      number = Int.random(in: 0 ..< 70)
                      options.append(network.database[number].kunyomi)
                  }
           
        self.wordsCount -= 1
        
        ///For image
        curr_imageURL = network.database[currentKanji].imageURL
        
        options_0_1 = [options[0],options[1]]
        options_2_3 = [options[2],options[3]]
                  
              }
    
    func checkAnswer(tappedAnswer: String) {
           if(tappedAnswer == options[0]){
               print("Correct!")
               //generate for next question
            
            let number = Int.random(in: 0 ..< 70)
            generateOptions(currentKanji: number)
               
               
               //update progressBar
            self.progress += 0.012345679012346 // 1/81
           // self.wordsCount -= 1
               
               
           }
           else{
               print("Wrong!")
               //TODO:make the button un-clickable and change color to gray
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
        }
        .shadow(radius: 10)
    }
}


////protocol
//protocol OnClickCheck {
//    func checkAnswer(tappedAnswer:String)
//}

//struct gradientButton:View,OnClickCheck{
//    let btnText:String
//    var body:some View{
//        }
//    }




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
