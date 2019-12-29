//
//  TitleView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/23/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//


import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Image("SpeedReview_inv") // Add your app logo here
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)

            Text("Welcome to")
                .customTitleText()

            Text("Speed Kanji N5") // Name of your app
                .customTitleText()
                .foregroundColor(.mainColor)
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
