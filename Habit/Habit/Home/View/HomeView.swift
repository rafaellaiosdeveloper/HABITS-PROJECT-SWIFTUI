//
//  HomeView.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 29/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Text("Ola Home Page")
    }
}

#Preview {
    
    HomeView(viewModel: HomeViewModel())
}
