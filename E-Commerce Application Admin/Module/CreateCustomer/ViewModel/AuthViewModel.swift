//
//  AuthViewModel.swift
//  E-Commerce Application Admin
//
//  Created by Abdelrhman Ahmed on 17/06/2022.
//

import Foundation
import Alamofire

class AuthViewModel: ObservableObject {
    
    private let networkAPI: NetworkAPIProtocol = NetworkAPI()
    
    func registerCustomer(customer: Parameters, completion: @escaping(Result<Customer?, NSError>) -> Void) {
        
        networkAPI.registerCustomer(customer: customer) { result in
            
            switch result {
            
            case .success(let response):
                
                if let response = response {

                    let customerDict = response["customer"] as! [String: Any]

                    let customer = Customer(id: customerDict["id"] as? Int64,first_name: customerDict["first_name"] as? String, last_name: customerDict["last_name"] as? String, email: customerDict["email"] as? String)

                    completion(.success(customer))
                }
                
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                
                var provideError = error
                
                if error.localizedDescription == ErrorMessages.statusCode422 {
                    provideError = NSError(domain: Constants.baseUrl, code: 422, userInfo: [NSLocalizedDescriptionKey: ErrorMessages.emailAndPhoneError])
                }
                
                completion(.failure(provideError))
            }
            
        }
        
    }
    
}
