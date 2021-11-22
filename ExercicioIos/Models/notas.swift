//
//  notas.swift
//  ProvaIOS27
//
//  Created by COTEMIG on 17/04/43 AH.
//

import Foundation

struct notas: Codable {
    var aluno: String
    var id: String
    var nota: String
    
    var dictionary : [String: Any] {
        return [
            "aluno": aluno,
            "id": id,
            "nota": nota
        ]
    }
    
    var NSDic: NSDictionary {
        return dictionary as NSDictionary
    }
}
