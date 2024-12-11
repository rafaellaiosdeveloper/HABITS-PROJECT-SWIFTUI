//
//  SignInView.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 23/11/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var navigationHidden = true
    
    
    var body: some View {
        ZStack{
            if case SignInUIState.goToHomeScreen = viewModel.uiState{
                viewModel.homeView()
            }else{
                NavigationStack{
                    ScrollView{
                        VStack(alignment: .center,spacing: 20){
                            
                            Spacer(minLength: 150)
                            
                            VStack(alignment: .center,spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal,48)
                                
                                Text("Login")
                                    .foregroundColor(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom,8)
                                
                                emailField
                                
                                passwordField
                                
                                enterButton
                                
                                registerLink
                                
                                Text("Cpyright - ReifeProjects 2024")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16).bold())
                                    .padding(.top,30)
                            }
                        }
                        
                        if case SignInUIState.error(let value) = viewModel.uiState{
                            Text("")
                                .alert(isPresented: .constant(true)) {
                                    Alert(title: Text("Habit"), message: Text(value),dismissButton: .default(Text("OK")){
                                        //faz algo quando some o alerta
                                    })
                                }
                        }
                    }
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    //                        .background(Color.white)
                    .navigationBarTitle("Login", displayMode: .inline)
                    .navigationBarHidden(navigationHidden)
                }
            }
        }
    }
}

extension SignInView{
    var emailField: some View{
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "E-mail inválido",
                     failure: !viewModel.email.isEmail())
        .autocapitalization(.none)
        
        
    }
}

extension SignInView{
    var passwordField: some View{
        EditTextView(text: $viewModel.password,
                     placeholder: "Senha",
                     keyboard: .default,
                     error: "Senha deve ter ao menos 8 caracteres",
                     failure: viewModel.password.count < 8,
                     isSecure: true
        )
        
        
    }
}

extension SignInView{
    var enterButton: some View{
        LoadingButtonView(action: {
            viewModel.login()
        },
                          text: "Entrar",
                          showProgress: self.viewModel.uiState == SignInUIState.loading,
                          disabled: !viewModel.email.isEmail() || viewModel.password.count < 8
                          
        )
        
        
    }
}

extension SignInView{
    var registerLink: some View{
        VStack{
            Text("Ainda não possui um login ativo?")
                .foregroundColor(.gray)
                .padding(.top,48)
            
            //Stack de camada
            ZStack{
                NavigationLink {
                    viewModel.signUpView()
                } label: {
                    Text("Realize seu Cadastro")
                }
                
            }
        }
        
    }
}
#Preview {
    let viewModel = SignInViewModel()
    SignInView(viewModel: viewModel)
}

