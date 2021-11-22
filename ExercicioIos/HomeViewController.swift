//
//  HomeViewController.swift
//  ExercicioIos
//
//  Created by COTEMIG on 15/11/21.
//

import UIKit
import Firebase
import CodableFirebase

class HomeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayNotas: [notas] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        addButtons()
        let ref = Database.database().reference()
        ref.child("notas").observe(DataEventType.value, with: { snapshot in
            guard let value = snapshot.value else { return }
            do {
                let aluno = try FirebaseDecoder().decode(notas.self, from: value)
                self.arrayNotas.append(aluno)
                self.tableView.reloadData()
            } catch let error {
                
            }
        })
    }
    func addButtons() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .add, target: self, action: #selector(nextPage)
            )
    }
    @objc func nextPage() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        navigationController?.pushViewController(vc, animated: true)
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

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNotas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let aluno = arrayNotas[indexPath.row]
        cell.NotaLbl.text = aluno.nota
        cell.AlunoLbl.text = aluno.aluno
        return cell
    }
    
    
}
