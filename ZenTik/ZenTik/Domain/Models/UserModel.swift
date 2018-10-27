//
//  UserModel.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/09/16.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation
import FirebaseAuth

struct UserModel{
    
    let userUniqueID:String?
    let displayName:String?
    let email:String?
    let error:String?
    
    init(user:User){
        
        self.displayName = user.displayName
        self.email = user.email
        self.userUniqueID = user.uid
        self.error = ""
    }
    
    init(error: String){
        self.displayName = ""
        self.email = ""
        self.userUniqueID = ""
        self.error = error
    }
}
