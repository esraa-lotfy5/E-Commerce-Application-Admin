//
//  InventoryLevels.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 19/06/2022.
//

import Foundation
struct InventoryLevels: Codable {
    var inventoryLevels: [InventoryLevel]

    enum CodingKeys: String, CodingKey {
        case inventoryLevels = "inventory_levels"
    }
}

// MARK: - InventoryLevel
struct InventoryLevel: Codable {
    var inventoryItemID, locationID, available: Int64
    var updatedAt: String
    var adminGraphqlAPIID: String

    enum CodingKeys: String, CodingKey {
        case inventoryItemID = "inventory_item_id"
        case locationID = "location_id"
        case available
        case updatedAt = "updated_at"
        case adminGraphqlAPIID = "admin_graphql_api_id"
    }
}


//"inventory_item_id": 42434113142923,
//"location_id": 64330432651,
//"available": 42,
//"updated_at": "2022-06-18T16:46:27+02:00",
//"admin_graphql_api_id": "gid://shopify/InventoryLevel/98652356747?inventory_item_id=42434113142923"
