//
//  ErrorResponse.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 03/01/25.
//

import Foundation

struct ErrorResponse :Decodable{
    let detail: String
    
    enum CodingKeys:String,CodingKey{
        case detail
    }
}
