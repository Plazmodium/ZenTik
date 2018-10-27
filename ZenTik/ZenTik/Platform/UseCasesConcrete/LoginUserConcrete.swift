//
//  LoginUserConcrete.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/09/18.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation


final class LoginUserConcrete: LoginUserUseCase{
    
    func loginUser(email: String, password: String, completionHandler: @escaping (UserModel) -> Void) {
        
        FirebaseHelperClass.LoginUser(email: email, password: password) { (result) in
            
            switch result{
                
            case .success(let userData):
                
                let user = UserModel.init(user: userData)
                completionHandler(user)
                
            case .failure(let error):
                
                let userError = UserModel.init(error: error)
                completionHandler(userError)
            }
        }
    }
}
