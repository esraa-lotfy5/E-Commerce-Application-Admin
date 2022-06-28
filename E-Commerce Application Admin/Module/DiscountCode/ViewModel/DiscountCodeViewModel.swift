//
//  DiscountCodeViewModel.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 19/06/2022.
//

import Foundation
import Alamofire


class DiscountCodeViewModel : ObservableObject {
    var api :NetworkAPIProtocol = NetworkAPI()
    @Published var discountArr : [DiscountCode] = []
    @Published var priceArr : [PriceRule] = []
    
    init() {
        getPriceRule()
    }
    
    func getPriceRule (){
        api.getPriceRule { [self] (result) in
            switch result {
            case .success(let response):
                let responsePriceRule = response
                print("PRICE RULE GETTTT\(String(describing: responsePriceRule))")
                priceArr = responsePriceRule?.price_rules ?? []
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
        
    }

    func postPriceRule (priceRule : Parameters){
        api.postPriceRule(priceRule: priceRule) { (result) in
            switch result {
            case .success(let response):
                let responsePriceRule = response
                print("PRICE RULE POSSSSSTTT\(String(describing: responsePriceRule))")
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }
    

    
    func postDiscountCode (discountCode : Parameters , discountCodeId : Int){

//        api.postDiscountCode(discountCode: discountCode, discountId: "1095463338123") { (result) in
        api.postDiscountCode(discountCode: discountCode, discountId: discountCodeId) { (result) in
            switch result {
            case .success(let response):
                let responseDiscountRule = response
                print("DISCOUNT CODE POSTTTTTTT\(String(describing: responseDiscountRule))")
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }

    func deletePriceRule (priceRuleId : Int){
        api.deletePriceRule(priceRuleId: priceRuleId) { (result) in
            switch result {
            case .success(let response):
                let responsePriceRule = response
                print("PRICE RULE DELETEEE\(String(describing: responsePriceRule))")
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }
    
    
    func getDiscountCode (priceRuleId : Int) -> Bool{
        var returnedBool : Bool = false
        api.getDiscountCode(discountId: priceRuleId) { (result) in
            switch result {
            case .success(let response):
                let responseDiscountCode = response
                print("DISCOUNT CODE GETTTT\(String(describing: responseDiscountCode))")
                self.discountArr = responseDiscountCode?.discountCodes ?? []
                print("\nDISCOUNT CODE ARRAY \(self.discountArr)\n")
                returnedBool = true
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
        return returnedBool
    }
    
    
    func deleteDiscountCode (priceRuleId : Int , discountCodeId : Int) {
        api.deleteDiscountCode(priceRuleId: priceRuleId, discountCodeId: discountCodeId) { (result) in
            switch result {
            case .success(let response):
                let responseDiscountCode = response
                print("DISCOUNT CODE DELETEEE\(String(describing: responseDiscountCode))")
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
        }
    }
    
    
}
//                               let priceRuleObj = [
//                                   "price_rule": [
//                                                "title": "OPENING45OFF",
//                                                "target_type": "line_item",
//                                                "target_selection": "all",
//                                                "allocation_method": "across",
//                                                "value_type": "fixed_amount",
//                                                "value": "-45.0",
//                                                "customer_selection": "all",
//                                                "starts_at": "2021-11-10T13:00:10Z"
//                                   ]
//                               ]
//                               let priceRuleObjTwo = [
//                                   "price_rule": [
//                                                "title": "SALE15OFF",
//                                                "target_type": "line_item",
//                                                "target_selection": "all",
//                                                "allocation_method": "across",
//                                                "value_type": "fixed_amount",
//                                                "value": "-15.0",
//                                                "customer_selection": "all",
//                                                "starts_at": "2021-11-10T13:00:10Z"
//                                   ]
//                               ]
//                               viewModel.postPriceRule(priceRule: priceRuleObjTwo)
                               
                               //post discount code
//                               let discountCodeObj = [
//                                   "discount_code": [
//                                       "code": "SALE15OFF"
//                                   ]
//                               ]
//
//                               let discountCodeObjTwo = [
//                                   "discount_code": [
//                                       "code": "OPENING45OFF"
//                                   ]
//                               ]
//
//                               viewModel.postDiscountCode(discountCode: discountCodeObjTwo)
