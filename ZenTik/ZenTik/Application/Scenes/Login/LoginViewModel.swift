//
//  LoginViewModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/08/29.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

final public class LoginViewModel{
    
    var model: UserModel!
    
    init(email:String, password:String, loginUser: LoginUserConcrete, completionHandler: @escaping (String) -> Void) {
        
        loginUser.loginUser(email: email, password: password) { (user) in
            
            self.model = user
            
            if(self.model.userUniqueID?.isEmpty)!{
                completionHandler(self.model.error!)
            }else{
                completionHandler(self.model.email!)
            }
        }
    }
}
