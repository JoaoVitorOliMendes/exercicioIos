//
//  AddViewController.swift
//  ProvaIOS27
//
//  Created by COTEMIG on 17/04/43 AH.
//

import UIKit
import Firebase

class AddViewController: UIViewController {

    @IBOutlet weak var alunoTxt: UITextField!
    @IBOutlet weak var notaTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNota(_ sender: Any) {
        let aluno = alunoTxt.text ?? ""
        let nota = notaTxt.text ?? ""
        
        if aluno == "" || nota == "" {
            self.showToast(message: "Preencha todos os campos")
        }
        let ref = Database.database().reference()
        let id = ref.child("notas").childByAutoId().key ?? ""
        
        let alunoNota = notas(
            aluno: aluno,
            id: id,
            nota: nota
        )
        
        //ref.child("notas").child(<#T##pathString: String##String#>).setValue(alunoNota.NSDic)
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
