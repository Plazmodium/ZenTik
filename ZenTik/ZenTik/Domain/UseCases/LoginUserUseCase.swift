//
//  LoginUserUseCase.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/09/18.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

protocol LoginUserUseCase {
    
    associatedtype T
    
    func loginUser(email:String,password:String, completionHandler: @escaping (T) -> Void)
}
