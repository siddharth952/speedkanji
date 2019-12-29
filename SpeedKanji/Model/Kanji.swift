//
//  Kanji.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/27/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI
import SwiftyJSON



struct Kanji:Identifiable {
  let id = UUID() // sys. gen. unique ID as we do not care of the actual value of it.
  let kunyomi:String
  let meaning:String
  let romaji: String
  let imageURL : String
  let videoURL: String
  let examples: [JSON]
  var reaction: String = ""
    
}


