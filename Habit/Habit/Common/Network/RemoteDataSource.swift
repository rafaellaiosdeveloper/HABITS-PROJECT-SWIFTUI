//
//  RemoteDataSource.swift
//  Habit
//
//  Created by Rafaella Rodrigues Santos on 05/01/25.
//

import Foundation

class RemoteDataSource{
    
    //padrão singleton
    //Temos apenas 1 unico objeto vivo dentro da aplicação
    static var shared: RemoteDataSource = RemoteDataSource()
    
    private init() {
    }
    
    func login(request: SignInRequest,completion: @escaping (SignInResponse?,SignInErrorResponse?) -> Void) {
        WebServices.call(path: .login,params: [
            URLQueryItem(name: "username", value: request.email),
            URLQueryItem(name: "password", value: request.password)
        ]) { result in
            switch result{
            case .failure(let error,let data):

                if let data = data{
                    if error == .unauthorized{
                        print(String(data: data, encoding: .utf8))
                        let decoder = JSONDecoder()
                        let response = try? decoder.decode(SignInErrorResponse.self, from: data)
                        
                        completion(nil, response)
                    }
                    }
                break
            case .success(let data):
                let decoder = JSONDecoder()
                let response = try? decoder.decode(SignInResponse.self, from: data)
                completion(response, nil)
                break
            }
        }
     
    
    }
    
}
