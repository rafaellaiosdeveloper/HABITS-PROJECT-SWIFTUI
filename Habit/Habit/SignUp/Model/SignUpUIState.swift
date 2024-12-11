//
//  SignUpUIState.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 01/12/24.
//

import Foundation

enum SignUpUIState: Equatable{
    case none
    case loading
    case success
    case error(String)
}
