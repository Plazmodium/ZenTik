//
//  CryptoDetailViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/06/29.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

class CryptoDetailViewController: UIViewController {

    //MARK: IBOUTLETS & PROPERTIES
    @IBOutlet weak var coinNameLBL: UILabel!
    
    var cryptoName :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coinNameLBL.text = cryptoName
    }
    
    @IBAction func CloseBtn(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
