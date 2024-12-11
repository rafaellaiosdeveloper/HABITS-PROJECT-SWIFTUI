//
//  SignUpView.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 29/11/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center) {
                    VStack(alignment: .leading,spacing: 8) {
                        Text("Cadastro")
                            .foregroundColor(.text)
                            .font(.system(.title).bold())
                            .padding(.bottom,8)
                        
                        fullNameField
                        emailField
                        passwordField
                        documentField
                        phoneField
                        birthdayField
                        genderField
                        registerButton
                    }
                }.padding(.horizontal,8)
            }.padding()
            if case SignUpUIState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"), message: Text(value),dismissButton: .default(Text("OK")){
                            //faz algo quando some o alerta
                        })
                    }
            }
        }
    }
}

extension SignUpView{
    var fullNameField: some View{
        EditTextView(
            text: $viewModel.fullName,
            placeholder: "Entre com seu nome Completo *",
            keyboard: .alphabet,
            error: "Nome inválido",
            failure: viewModel.fullName.count < 3
        )
       
    }
}

extension SignUpView{
    var emailField: some View{
        EditTextView(
            text: $viewModel.email,
            placeholder: "Entre com seu e-mail *",
            keyboard: .emailAddress,
            error: "e-mail inválido",
            failure: !viewModel.email.isEmail()
        )
    }
}

extension SignUpView{
    var passwordField: some View{
        EditTextView(text: $viewModel.password,
                     placeholder: "Digite sua senha*",
                     keyboard: .default,
                     error: "Senha deve ter ao menos 8 caracteres",
                     failure: viewModel.password.count < 8,
                     isSecure: true
        )
    }
}

extension SignUpView{
    var documentField: some View{
        EditTextView(
            text: $viewModel.document,
            placeholder: "Entre com seu cpf *",
            keyboard: .numberPad,
            error: "Cpf inválido",
            failure: viewModel.document.count < 11
        )
    }
}

extension SignUpView{
    var phoneField: some View{
        EditTextView(
            text: $viewModel.phone,
            placeholder: "Entre com seu celular *",
            keyboard: .numberPad,
            error: "Entre com o DDD + 8 ou 9 digitos",
            failure: viewModel.phone.count < 10 || viewModel.phone.count <= 12
        )
    }
}

extension SignUpView{
    var birthdayField: some View{
        EditTextView(
            text: $viewModel.birthday,
            placeholder: "Entre com sua data de nascimento *",
            keyboard: .default,
            error: "Data deve ser dd/MM/yyyy",
            failure: viewModel.phone.count != 10
        )
    }
}

extension SignUpView{
    var genderField: some View{
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases,id: \.self){ value in
                Text(value.rawValue)
                    .tag(value)
                    
            }
        }.pickerStyle(SegmentedPickerStyle())
            .padding(.top,16)
            .padding(.bottom,20)
    }
}

extension SignUpView{
    var registerButton: some View{
        LoadingButtonView(action: {
            viewModel.signUp()
        },
                          text: "Realize o seu Cadastro",
                          showProgress: self.viewModel.uiState == SignUpUIState.loading,
                          disabled: !viewModel.email.isEmail() ||
                          viewModel.password.count < 8 ||
                          viewModel.fullName.count < 3 ||
                          viewModel.document.count < 11 ||
                          viewModel.phone.count < 10 || viewModel.phone.count >= 12 ||
                          viewModel.birthday.count != 10
                          
        )
        
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
