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
    private let interactor: SignInInteractor
    
    @Published var uiState: SignInUIState = .none
    
    init(interactor: SignInInteractor){
        self.interactor = interactor
        
        cancellable = publisher.sink{ value in
            print("Usuário criado! goToHome: \(value)")
            if value{
                DispatchQueue.main.async {
                    self.uiState = .goToHomeScreen
                }
            }
        }
    }
    
    deinit{
        print("cancelado")
        cancellable?.cancel()
       
    }
    
    func login(){
        self.uiState = .loading
        
        interactor.login(request: SignInRequest(email: email, password: password)) { (successResponse,errorResponse) in
            
            if let error = errorResponse{
                DispatchQueue.main.async {
                    self.uiState = .error(error.detail.message)

                }
            }
            if let success = successResponse{
                print(success)
                
                    DispatchQueue.main.async {
                        self.uiState = .goToHomeScreen

                    }
                
            }
        }
            
        }
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//           
//            //chamado depois de 1 segundos
//            self.uiState = .goToHomeScreen
//            //            self.uiState = .error("Erro de teste")
//        }
    }
    

extension SignInViewModel{
    func homeView() -> some View{
        return SignInViewRouter.makeHomeView()
    }
    
    func signUpView() -> some View{
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}


