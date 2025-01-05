//
//  SignInInteractor.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 05/01/25.
//

import Foundation

struct SignInInteractor{
    
    private let remote: RemoteDataSource = .shared
 //   private let local: LocalDataSource
}

extension SignInInteractor{
    
    func login(request: SignInRequest,completion: @escaping (SignInResponse?,SignInErrorResponse?) -> Void){
        remote.login(request: request,completion: completion)
    }
}
