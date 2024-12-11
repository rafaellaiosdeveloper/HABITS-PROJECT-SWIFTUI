//
//  HabitApp.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 19/11/24.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
