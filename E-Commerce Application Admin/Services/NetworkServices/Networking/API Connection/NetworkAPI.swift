//
//  NetworkAPI.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import Foundation
import Alamofire

protocol NetworkAPIProtocol {
    func getProducts(completion: @escaping (Result<Products?, NSError>) -> Void)
    func deleteProduct(productID : Int)
    
}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
    func getProducts(completion: @escaping (Result<Products?, NSError>) -> Void){
        self.fetchData(target: .getProducts, responseClass: Products.self) { (result) in
            completion(result)
        }
    }
    
    func deleteProduct(productID : Int){
        self.fetchData(target: .deleteProduct(productID: productID), responseClass: Products.self) { (result) in
            print(result)
        }
    }
}
