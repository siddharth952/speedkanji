//
//  BarView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/23/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

struct BarView:View{
    
    var value:CGFloat
    var day_text:String
    
    var body:some View{
        
        VStack{
           ZStack(alignment: .bottom){
               Capsule().frame(width: 30, height: 200)
                   .foregroundColor(Color(#colorLiteral(red: 0.2855904102, green: 0.7915002108, blue: 0.6359320879, alpha: 1)))
               Capsule().frame(width: 30, height: value)
                   .foregroundColor(.purple)
           }
           Text(day_text)
        }
    }

}


struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(value: 150,day_text: "Test")
    }
}
