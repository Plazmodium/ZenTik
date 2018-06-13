//
//  ViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainViewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewModel.getTheAssets(apiKey: "71B66932-911E-42E3-BC37-862D30F51883")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

