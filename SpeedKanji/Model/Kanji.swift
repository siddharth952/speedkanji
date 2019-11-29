//
//  Kanji.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/27/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI



struct Kanji {
  let id = UUID() // sys. gen. unique ID as we do not care of the actual value of it.
  let onyomi: String
  let kunyomi:String
  let meaning:String
  let hint: String
  let name: String
  let imageName: String
  let examples: String
  var reaction: String
    
}

extension Kanji: Identifiable{}


let kanjiN5 = [
    "一","二","三","四","五","六","七","八","九","十","百","千","万","父","母","友","女","男","人","子","日","月","火","水","木","金","土","本","休","語","年","午","前","後","時","間","毎","先","今","何","上","下","左","右","北","南","東","西","外","名","高","小","中","大","長","半","分","学","校","生","山","川","白","天","雨","電","気","車","国","円","話","聞","食","読","来","書","見","行","出","入","会"
   
]
