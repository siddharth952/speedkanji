//
//  Modifiers.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/23/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    var width:CGFloat = 360
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(.headline, design: .rounded))
            .padding()
            .frame(minWidth: 0, maxWidth: width, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.mainColor))
            .padding(.bottom)
        
    }
}

extension View {
    func customButton(width:CGFloat) -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier(width: width))
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36, design: .rounded))
    }
}

extension Color {
    static var mainColor = Color(UIColor.systemRed)
}

