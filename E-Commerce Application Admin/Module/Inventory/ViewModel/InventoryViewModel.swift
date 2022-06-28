//
//  InventoryViewModel.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 25/06/2022.
//

import Foundation
import Alamofire
class InventoryViewModel : ObservableObject{
    
    var api :NetworkAPIProtocol = NetworkAPI()
    @Published var inventoryArr : InventoryLevel?

        
    //trial
    func getInventoryLevel (inventoryItemId : Int){
        api.getInventoryLevel(inventoryItemId: inventoryItemId) { (result) in
            switch result {
            case .success(let response):
                let responseInventory = response
                print("responseInventory GETTTT\(String(describing: responseInventory))")
                //i stopped here array part
                for item in responseInventory?.inventoryLevels ?? []{
                    self.inventoryArr = item
                    print("ITEM OF INVENTORY LEVEL === \(item.inventoryItemID)\n")
                    print("ITEM OF INVENTORY LEVEL === \(item.available)\n")
                    print("ITEM OF INVENTORY LEVEL === \(item.locationID)\n")
                    print("ITEM OF INVENTORY LEVEL === \(item.updatedAt)\n")
                    print("ITEM OF INVENTORY LEVEL === \(item.adminGraphqlAPIID)\n")

                }
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }
    
    
    func postInventoryLevel (inventoryItem : Parameters){
        api.postInventoryLevel(InventoryItem: inventoryItem) { (result) in
                        switch result {
                        case .success(let response):
                            let responseInventoryItem = response
                            print("INVENTORY ITEM POSTTTTTTT\(String(describing: responseInventoryItem))")
                        case .failure(let error):
                            print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                        }
        }
    
    }

    func updateInventoryLevel (inventoryItem : Parameters){
        var returned : Bool = false
        api.updateInventoryLevel(InventoryItem: inventoryItem) { (result) in
                        switch result {
                        case .success(let response):
                            let responseInventoryItem = response
                            print("INVENTORY ITEM POSTTTTTTT\(String(describing: responseInventoryItem))")
                            returned = true
                        case .failure(let error):
                            print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                        }
        }
       // return returned
    
    }
    
    
}
