//
//  DataManager.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 1/10/20.
//  Copyright © 2020 Siddharth sen. All rights reserved.
//

import SwiftUI

struct DataManager: View{
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    
    
    var body: some View{
        
        Text("Hello World")
        .onTapGesture {
            let str = "Test Message"
            let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")

            do {
                try str.write(to: url, atomically: true, encoding: .utf8)
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
}





#if DEBUG
struct DataManager_Previews : PreviewProvider {
    static var previews: some View {
        DataManager()
    }
}
#endif
