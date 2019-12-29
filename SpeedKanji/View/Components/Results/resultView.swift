//
//  resultView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/27/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.


import SwiftUI

struct ResultView: View {
    
    //State variable
    @State var pickerSelectedItem = 0
    @State var timeSelected : [[CGFloat]] = [
         [78 ,189 ,  32 , 66 ,148 ,108 ,155],
        [108 ,101 ,131 ,112 ,199 ,134 , 82],
         [45 ,  59 , 76 ,  89 , 59 ,141 ,124]
    ]
    
    var body: some View {
        
            VStack{
                Text("Calory Intake")
                    .font(.system(size:34))
                    .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")){
                    Text("Week").tag(0)
                    Text("Month").tag(1)
                    Text("Year").tag(2)
                    }.pickerStyle(SegmentedPickerStyle()).padding(32)
                
           
            
            HStack(spacing: 16){
                BarView(value: timeSelected[pickerSelectedItem][0],day_text: "M")
                BarView(value: timeSelected[pickerSelectedItem][1],day_text: "T")
                BarView(value: timeSelected[pickerSelectedItem][2],day_text: "W")
                BarView(value: timeSelected[pickerSelectedItem][3],day_text: "T")
                BarView(value: timeSelected[pickerSelectedItem][4],day_text: "F")
                BarView(value: timeSelected[pickerSelectedItem][5],day_text: "S")
                BarView(value: timeSelected[pickerSelectedItem][6],day_text: "S")

            }.padding(.top,350).animation(.linear)
    }
            
        }
    
}





//LiveView
struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}

