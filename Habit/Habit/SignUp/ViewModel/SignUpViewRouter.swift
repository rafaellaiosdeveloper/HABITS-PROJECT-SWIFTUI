//
//  SignUpViewRouter.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 01/12/24.
//

import SwiftUI
import Combine

enum SignUpViewRouter{
    
    static func makeHomeView() -> some View{
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
