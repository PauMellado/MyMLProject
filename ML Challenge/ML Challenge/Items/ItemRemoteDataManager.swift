//
//  ItemRemoteDataManager.swift
//  Mercar Libre Challenge
//
//  Created by Paulina Mellado Mateos on 29/03/25.
//

import Foundation

class ItemRemoteDataManager: ItemDataManagerInputProtocol {
    
    func getItems(strFind: String, completion: @escaping (Result<ReponseMLChallenge, Error>) -> Void) {
        let strURLString: String = "https://api.mercadolibre.com/products/search?status=active&site_id=MLA&q="+strFind
        guard let url = URL(string: strURLString) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("APP_USR-5813292078341487-041122-b85e2c071364d6bffee3bfe559aef9d6-256037785", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, _, error) in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            
            do {
                let result =   try  JSONDecoder().decode(ReponseMLChallenge.self, from:data)
                completion(.success(result))
                       
                       }
        
                   
                   catch let error {
                       print("Error: \(error)")
                   }
            
        })
        task.resume()
        
        
    }
}
