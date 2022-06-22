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
    func getPriceRule(completion : @escaping (Result<PriceRules? , NSError>)-> Void)
    func postPriceRule(priceRule: Parameters, completion: @escaping (Result<PriceRule?, NSError>) -> Void)
    func getDiscountCode (discountId : Int , completion : @escaping (Result<DiscountCodes? , NSError>) -> Void)
    func postDiscountCode (discountCode : Parameters, discountId : Int ,completion : @escaping (Result<DiscountCode? , NSError>)-> Void)
    func deletePriceRule (priceRuleId : Int , completion : @escaping (Result<PriceRule? , NSError>) -> Void)
    func deleteDiscountCode (priceRuleId : Int , discountCodeId : Int , completion : @escaping (Result<DiscountCode? , NSError>) -> Void)
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
    
    
    func getPriceRule(completion: @escaping (Result<PriceRules?, NSError>) -> Void) {
        self.fetchData(target: .getPriceRule, responseClass: PriceRules.self) { (result) in
            completion(result)
        }
    }
    
    func postPriceRule(priceRule: Parameters, completion: @escaping (Result<PriceRule?, NSError>) -> Void) {
        self.writeData(target: .postPriceRule(priceRule: priceRule), responseClass: PriceRule.self) { (result) in
            completion(result)
        }
    }
    
    func getDiscountCode(discountId: Int, completion: @escaping (Result<DiscountCodes?, NSError>) -> Void) {
        self.fetchData(target: .getDiscountCode(discountId: discountId), responseClass: DiscountCodes.self) { (result) in
            completion(result)
        }
    }
    
    func postDiscountCode (discountCode : Parameters, discountId : Int ,completion : @escaping (Result<DiscountCode? , NSError>)-> Void){
        self.writeData(target: .postDiscountCode(dicountCode: discountCode, discountId: discountId), responseClass: DiscountCode.self) { (result) in
            completion(result)
        }
    }
    
    func deletePriceRule (priceRuleId : Int , completion : @escaping (Result<PriceRule? , NSError>) -> Void){
        self.writeData(target: .deletePriceRule(priceRuleId: priceRuleId), responseClass: PriceRule.self) { (result) in
            completion(result)
        }
    }
    
    func deleteDiscountCode (priceRuleId : Int , discountCodeId : Int , completion : @escaping (Result<DiscountCode? , NSError>) -> Void){
        self.writeData(target: .deleteDiscountCode(priceRuleId: priceRuleId, discountCodeId: discountCodeId), responseClass: DiscountCode.self) { (result) in
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
