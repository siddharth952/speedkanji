//
//  Kanji.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/24/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import SwiftUI

struct Kanji{
    let id = UUID() // unique id
    let imageName: String
    let numberOfStrokes: Int
    let englishMeaning: String
    let kun: String
    let strokeOrder: String
}

extension Kanji: Identifiable{}

let kanjiData_N5 = ["日","一 ","国","人","年","大","十","二","本","中","長","出","三","時","行","見","月","後","前","生","五 ","間","上","東 ","四 ","今","金 ","九","入","学","高","円","子","外","八 ","六","下","来","気 ","小 ","七 ","山 ","話","女 ","北","午 ","百","書 ","先","名","川 ","千 ","水","半","男","西","電","校","語 ","土 ","木 ","聞","食 ","車","何","南","万","毎","白","天","母","火","右","読","友","左","休","父","雨"]

