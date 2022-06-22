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
    func getProducts(completion: @escaping (Result<Products?, NSError>) -> Void)
    func deleteProduct(productID : Int)
    func createProduct(product: Parameters, completion: @escaping(Result<Product?, NSError>) -> Void)
    func updateProductVarient(productID: Int ,varient: Parameters, completion: @escaping(Result<Product?, NSError>) -> Void)
}

class NetworkAPI: BaseAPI<NetworkRequest>, NetworkAPIProtocol {
    func getProducts(completion: @escaping (Result<Products?, NSError>) -> Void){
        self.fetchData(target: .getProducts, responseClass: Products.self) { (result) in
            completion(result)
        }
    }
    
    func registerCustomer(customer: Parameters, completion: @escaping(Result<[String: Any]?, NSError>) -> Void){
        self.writeData(target: .registerCustomer(customer: customer), responseClass: [String: Any].self) { (result) in
            completion(result)
        }
    }
    
    func deleteProduct(productID : Int){
        self.fetchData(target: .deleteProduct(productID: productID), responseClass: Products.self) { (result) in
            print(result)
        }
    }
    
    func createProduct(product: Parameters, completion: @escaping(Result<Product?, NSError>) -> Void){
        self.writeData(target: .createProduct(param: product), responseClass: Product.self) { (result) in
            completion(result)
        }
    }
    func updateProductVarient(productID: Int ,varient: Parameters, completion: @escaping(Result<Product?, NSError>) -> Void){
        self.writeData(target: .createVarients(productID: productID, param: varient), responseClass: Product.self) { (result) in
            completion(result)
        }
    }
}
