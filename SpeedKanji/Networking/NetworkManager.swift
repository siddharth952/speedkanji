//
//  NetworkManager.swift
//  SpeedKanji
//
//  Created by Siddharth sen on 11/28/19.
//  Copyright © 2019 Siddharth sen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager:ObservableObject{
    
    @Published var database = [Kanji]()

    let header:HTTPHeaders = [
        "x-rapidapi-key": "ecb5a738a9mshc600324f7e92755p1fa7a1jsncfbc6c554a76"]
    
 
    
    func fetchN5(){
        print("Loading N5 Kanji Data...")
        for i in kanjiN5{
            fetchData(input_kanji: i)
        }
        
    }
    
    func printDatabase(){
        print(database)
    }
    
    func fetchData(input_kanji:String){
            
        let str = input_kanji.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    
        
        AF.request("https://kanjialive-api.p.rapidapi.com/api/public/kanji/\(str)",
               method: .get,
               headers: header).responseJSON { response in
                if (response.error == nil){
                    
                    print("Got data for \(input_kanji)")
                    
                    
                    if let kanjiResponse = response.value{
                        //print("JSON:\(kanjiResponse)")
                        
                        let kanjiJSON: JSON = JSON(kanjiResponse)
                        
                        self.database.append(Kanji(kunyomi: kanjiJSON["kanji"]["kunyomi"]["hiragana"].stringValue, meaning: kanjiJSON["kanji"]["meaning"].stringValue, romaji: kanjiJSON["kanji"]["kunyomi"]["romaji"].stringValue, imageURL: kanjiJSON["kanji"]["video"]["poster"].stringValue,videoURL: kanjiJSON["kanji"]["video"]["mp4"].stringValue,examples: kanjiJSON["examples"].arrayValue))
                        
                        
                        //print test
                       // print("Meaning: \(kanjiJSON["kanji"]["meaning"]["english"].stringValue)")
                    }
                    
                }else{
                    print(response.error)
                }
    }
    }
    
}



let kanjiN5 = [
    "一","二","三","四","五","六","七","八","九","十","百","千","万","父","母","友","女","男","人","子","日","月","火","水","木","金","土","本","休","語","年","午","前","後","時","間","毎","先","今","何","上","下","左","右","北","南","東","西","外","名","高","小","中","大","長","半","分","学","校","生","山","川","白","天","雨","電","気","車","国","円","話","聞","食","読","来","書","見","行","出","入","会"
   
]
