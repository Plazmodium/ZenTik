//
//  CreateUserUseCase.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/09/16.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation

protocol CreateUserUseCase {
    
    associatedtype T
    
    func createTheUser(userName:String, email:String, password:String, completionHandler: @escaping (T) -> Void)
}
