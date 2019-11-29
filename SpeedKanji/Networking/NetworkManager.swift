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

class NetworkManager{
    
    

    let header:HTTPHeaders = [
        "x-rapidapi-key": "ecb5a738a9mshc600324f7e92755p1fa7a1jsncfbc6c554a76"]
    
    
    func fetchData(input_kanji:String){
        let str = "月".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    
        
        AF.request("https://kanjialive-api.p.rapidapi.com/api/public/kanji/\(str)",
               method: .get,
               headers: header).responseJSON { response in
                if (response.error == nil){
                    
                    print("Got Data")
                    
                    
                    if let kanjiResponse = response.value{
                        print("JSON:\(kanjiResponse)")
                        
                        let kanjiJSON: JSON = JSON(kanjiResponse)
                        print("Meaning: \(kanjiJSON["kanji"]["meaning"]["english"].stringValue)")
                    }
                    
                }else{
                    print(response.error)
                }
    }
    }
    
}
