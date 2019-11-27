//
//  SimpleProgressBar.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/27/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

struct SimpleProgressBar: View {
    
    @State var currentProgress: CGFloat = 0.0
    @State var wordsleft:Int = 0
    
    
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Words left:\(String(wordsleft))")
                    .fontWeight(.heavy)
            }
            ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.gray)
                        .frame(width:300,height: 20)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.green)
                        .frame(width:300*currentProgress,height:20)
                    
                    Button(action: {self.startLoading()}) {
                        Text("Start timer")
                    }
                    
                    
            }
        }
            
        
    }

    
    
    
    func startLoading() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            withAnimation() {
                self.currentProgress += 0.01
                if self.currentProgress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}







struct SimpleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        SimpleProgressBar()
    }
}

