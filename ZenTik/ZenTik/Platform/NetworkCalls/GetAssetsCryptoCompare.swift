//
//  GetAssetsNetwork.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/08.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

enum Results<Value> {
    case success(Value)
    case failure(Error)
}


public class GetAssetsCryptoCompare<T>{
    
    func getAssets(completionHandler: @escaping (Results<(T)>) -> Void) {
        
        let url = URL(string:"https://min-api.cryptocompare.com/data/all/coinlist")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    //                    completionHandler(error as! T)
                    completionHandler(.failure(error))
                } else if let jsonData = responseData {
                    // Now we have jsonData, Data representation of the JSON returned to us
                    // from our URLRequest...
                    
                    // Create an instance of JSONDecoder to decode the JSON data to our
                    // Codable struct
                    let decoder = JSONDecoder()
                    
                    do {
                        // We would use Post.self for JSON representing a single Post
                        // object, and [Post].self for JSON representing an array of
                        // Post objects
                        print(jsonData)
                        let assets = try decoder.decode(CryptoParserCryptoCompare.self, from: jsonData)
                        
                        completionHandler(.success(assets as! T))
                    } catch {
                        completionHandler(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"])
                    completionHandler(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}
