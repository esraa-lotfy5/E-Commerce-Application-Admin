//
//  NetworkAPI.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import Foundation
import Alamofire

protocol NetworkAPIProtocol {
    
    func registerCustomer(customer: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void)
}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
    
    func registerCustomer(customer: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void){
        self.writeData(target: .registerCustomer(customer: customer), responseClass: [String: Any].self) { (result) in
            completion(result)
        }
    }
    
}
