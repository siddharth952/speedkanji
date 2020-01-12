//
//  PopularityBadge.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 1/10/20.
//  Copyright © 2020 Siddharth sen. All rights reserved.


import SwiftUI

struct PopularityBadge : View {
    let score: Int
    
    @State var isDisplayed = false
    
    var scoreColor: Color {
        get {
            if score < 40 {
                return .red
            } else if score < 60 {
                return .orange
            } else if score < 75 {
                return .yellow
            }
            return .green
        }
    }
    
    var overlay: some View {
        ZStack {
            Circle()
                .stroke(Color.secondary, lineWidth: 8)
            Circle()
                .trim(from: 0,
                      to: isDisplayed ? CGFloat(score) / 100 : 0)
                .stroke(scoreColor, lineWidth: 2)
                .animation(Animation.interpolatingSpring(stiffness: 60, damping: 10).delay(0.1))
        }
        .rotationEffect(.degrees(-90))
        .onAppear {
            self.isDisplayed = true
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.clear)
                .frame(width: 60)
                .overlay(overlay)
                .shadow(color: scoreColor, radius: 2)
            Text("\(score)%")
                .font(Font.system(size: 10))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            }
            .frame(width: 60, height: 60)
    }
}

#if DEBUG
struct PopularityBadge_Previews : PreviewProvider {
    static var previews: some View {
        VStack {
            PopularityBadge(score: 80)
            PopularityBadge(score: 10)
            PopularityBadge(score: 30)
            PopularityBadge(score: 50)
        }
    }
}
#endif
