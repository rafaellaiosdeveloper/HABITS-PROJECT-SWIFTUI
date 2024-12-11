//
//  Gender.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 01/12/24.
//

import Foundation

enum Gender: String, CaseIterable,Identifiable{
    case male = "Masculino"
    case female = "Feminino"
    
    var id: String{
        self.rawValue
    }
}
