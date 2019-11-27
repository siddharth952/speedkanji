//
//  MainController.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/22/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//


import SwiftUI

struct IntroView:View{
    
    
    //State Variables
    
    var body:some View{
        
        ZStack{
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack(alignment:.center){
                
                Spacer()
                
                TitleView()
                
                Spacer()
                
                VStack(alignment: .leading) {
                    InformationDetailView(title: "Match", subTitle: "Match the gradients by moving the Red, Green and Blue sliders for the left and right colors.", imageName: "slider.horizontal.below.rectangle")

                    InformationDetailView(title: "Precise", subTitle: "More precision with the steppers to get that 100 score.", imageName: "minus.slash.plus")

                    InformationDetailView(title: "Score", subTitle: "A detailed score and comparsion of your gradient and the target gradient.", imageName: "checkmark.square")
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Button(action: {
                    
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                    
                }) {
                    Text("Continue")
                        .customButton(width:360)
                }
                .padding(.bottom, 5)
                .padding(.horizontal)
                
            }
        }
        
        
        
}
    
    
    
    
    
//    //State variable
//    @State var pickerSelectedItem = 0
//    @State var timeSelected : [[CGFloat]] = [
//         [78 ,189 ,  32 , 66 ,148 ,108 ,155],
//        [108 ,101 ,131 ,112 ,199 ,134 , 82],
//         [45 ,  59 , 76 ,  89 , 59 ,141 ,124]
//    ]
//
//    var body:some View{
//
//        ZStack{
//            Color("appBackground").edgesIgnoringSafeArea(.all)
//
//            VStack{
//
//                Text("Calory Intake")
//                    .font(.system(size:34))
//                    .fontWeight(.heavy)
//
//                Picker(selection: $pickerSelectedItem, label: Text("")){
//                    Text("Weekday").tag(0)
//                    Text("Afternoon").tag(1)
//                    Text("Evening").tag(2)
//                    }.pickerStyle(SegmentedPickerStyle()).padding(32)
//
//            }
//
//            HStack(spacing: 16){
//                BarView(value: timeSelected[pickerSelectedItem][0],day_text: "M")
//                BarView(value: timeSelected[pickerSelectedItem][1],day_text: "T")
//                BarView(value: timeSelected[pickerSelectedItem][2],day_text: "W")
//                BarView(value: timeSelected[pickerSelectedItem][3],day_text: "T")
//                BarView(value: timeSelected[pickerSelectedItem][4],day_text: "F")
//                BarView(value: timeSelected[pickerSelectedItem][5],day_text: "S")
//                BarView(value: timeSelected[pickerSelectedItem][6],day_text: "S")
//
//            }.padding(.top,350).animation(.linear)
//
//        }
//    }
    
    
}

struct MainPreview:PreviewProvider{
    static var previews: some View{
        IntroView().edgesIgnoringSafeArea(.all)
        
    }
    
}

//
//    struct ContainerView:UIViewControllerRepresentable {
//
//        func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> MainPreview.ContainerView.UIViewControllerType {
//            return MainController()
//        }
//
//        func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {
//
//        }
//    }
//}


