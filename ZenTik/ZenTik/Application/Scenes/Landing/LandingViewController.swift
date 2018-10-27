//
//  LandingViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/09/18.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit
import FirebaseAuth

class LandingViewController: UIViewController {
    
    //PROPERTIES
    var handle: AuthStateDidChangeListenerHandle!
    
    override func viewWillAppear(_ animated: Bool) {
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
            if(auth.currentUser != nil){
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "viewController") as! ViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
