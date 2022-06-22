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
    case createProduct(param: Parameters)
    case createVarients(productID : Int,param: Parameters)
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
        case .createProduct:
            return "products.json"
        case .createVarients(let productID):
            return "variants/\(productID).json"
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
        case .createProduct:
            return .post
        case .createVarients:
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
        case .createProduct(let param):
            return .requestParameters(parameters: param, encoding: URLEncoding.default)
        case .createVarients(_ ,let param):
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
