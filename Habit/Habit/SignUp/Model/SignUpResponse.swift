//
//  SignUpResponse.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 02/01/25.
//

import Foundation

struct SignUpResponse: Decodable {
    let detail: String?
    
    enum CodingKeys:String,CodingKey{
        case detail
    }
}
