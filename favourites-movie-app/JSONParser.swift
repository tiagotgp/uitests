//
//  JSONParser.swift
//  favourites-movie-app
//
//  Created by Goncalves Pereira, Tiago on 10/08/2017.
//  Copyright © 2017 Goncalves Pereira, Tiago. All rights reserved.
//

import Foundation

class JSONParser {
    static func parse (data: Data) -> [String: AnyObject]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options) as? [String: AnyObject]
            
            return json!
        } catch (let parseError){
            print("There was an error parsing the JSON: \"\(parseError.localizedDescription)\"")
        }
        return nil
    }
}
