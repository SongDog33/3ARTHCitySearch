//
//  JSONHandler.swift
//  3ARTHCitySearch
//
//  Created by Joel Myers on 6/8/18.
//  Copyright © 2018 4Backbase. All rights reserved.
//

import Foundation

final class JSONHandler {
    static let defaultHandler = JSONHandler()
    private static let filePath = "cities"
    
    private var jsonFile : [[String : Any]]?
    private init() {
        self.readJson()
    }
    
    private func readJson() {
        do {
            if let file = Bundle.main.url(forResource: JSONHandler.filePath, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [[String: Any]] {
                    // json is an array of dictionaries
                    jsonFile = object
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func parseCityArray () -> [[String : Any]] {
        
//        let arr : [Any] = jsonFile!["movies"] as! [[String : Any]]
        var parsedArr: [[String : Any]] = []
        if let arr = jsonFile {
            for city in arr {
                //Create City Objects with Location Variables
            }
            return parsedArr
        } else {
            return parsedArr
            
        }
    }
    
}
