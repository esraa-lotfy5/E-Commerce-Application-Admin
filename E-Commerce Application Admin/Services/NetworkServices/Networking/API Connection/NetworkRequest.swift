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
    case getPriceRule
    case postPriceRule(priceRule : Parameters)
    case getDiscountCode (discountId : Int)
    case postDiscountCode (dicountCode: Parameters,discountId: Int)
    case deletePriceRule (priceRuleId : Int)
    case deleteDiscountCode (priceRuleId : Int , discountCodeId : Int)
    case createProduct(param: Parameters)
    case updateProduct(productID :Int ,product: Parameters)
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
        case .getPriceRule:
            return "price_rules.json"
        case .postPriceRule (let priceRule):
            return "price_rules.json"
        case .getDiscountCode(discountId: let discountCode):
            return "price_rules/\(discountCode)/discount_codes.json"
        case .postDiscountCode (_ , let discountId):
            return "price_rules/\(discountId)/discount_codes.json"
            
        case .deletePriceRule(let priceRuleId):
            return "price_rules/\(priceRuleId).json"
            
        case .deleteDiscountCode(let priceRuleId, let discountCodeId):
            return "/price_rules/\(priceRuleId)/discount_codes/\(discountCodeId).json"
        case .createProduct:
            return "products.json"
        case .updateProduct(let productID):
            return "products/\(productID).json"
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
            
        case .getPriceRule:
            return .get
            
        case .postPriceRule:
            return .post
            
        case .getDiscountCode(discountId: _):
            return .get
            
        case .postDiscountCode:
            return .post
            
        case .deletePriceRule:
            return .delete
            
        case .deleteDiscountCode:
            return .delete
        case .createProduct:
            return .post
        case .updateProduct:
            return .put
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
        
        case .getPriceRule:
            return .requestPlain
            
        case .postPriceRule (let priceRule):
            return .requestParameters(parameters: priceRule, encoding: URLEncoding.default)
         
        case .getDiscountCode(discountId: _):
            return .requestPlain

        case .postDiscountCode(let parameters , _):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .deletePriceRule:
            return .requestPlain
            
        case .deleteDiscountCode:
            return .requestPlain
        case .createProduct(let param):
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        case .updateProduct(_ , let param):
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
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
