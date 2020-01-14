//
//  NavigationHelper.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 1/10/20.
//  Copyright © 2020 Siddharth sen. All rights reserved.
//

import SwiftUI


struct HiddenNavigationLink<Destination : View>: View {

    public var destination:  Destination
    public var isActive: Binding<Bool>

    var body: some View {

        NavigationLink(destination: self.destination, isActive: self.isActive)
        { EmptyView() }
            .frame(width: 0, height: 0)
            .disabled(true)
            .hidden()
    }
}

struct ActivateButton<Label> : View where Label : View {

    public var activates: Binding<Bool>
    public var label: Label

    public init(activates: Binding<Bool>, @ViewBuilder label: () -> Label) {
        self.activates = activates
        self.label = label()
    }

    var body: some View {
        Button(action: { self.activates.wrappedValue = true }, label: { self.label } )
    }
}
