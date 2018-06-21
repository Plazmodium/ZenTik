//
//  GetAssetsNetwork.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/08.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}


public class GetAssetsNetwork<T>{
    
    func getAssets(for apiKey: String,  completionHandler: @escaping (Result<([T])>) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "rest.coinapi.io"
        urlComponents.path = "/v1/assets"
        let userIdItem = URLQueryItem(name: "apikey", value: "\(apiKey)")
        urlComponents.queryItems = [userIdItem]
        guard let url = urlComponents.url
            else {
                fatalError("Could not create URL from components")
        }
//        var url = URL(string:"https://rest.coinapi.io/v1/assets/apikey=\(apiKey)")!
        print(url)
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
                        let assets = try decoder.decode([CryptoParser].self, from: jsonData)
//                        print(assets)
                        completionHandler(.success(assets as! [T]))
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
