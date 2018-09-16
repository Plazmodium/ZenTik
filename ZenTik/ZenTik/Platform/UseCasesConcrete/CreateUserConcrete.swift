//
//  CreateUserConcrete.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/09/16.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation
import FirebaseAuth

final class CreateUserConcrete: CreateUserUseCase{
    
    
    func createTheUser(userName:String, email: String, password: String, completionHandler: @escaping (UserModel) -> Void) {
        
        FirebaseHelperClass.CreateUser(userName: userName, email: email, password: password) { (results) in
            
            switch results{
                
            case .success(let theUser):
                
                let user = UserModel.init(user: theUser)
                
                completionHandler(user)
                
            case .failure(let error):
                
                let user = UserModel.init(error: error)
                
                completionHandler(user)
            }
        }
    }
}

