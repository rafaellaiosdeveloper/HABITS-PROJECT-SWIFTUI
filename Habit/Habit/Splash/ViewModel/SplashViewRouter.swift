//
//  SplashViewRouter.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 23/11/24.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
