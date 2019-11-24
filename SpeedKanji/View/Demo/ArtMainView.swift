//
//  MainView.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/24/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//
import SwiftUI



struct ArtMainView: View {
    //let s = ["Sta","LBTA","Test"]
    //Artwork is not hashable change \.self to \.title
    //MainView struct is immutable @State property wrapper able to assign a value to anArtworkProperty
    @State var artworks = artData
    
    
    //@State: owned by View @State var allocates persistent storage, change triggers update to View
    @State private var hideVisited = false
    var showArt: [Artwork]{
        hideVisited ? artworks.filter{$0.reaction == ""} : artworks
    }
    
    
    
    var body: some View {
        
        NavigationView{
            List(showArt/*,id:\.id*/){ artwork in
                //Text(s)
                NavigationLink(destination: ArtDetailView(artwork: artwork)){
                    Text("\(artwork.reaction) \(artwork.title)").contextMenu{
                        Button("Love it:❤️"){
                            self.setReaction("💕", for: artwork)
                        }
                        Button("Thoughtful:🙏"){
                            self.setReaction("🙏", for: artwork)
                        }
                        Button("Wow!!:🌟"){
                            self.setReaction("🌟", for: artwork)
                        }
                    }
                }
                }.navigationBarTitle("Artworks").navigationBarItems(trailing: Toggle(isOn: $hideVisited, label: {Text("Hide Visited")}))
        }
        
    }
    //Helper method
    private func setReaction(_ reaction:String, for item: Artwork){
        if let index = self.artworks.firstIndex(where: {$0.id == item.id}){
            artworks[index].reaction = reaction
        }
        
    }
}

struct ArtMainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
