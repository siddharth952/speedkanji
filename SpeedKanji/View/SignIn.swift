//
//  SignIn.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 12/4/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

struct SignIn: View {
    
    
    //Initialize this property (Using dependency injection, passing an instance of KeyboardFollower through the initializer)
    @ObservedObject var keyboardHandler: KeyboardFollower

    init(keyboardHandler: KeyboardFollower) {
      self.keyboardHandler = keyboardHandler
    }
    
    
    @State var name:String = ""
    
//           @State var user = ""
//            @State var password = ""
            
            
            var body: some View {

                ZStack{
                    LinearGradient(gradient: .init(colors: [Color("1"),Color("2")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
                    
                    
                    VStack{
                        
                        Image("SpeedReview_inv").resizable().frame(width: 240, height: 240).padding(.bottom,15)
                        
                        
                        ModifiedContent(content:TextField("Type your name...",text:$name) , modifier: BorderedViewModifier())
                        
                            
                        
                        
                        
//                        HStack{
//                            Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
//                            TextField("Username", text: $user).padding(.leading,12).font(.system(size:20))
//                        }.padding(12)
//                        .background(Color("Color"))
//                        .cornerRadius(20)
//
//
//
//                        HStack{
//                                       Image(systemName: "lock.fill").resizable().frame(width: 20, height: 20)
//                                       SecureField("Password", text: $password).padding(.leading,12).font(.system(size:20))
//                                   }.padding(12)
//                                   .background(Color("Color"))
//                                   .cornerRadius(20)
                    }.padding(.bottom, keyboardHandler.keyboardHeight)
                        .onAppear{}
                }
                
    }
        }



struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn(keyboardHandler: KeyboardFollower())
    }
}
