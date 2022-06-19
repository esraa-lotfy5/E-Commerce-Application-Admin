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
    func getInventoryLevel(inventoryItemId : Int , completion: @escaping(Result<InventoryLevels?, NSError>) -> Void)
    func postInventoryLevel (InventoryItem : Parameters ,completion : @escaping (Result<InventoryLevel? , NSError>)-> Void)
    func updateInventoryLevel (InventoryItem : Parameters ,completion : @escaping (Result<InventoryLevel? , NSError>)-> Void)
    
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
    
    func getInventoryLevel(inventoryItemId : Int , completion: @escaping(Result<InventoryLevels?, NSError>) -> Void){
        self.fetchData(target: .getInventoryLevel(inventoryItemID: inventoryItemId), responseClass: InventoryLevels.self) { (result) in
            completion(result)
        }
    }
    
    func postInventoryLevel (InventoryItem : Parameters ,completion : @escaping (Result<InventoryLevel? , NSError>)-> Void){
        self.writeData(target: .postInventoryLevel(inventoryLevel: InventoryItem), responseClass: InventoryLevel.self) { (result) in
            completion (result)
        }
    }
    
    func updateInventoryLevel (InventoryItem : Parameters ,completion : @escaping (Result<InventoryLevel? , NSError>)-> Void){
        self.writeData(target: .updateInventoryLevel(inventoryLevel: InventoryItem), responseClass: InventoryLevel.self) { (result) in
            completion (result)
        }
    }
    
}
