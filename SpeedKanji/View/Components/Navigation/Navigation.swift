//
//  Navigation.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 12/29/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        TabView{
            ContentView().tabItem({
                Image(systemName: "tray").resizable()
                Text("Home")
                }).tag(0)
            ResultView().tabItem({
                Image(systemName: "list.dash").resizable()
                Text("Result")
                }).tag(1)
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
