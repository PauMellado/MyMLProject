//
//  JsonHelper.swift
//  ML Challenge
//
//  Created by Paulina Mellado Mateos on 01/04/25.
//

import Foundation

class JsonHelper: NSObject {
    let bundle = Bundle(for: JsonHelper.self)
    func getJsonFile(fileName: String) -> [String: Any]? {
        if let path = Bundle.main.path(forResource: "Prueba", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject> {
                        return jsonResult
                  }
              } catch {
                  print("Error")
              }
        }
       return  [:]
    }
}
