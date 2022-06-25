//
//  E_Commerce_Application_AdminTests.swift
//  E-Commerce Application AdminTests
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import XCTest
@testable import E_Commerce_Application_Admin

class E_Commerce_Application_AdminTests: XCTestCase {
    var networkAPI = NetworkAPI()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    //trial
    func testGetPriceRules(){
        networkAPI.getPriceRule {result in
            guard let priceRules = (result as? PriceRules)?.price_rules.count else{
                    return
                }
                XCTAssertEqual(priceRules , 10 )
    }
    
}
    
    func testGetInventory(){
        networkAPI.getInventoryLevel(inventoryItemId: 43702142238893) { result in
            guard let inventory = (result as? InventoryLevels)?.inventoryLevels else{
                return
            }
            XCTAssertEqual(inventory.count, 1)
        }
    }
    

    func testgetDiscountCodes (){
        networkAPI.getDiscountCode(discountId: 12223218974893) { result in
            guard let discount = (result as? DiscountCodes)?.discountCodes else{
                return
            }
            XCTAssertEqual(discount.count, 1)
        }
        
    }
    
    
    
    
    
}
