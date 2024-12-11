//
//  SignInViewModel.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 23/11/24.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    private var cancellable: AnyCancellable?
    private let publisher = PassthroughSubject<Bool, Never>()
    
    @Published var uiState: SignInUIState = .none
    
    init(){
        cancellable = publisher.sink{ value in
            print("Usuário criado! goToHome: \(value)")
            
            if value{
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit{
        print("cancelado")
        cancellable?.cancel()
       
    }
    
    func login(){
        self.uiState = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
           
            //chamado depois de 1 segundos
            self.uiState = .goToHomeScreen
            //            self.uiState = .error("Erro de teste")
        }
    }
    
}
extension SignInViewModel{
    func homeView() -> some View{
        return SignInViewRouter.makeHomeView()
    }
    
    func signUpView() -> some View{
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}


