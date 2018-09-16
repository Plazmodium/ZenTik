//
//  CreateAccountViewModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/08/29.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation
import FirebaseAuth

final public class CreateAccountViewModel{
    
    var model: UserModel!
    
    init(userName:String, email:String, password:String, createTheUser: CreateUserConcrete, completionHandler: @escaping (String) -> Void){
        
        createTheUser.createTheUser(userName: userName, email: email, password: password) { (userModel) in
            
            self.model = userModel
            
            if(userModel.userUniqueID?.isEmpty)!{
                completionHandler(self.model.error!)
            }else{
                 completionHandler(self.model.email!)
            }
        }
    }
}
