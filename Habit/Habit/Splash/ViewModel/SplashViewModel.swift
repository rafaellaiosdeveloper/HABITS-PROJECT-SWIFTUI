//
//  SplashViewModel.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 21/11/24.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear(){
        //faz algo assincrono e muda o estado da uiState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            //chamado depois de 2 segundos
            self.uiState = .goToSignInScreen
        }
    }
    
}

extension SplashViewModel{
    func signInView() -> some View{
        return SplashViewRouter.makeSignInView()
    }
}
