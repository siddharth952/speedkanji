//
//  IntroductionDetailView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/23/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

struct InformationDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()

            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(subTitle)
                    .foregroundColor(.secondary)
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top)
    }
}
