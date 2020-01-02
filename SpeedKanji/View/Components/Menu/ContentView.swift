

import SwiftUI

struct ContentView : View {
    
    @State private var isSettingsPresented = false
    @State private var action: Int? = 0
    
    
    
    private var settingButton: some View {
    Button(action: {
        self.isSettingsPresented = true
    }) {
        HStack {
            Image(systemName: "wrench").imageScale(.medium)
        }.frame(width: 30, height: 30)
    }
    }
    var body: some View {
        
        
        func generateOptions(currentKanji:Int){
            var correctOption:String
            var number:Int
            
                options.removeAll()
            
            
            //Correct options
            correctOption = network.database[currentKanji].kunyomi
            options.append(correctOption)
            
            //Random Options
            for _ in 0...2{
                number = Int.random(in: 0 ..< 70)
                options.append(network.database[number].kunyomi)
            }
            
        }
        

        let view = NavigationView {
            Group {

                
                VStack(alignment: .center) {
                    
                    drawCard(headerText: "Learn N5 Kanji", detailText: "Animatable cards with Spring, custom frame and some paddings. Also use SFSymbol for icon in the bottom button. Tap to button fo see fill style of this icon.",myColor: Color.blue)
                                  
                    drawCard(headerText: "Learn N4 Kanji", detailText: "Animatable cards with Spring, custom frame and some paddings. Also use SFSymbol for icon in the bottom button. Tap to button fo see fill style of this icon.",myColor: Color.gray)
                    
                    NavigationLink(destination: MainView(), tag: 1, selection: $action) {
                               EmptyView()
                           }

                        Spacer()
                           Text("Click for MainView")
                               .onTapGesture {
                    //perform some tasks if needed before opening Destination view
                                let number = Int.random(in: 0 ..< 70)
                                generateOptions(currentKanji: number)
                                   self.action = 1
                           }
                }
                
                
                
                
            }
            .navigationBarItems(trailing:
                HStack {
                    
                    settingButton
                }
            ).sheet(isPresented: $isSettingsPresented,
                content: { SettingsForm() })
        }

//        VStack(alignment: .center, spacing: 20){
//
//
//
//                TopStack()
//                drawCard(headerText: "Learn N5 Kanji", detailText: "Animatable cards with Spring, custom frame and some paddings. Also use SFSymbol for icon in the bottom button. Tap to button fo see fill style of this icon.",myColor: Color.blue)
//                drawCard(headerText: "Learn N4 Kanji", detailText: "Animatable cards with Spring, custom frame and some paddings. Also use SFSymbol for icon in the bottom button. Tap to button fo see fill style of this icon.",myColor: Color.gray)
//
//            }
        return navigationView(content: AnyView(view))
    }
    
    
}



private func navigationView(content: AnyView) -> some View {
    Group {
        
            NavigationView {
                content
            }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        
        }
    }


    
    struct drawCard:View {

        @State var show = false
        let headerText:String
        let detailText:String
        let myColor:Color
        
        var body: some View{
        
        VStack() {
            
                Text(headerText)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.top, show ? 30 : 20)
                    .padding(.bottom, show ? 20 : 0)
                
                Text(detailText)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .animation(.spring())
                    .cornerRadius(0)
                    .lineLimit(.none)
                
            if(show){Button(action: {}){
                Text("Continue")
                    .foregroundColor(Color(hue: 0.498, saturation: 0.609, brightness: 1.0))
                .fontWeight(.bold)
                .font(.title)
                    .cornerRadius(0)
                }
                
            }
                
                Spacer()
                
                Button(action: {
                    self.show.toggle()
                }) {
                    HStack {
                        Image(systemName: show ? "slash.circle.fill" : "slash.circle")
                            .foregroundColor(Color(hue: 0.498, saturation: 0.609, brightness: 1.0))
                            .font(Font.title.weight(.semibold))
                            .imageScale(.small)
                        Text(show ? "Collapse" : "Details") // true:false
                            .foregroundColor(Color(hue: 0.498, saturation: 0.609, brightness: 1.0))
                            .fontWeight(.bold)
                            .font(.title)
                            .cornerRadius(0)
                    }
                }
                .padding(.bottom, show ? 20 : 15)
                
            }
            .padding()
            .padding(.top, 15)
            .frame(width: show ? 350 : 290, height: show ? 420 : 260)
            .background(myColor)
            .cornerRadius(30)
            .shadow(radius: 20)
            .animation(.spring())
        }
    }

/// Top Navigation
struct TopStack: View {
   
    var body: some View {
        HStack(alignment:.center) {
                    button(for: "person.circle.fill")
                        .foregroundColor(.primary)
                    Spacer()
                    button(for: "stop.circle.fill")
                        .padding(.trailing)
                        .foregroundColor(.primary)

                    button(for: "arrow.right.circle")
                        .padding(.trailing)
                        .foregroundColor(.primary)
                }
    }
}






#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
