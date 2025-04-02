//
//  ItemRemoteDataManager.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 29/03/25.
//

import Foundation

class ItemRemoteDataManager: ItemDataManagerInputProtocol {
    
    func getItems(strFind: String, completion: @escaping (Result<ReponseMLChallenge, Error>) -> Void) {
        let strURLString: String = "https://api.mercadolibre.com/sites/MLA/search?q="+strFind
        guard let url = URL(string: strURLString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                       let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                       print(jsonResponse)
                       guard let newValue = jsonResponse as? [String:Any] else {
                           return
                           }
                       }

                   
                   catch let error {
                       print("Error: \(error)")
                   }
            
        })
        task.resume()
        
        
    }
}
