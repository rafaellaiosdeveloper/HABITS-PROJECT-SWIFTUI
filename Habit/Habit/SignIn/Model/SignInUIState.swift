//
//  SignInUIState.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 28/11/24.
//

import Foundation

enum SignInUIState: Equatable{
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
