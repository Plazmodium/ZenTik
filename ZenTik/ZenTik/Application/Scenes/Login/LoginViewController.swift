//
//  LoginViewController.swift
//  ZenTik
//
//  Created by Gabor Racz on 2018/08/29.
//  Copyright © 2018 Wodwo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //IBOUTLETS
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    
    //PROPERTIES
    var loginUser = LoginUserConcrete()
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboards))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func loginUser(_ sender: UIButton) {
        
        textInputControl()
    }
    
    private func textInputControl(){
        
        guard let email = emailTextView.text, email.count > 1, email.contains("@") else {
            
            alertController(message: "Please make sure you have entered a valid email address.")
            return
        }
        
        guard let password = passwordTextView.text, password.count >= 6 else{
            
            alertController(message: "Please make sure you have entered a six or more character password.")
            return
        }
        
        loadingIndicator()
        
        self.viewModel = LoginViewModel(email: email, password: password, loginUser: self.loginUser, completionHandler: { (result) in
            
            if(result == email){
                self.dismiss(animated: true, completion: nil)
                
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "viewController") as! ViewController
                self.navigationController?.pushViewController(newViewController, animated: true)
                
            }else{
                self.dismiss(animated: true, completion: nil)
                self.alertController(message: "\(result) Please try again.")
            }
        })
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
