//
//  ViewController.swift
//  HR Project
//
//  Created by mac on 1/28/20.
//  Copyright © 2020 soudika. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginController: UIViewController {

//    @IBOutlet weak var LoginButtonOutlet: UIButton!
 
    @IBOutlet weak var RegistrationEmployeeBTN: Button!
    @IBOutlet weak var LoginButtonOutlet: Button!
    @IBOutlet weak var emailTF: TextFields!
    @IBOutlet weak var passwordTF: TextFields!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = navigationController!.navigationBar
        navigationBar.shadowImage = UIImage()
////        navigationBar.barTintColor = UIColor.lightGray
////        navigationBar.isTranslucent = false
////        navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: ""), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage(named: "")
        
        RegistrationEmployeeBTN.botton()
        LoginButtonOutlet.botton()
        emailTF.textfields()
        passwordTF.textfields()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBTN(_ sender: Any) {
        
        validate()
        
        guard let email = emailTF.text , !email.isEmpty else {return}
        guard let password = passwordTF.text , !password.isEmpty else {return}
        
        API.login(email:email, password:password) { (error:Error? ,success:Bool?, errormessage:String? , passwordmessage:String?) in
            
            if let error = error {
                self.Alert(message: error.localizedDescription)
                return
            }
            
            if success == true{
                if let errormessage = errormessage{
                    self.Alert(message: errormessage)
                    return
                }
                if let passwordmessage = passwordmessage{
                    self.Alert(message: passwordmessage)
                    return
                }
                print("it woooorked")
            }
        }
    }

    
    func validate() {
        
        let emaill = emailTF.text
        let passwordd = passwordTF.text
        let mycolor = UIColor.red
        emailTF.layer.borderWidth = 1
        passwordTF.layer.borderWidth = 1
        
        if emaill?.isEmpty == true && passwordd?.isEmpty == false{
            emailTF.layer.borderColor = mycolor.cgColor
            passwordTF.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else if passwordd?.isEmpty == true && emaill?.isEmpty == false{
            passwordTF.layer.borderColor = mycolor.cgColor
            emailTF.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else if emaill?.isEmpty == true && passwordd?.isEmpty == true{
            emailTF.layer.borderColor = mycolor.cgColor
            passwordTF.layer.borderColor = mycolor.cgColor
        }else{
            emailTF.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            passwordTF.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    func Alert (message:String){
        
        let alert = UIAlertController(title: "Oops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert , animated: true)
    }
}

//extension UIButton{
//    func applyDesign(){
//        self.backgroundColor=UIColor.white
//        self.layer.cornerRadius=self.frame.height/2
//        self.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
//        self.layer.shadowColor=UIColor.darkGray.cgColor
//        self.layer.shadowRadius=4
//        self.layer.shadowOpacity=0.5
//        self.layer.shadowOffset=CGSize(width: 0, height: 0)
//    }
//}
