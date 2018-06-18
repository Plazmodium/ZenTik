//
//  ViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/06.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        launchNetworkCall()
    }
    
    func launchNetworkCall(){
        assert(mainViewModel != nil)
        
        mainViewModel.getTheAssets(apiKey: "71B66932-911E-42E3-BC37-862D30F51883") { (data) in
            
            for i in data{
                print(i.name)
                print(i.asset_id)
                print(i.isCrypto)
                print(i.dateStarted)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

