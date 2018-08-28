//
//  HTTPHelperClass.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/08/28.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

enum Results<Value> {
    case success(Value)
    case failure(String)
}

//static functions for creating generic network calls

class HTTPHelperClass {
    
    static let config = URLSessionConfiguration.default
    
    static func networkCallGet<T:Decodable>(urlString:String, parserType: T.Type, completionHandler: @escaping ((Results<(T)>) -> Void)) {
        
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            
            DispatchQueue.main.async {
                if let error = responseError {
                    completionHandler(.failure(error.localizedDescription))
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

                        let assets = try decoder.decode(parserType.self, from: jsonData)
                        completionHandler(.success(assets))
                        
                    } catch {
                        completionHandler(.failure(error.localizedDescription))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"])
                    completionHandler(.failure(error.localizedDescription))
                }
            }
        }
        
        task.resume()
    }
}
