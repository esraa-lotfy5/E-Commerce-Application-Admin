//
//  DiscountCode.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 19/06/2022.
//

import Foundation
struct DiscountCodes: Codable {
    var discountCodes: [DiscountCode]

    enum CodingKeys: String, CodingKey {
        case discountCodes = "discount_codes"
    }
}

struct DiscountCode: Codable , Hashable{
    var id, priceRuleID: Int
    var code: String
    var usageCount: Int64
    var createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case priceRuleID = "price_rule_id"
        case code
        case usageCount = "usage_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
