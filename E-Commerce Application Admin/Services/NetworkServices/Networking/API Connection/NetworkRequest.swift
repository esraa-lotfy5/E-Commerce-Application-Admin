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
        }
    }
    
    var method: HTTPMethod {
        switch self {
            
        case .registerCustomer:
            return .post
        }
    }
    
    var task: Task {
        switch self {
            
        case .registerCustomer(let customer):
            return .requestParameters(parameters: customer, encoding: URLEncoding.default)
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
