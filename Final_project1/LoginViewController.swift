//
//  LoginViewController.swift
//  Final_project1
//
//  Created by 胡嘉樺 on 2021/1/7.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailLoginTextField: UITextField!
    
    @IBOutlet weak var passwordLoginTextField: UITextField!
    
    
    
    @IBAction func loginAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailLoginTextField.text!, password: passwordLoginTextField.text!) { (user, error) in
            if (error != nil) {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Error", style: .cancel, handler: nil)
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }
            Auth.auth().addStateDidChangeListener { (auth, user) in
                if user != nil {
                    self.performSegue(withIdentifier: "goactivity", sender: nil)
                }
            }
        }
    }
    
    
    
    @IBAction func signUpAction(_ sender: Any) {
        let signUpAlert = UIAlertController(title: "註冊", message: "註冊", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "儲存", style: .default) { (action) in
            let emailSignUpTextField = signUpAlert.textFields![0]
            let passwordSignUpTextField = signUpAlert.textFields![1]
            Auth.auth().createUser(withEmail: emailSignUpTextField.text!, password: passwordSignUpTextField.text!, completion: { (user, error) in
                if error == nil {
                    Auth.auth().signIn(withEmail: emailSignUpTextField.text!, password: passwordSignUpTextField.text!, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                }
            })
               }
               
               let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
               
               signUpAlert.addTextField { (emailSignUpTextField) in
                   emailSignUpTextField.placeholder = "請輸入Email"
               }
               signUpAlert.addTextField { (passwordSignUpTextField) in
                   passwordSignUpTextField.placeholder = "請輸入密碼"
                   passwordSignUpTextField.isSecureTextEntry = true
               }
               
               signUpAlert.addAction(saveAction)
               signUpAlert.addAction(cancelAction)
               
               present(signUpAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
