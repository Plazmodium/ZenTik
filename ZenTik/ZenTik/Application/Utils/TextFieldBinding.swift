//
//  TextFieldBinding.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/28.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import Foundation
import UIKit

class TextFieldBinding: UITextField {
    
    var textChanged:(String) -> () = { _ in }
    
    func bind(callback:@escaping (String) -> ()){
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField:UITextField){
        self.textChanged(textField.text ?? "Text is here")
    }
}
