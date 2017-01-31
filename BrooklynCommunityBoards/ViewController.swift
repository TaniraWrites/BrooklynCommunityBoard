//
//  ViewController.swift
//  BrooklynCommunityBoards
//
//  Created by Tanira Wiggins on 1/11/17.
//  Copyright © 2017 Tanira Wiggins. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginBackgroundImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerUserButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
         self.loginButton.isEnabled = false

        print("this is hitting before the enabled LoginButton")
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
    }
    
    @IBAction func emailField(_ sender: Any) {
        if (emailTextField.text?.contains("@"))! && (emailTextField.text?.contains("."))! {
            emailTextField.backgroundColor = UIColor.green
            
            } else {
                
                emailTextField.shake(count: 4, for: 1.0, withTanslation: 10)
                emailTextField.backgroundColor = UIColor.red
                self.loginButton.isEnabled = false
            }
            
            
        }
    
        
    
    
    
    @IBAction func passwordText(_ sender: Any) {
        if (passwordTextField.text?.characters.count)! >= 6 {
            passwordTextField.backgroundColor = UIColor.green
            self.loginButton.isEnabled = true
        } else {
            passwordTextField.shake(count: 4, for: 1.0, withTanslation: 10)
            passwordTextField.backgroundColor = UIColor.red
            self.loginButton.isEnabled = false 
        }
        
    }
    
    
    
    
    
    
   
    @IBAction func loginButton(_ sender: Any) {
        if self.loginButton.isEnabled == true {
            performSegue(withIdentifier: "userCreated", sender: self)
        } else {
            print("You do not have the right credentials.")
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "userMustRegister", sender: self)
    }
    
    
    


}

public extension UIView {
    
    func shake(count : Float? = nil,for duration : TimeInterval? = nil,withTanslation translation : Float? = nil) {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        animation.repeatCount = count ?? 2
        animation.duration = (duration ?? 0.5)/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.byValue = translation ?? -5
        layer.add(animation, forKey: "shake")
        
        
        
    }
    
    
    
    
}



