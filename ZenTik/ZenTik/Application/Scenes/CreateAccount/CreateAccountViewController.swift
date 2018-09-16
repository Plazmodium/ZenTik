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
        
        textInputControl()
    }
    
    private func textInputControl(){
        
        guard let username = userNameTextField.text, username.count > 1 else {

            alertController(message: "Please make sure you have entered a username.")
            return
        }
        
        guard let email = emailTextField.text, email.count > 1, email.contains("@") else {

            alertController(message: "Please make sure you have entered a valid email address.")
            return
        }
        
        guard let password = passwordTextField.text, password.count >= 6 else{

            alertController(message: "Please make sure you have entered a six or more character password.")
            return
        }
        
        loadingIndicator()
        
        self.viewModel = CreateAccountViewModel.init(userName: username, email: email, password: password, createTheUser: self.createUser, completionHandler: { result in
            
            if(result == email){
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
