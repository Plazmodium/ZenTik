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
    
    static func CreateUser<T>(email: String, password:String, completionHandler: @escaping(Results<T>) -> Void){
     
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            // ...
            guard let user = authResult?.user else { return }
        }
    }
    
    static func LoginUser<T>(email: String, password:String, completionHandler: @escaping(Results<T>) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            // ...
        }
        
    }
}
