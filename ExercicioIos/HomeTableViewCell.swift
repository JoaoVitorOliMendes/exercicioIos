//
//  HomeTableViewCell.swift
//  ExercicioIos
//
//  Created by COTEMIG on 17/04/43 AH.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var AlunoLbl: UILabel!
    @IBOutlet weak var NotaLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
