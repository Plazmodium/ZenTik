//
//  CreateAccountViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/08/29.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit
import FirebaseAuth

class CreateAccountViewController: UIViewController {
    
    //IBOUTLETS
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createBtn: UIButton!
    
    //PROPERTIES
    var createUser = CreateUserConcrete()
    var viewModel: CreateAccountViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboards))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func createTheUser(_ sender: UIButton) {
        
        loadingIndicator()
        
        let userData = textControl()
        
        self.viewModel = CreateAccountViewModel.init(userName: userData.0, email: userData.1, password: userData.2, createTheUser: self.createUser, completionHandler: { result in
            
            if(result == userData.1){
                self.dismiss(animated: true, completion: nil)
                
                let alert = UIAlertController(title: "SUCCESS", message: "Great! Your email address \(String(describing: result)) has been successfully registered.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { handle in
                    alert.dismiss(animated: true, completion: nil)
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "viewController") as! ViewController
                    self.navigationController?.pushViewController(newViewController, animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }else{
                self.dismiss(animated: true, completion: nil)
                self.alertController(message: result)
            }
        })
    }
    
    private func textControl() -> (String,String,String){
        
        guard let username = userNameTextField.text else {
            
            alertController(message: "Please make sure you have entered all your information.")
            return ("nil","nil","nil")
        }
        
        guard let email = emailTextField.text else {
            
            alertController(message: "Please make sure you have entered all your information.")
            return ("nil","nil","nil")
        }
        
        guard let password = passwordTextField.text else {
            
            alertController(message: "Please make sure you have entered all your information.")
            return ("nil","nil","nil")
        }
        return (username,email,password)
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
