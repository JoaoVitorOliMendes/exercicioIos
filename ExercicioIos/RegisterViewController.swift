//
//  RegisterViewController.swift
//  ExercicioIos
//
//  Created by COTEMIG on 15/11/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtConfirmarSenha: UITextField!
    weak var delegate: homeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnCad(_ sender: Any) {
        let email: String = txtEmail.text ?? ""
        let senha: String = txtSenha.text ?? ""
        let confirmarSenha: String = txtConfirmarSenha.text ?? ""
        
        if email == "" || senha == "" || confirmarSenha == "" {
            self.showToast(message: "Preencha todos os campos")
            return
        }else if(senha.count < 6) {
            self.showToast(message: "A senhas deve ter mais de 6 caracteres")
            return
        }
        else if(senha != confirmarSenha) {
            self.showToast(message: "As senhas estao diferentes")
            return
        }else {

            Auth.auth().createUser(withEmail: email, password: senha, completion: {
                authReult, error in
                if error != nil {
                    self.showToast(message: "\(error)")
                }else {
                    self.showToast(message: "success")
                    
                    self.delegate?.didCreateUser()
                }
            })
        }
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

protocol homeDelegate: AnyObject {
    func didCreateUser()
}
