//
//  SignUpViewController.swift
//  UserLoginAndRegistration
//
//  Created by Linnea Segerstedt on 13/02/2017.
//  Copyright © 2017 Linnea Segerstedt. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

  @IBOutlet weak var userEmailTextField: UITextField!
  @IBOutlet weak var userPasswordTextField: UITextField!
  
  
  @IBAction func signUpButtonTapped(_ sender: UIButton) {
        displayAlertMessage(userMessage: "Redirecting to login page")
  }

  
  @IBAction func alreadyButtonTapped(_ sender: UIButton) {
    let controller = storyboard?.instantiateViewController(withIdentifier: "SignIn")
    present(controller!, animated: true, completion: nil)
    sender.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
  }
  
  
  func displayAlertMessage(userMessage: String) {
    let alert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert);
    
    let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:nil);
    
    alert.addAction(okAction);
    
    self.present(alert, animated:true, completion: nil)
    
  }

  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
