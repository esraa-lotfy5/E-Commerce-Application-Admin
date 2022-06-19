//
//  NetworkRequest.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import Foundation
import Alamofire

enum NetworkRequest{
    
    case registerCustomer(customer: Parameters)
    case getProducts
    case deleteProduct(productID : Int)
    case getInventoryLevel(inventoryItemID : Int)
    case postInventoryLevel  (inventoryLevel : Parameters)
    case updateInventoryLevel  (inventoryLevel : Parameters)
}

extension NetworkRequest : TargetType {
    var baseURL: String {
        switch self {
        default : return Constants.baseUrl
        }
    }
    
    var path: String {
        switch self {
            
        case .registerCustomer:
            return Constants.endPointCreateCustomer
        case .getProducts:
            return "products.json"
        case .deleteProduct(let productID):
            return "products/\(productID).json"
        case .getInventoryLevel(let inventoryItemId):
            return "/inventory_levels.json?inventory_item_ids=\(inventoryItemId)"
        case .postInventoryLevel (let inventoryLevel):
            return "inventory_levels/set.json"
        case .updateInventoryLevel( let inventoryLevel):
            return "inventory_levels/adjust.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
        case .registerCustomer:
            return .post
        case .getProducts:
            return  .get
        case .deleteProduct:
            return .delete
        case .getInventoryLevel:
            return .get
        case .postInventoryLevel :
            return .post
        case .updateInventoryLevel:
            return .post
        }
    }
    
    var task: Task {
        switch self {
            
        case .registerCustomer(let customer):
            return .requestParameters(parameters: customer, encoding: URLEncoding.default)
        case .getProducts:
            return .requestPlain
        case .deleteProduct:
            return .requestPlain
            
        case .getInventoryLevel:
            return .requestPlain
            
        case .postInventoryLevel (let inventoryLevel):
            return .requestParameters(parameters: inventoryLevel, encoding: URLEncoding.default)
        case .updateInventoryLevel(let inventoryLevel ):
            return .requestParameters(parameters: inventoryLevel, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [
                "X-Shopify-Access-Token":"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"
            ]
        }
    }
    
}
