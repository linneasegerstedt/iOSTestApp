//
//  SignInViewController.swift
//  UserLoginAndRegistration
//
//  Created by Linnea Segerstedt on 13/02/2017.
//  Copyright © 2017 Linnea Segerstedt. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

  @IBOutlet weak var userEmailTextField: UITextField!
  @IBOutlet weak var userPasswordTextField: UITextField!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
  // "Segue"; reference to other VC
  

  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
  @IBAction func signUpButtonTapped(_ sender: UIButton) {
    let controller = storyboard?.instantiateViewController(withIdentifier: "SignUp")
    present(controller!, animated: true, completion: nil)
   // let signUpVC = SignUpViewController()
   // navigationController?.pushViewController(signUpVC, animated: true)
  }
  
  @IBAction func signInButtonTapped(_ sender: Any) {
    
    let userEmail = userEmailTextField.text
    let userPassword = userPasswordTextField.text
    
    let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
    let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
    
    if(userEmailStored == userEmail)
    {
      if(userPasswordStored == userPassword)
      {
        // Login is successfull
        UserDefaults.standard.set(true,forKey:"isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.dismiss(animated: true, completion:nil)
      }
    }
    
    // Check for empty fields
    if((userEmail?.isEmpty)! || (userPassword?.isEmpty)!) {
      
      // Display alert message
    
      displayAlertMessage(userMessage: "All fields are required")
    }
    
    
    // Store data (locally; normally on server)
    UserDefaults.standard.set(userEmail, forKey: "userEmail")
    UserDefaults.standard.set(userPassword, forKey: "userPassword")
    UserDefaults.standard.synchronize()
    
    // Display alert message with confirmation
    let alert = UIAlertController(title:"Alert", message: "Registration successful!", preferredStyle: UIAlertControllerStyle.alert)
    
    let okAction = UIAlertAction(title:"OK", style:UIAlertActionStyle.default) { action in self.dismiss(animated: true, completion: nil)
    }
    
    alert.addAction(okAction)
    self.present(alert, animated: true, completion: nil)
  }

  
  func displayAlertMessage(userMessage: String) {
    let alert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
    
    let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:nil);
    
    alert.addAction(okAction);
    
    self.present(alert, animated:true, completion: nil)
  }
} 
