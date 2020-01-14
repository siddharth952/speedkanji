

import SwiftUI


func generateOptions(currentKanji:Int){
       ///First element of options array is always the correct option
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
       
       ///For image
       //curr_imageURL = network.database[currentKanji].imageURL
       
       options_0_1 = [options[0],options[1]]
       options_2_3 = [options[2],options[3]]
   }


struct ContentView : View {
    @State private var isSettingsPresented = false
    @State private var activateLink: Int? = 0
    
    
    
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
        
        let view = Group {

            ScrollView {
                VStack(alignment: .center) {
                    
                    drawCard(actionDrawCard: self.$activateLink, headerText: "Learn N5 Kanji", detailText: "At the N5 level, the JLPT expects you to know about 100 kanji to pass. These kanji can change slightly between tests, but you can generally expect to see the 100 most common kanji for verbs, numbers, time, places, people, basic adjectives, and directions.",myColor: Color.blue)
                    
                    drawCard(actionDrawCard: self.$activateLink, headerText: "Learn N4 Kanji", detailText: "181 additional kanji you need to know to pass the JLPT N4 test. These are the kanji you need to learn on top of the 104 kanji required for the JLPT N5.",myColor: Color.gray)
                    
                    NavigationLink(destination: MainView(), tag: 1, selection: $activateLink) {
                        EmptyView()
                    }
                
               
                }
                .navigationBarItems(trailing:
                    HStack {
                        
                        settingButton
                    }
                ).sheet(isPresented: $isSettingsPresented,
                    content: { SettingsForm() })
            }
        }
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
    
    //Binding
    @Binding var actionDrawCard:Int?

    

    @State var show = true
    
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
                    .onTapGesture {
                        //perform some tasks if needed before opening Destination view
                        let number = Int.random(in: 0 ..< 70)
                        generateOptions(currentKanji: number)
                        self.actionDrawCard = 1
                }
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
