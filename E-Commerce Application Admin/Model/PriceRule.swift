//
//  PriceRule.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 19/06/2022.
//

import Foundation
struct PriceRules : Codable{
    var price_rules : [PriceRule]
}

struct PriceRule : Codable , Hashable {
    var id : Int
     var title: String
     var target_type: String
    var target_selection: String
    var allocation_method: String
    var value_type: String
    var value: String
    var customer_selection: String
    var starts_at: String
}
