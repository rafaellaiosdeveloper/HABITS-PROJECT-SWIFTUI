//
//  SplashView.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 19/11/24.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group{
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignInScreen:
                viewModel.signInView()
                //navegar para a proxima tela
            case .goToHomeScreen:
                Text("Carregar tela principal")
                //navegar para a proxima tela
            case .error(let msg):
                loadingView(error: msg)
            }
        }.onAppear {
            viewModel.onAppear()
        }
       
    }
}

//Compartilhamento - objetos
extension SplashView{
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .ignoresSafeArea()
            
            if let error = error{
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"), message: Text(error),dismissButton: .default(Text("OK")){
                            //faz algo quando some o alerta
                        })
                    }
            }
            
        }
        
    }
}

#Preview {
    let viewModel = SplashViewModel()
    SplashView(viewModel: viewModel)
}
