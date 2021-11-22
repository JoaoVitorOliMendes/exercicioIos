//
//  LoginViewController.swift
//  ExercicioIos
//
//  Created by COTEMIG on 15/11/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, homeDelegate {
    
    func didCreateUser() {
        self.gotoHome()
    }
    

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLogin(_ sender: Any) {
        let email: String = txtEmail.text ?? ""
        let senha: String = txtSenha.text ?? ""
        
        if email == "" || senha == "" {
            self.showToast(message: "Preencha todos os campos")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: senha, completion: { (result, e) in
            if e != nil{
                print(e)
            }else{
                print(result)
                print("aaaaayugasuygsaugysauygsaisgasgags")
                self.showToast(message: "Login")
                //self.gotoHome()
            }
        })
    }
    @IBAction func btnRegister(_ sender: Any) {
    }
    @IBAction func btnForgotPass(_ sender: Any) {
    }
    
    func gotoHome() {
        self.performSegue(withIdentifier: "home", sender: self)
    }
    
    func showToast(message : String) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
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

