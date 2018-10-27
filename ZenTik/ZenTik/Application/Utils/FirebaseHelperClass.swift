//
//  FirebaseHelperClass.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/08/29.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation
import FirebaseAuth


class FirebaseHelperClass{
    
    static func CreateUser<T:User>(userName:String, email: String, password:String, completionHandler:  @escaping ((Results<(T)>) -> Void)) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if(error == nil){
                guard let user = authResult?.user else { return }
                completionHandler(.success(user as! T))
            }else{
                completionHandler(.failure(error!.localizedDescription as String))
            }
        }
    }
    
    static func LoginUser<T:User>(email: String, password:String, completionHandler: @escaping(Results<T>) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if(error == nil){
                guard let user = user?.user else { return }
                completionHandler(.success(user as! T))
            }else{
                completionHandler(.failure(error!.localizedDescription as String))
            }
        }
    }
}
