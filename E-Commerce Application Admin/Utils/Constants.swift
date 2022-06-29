//
//  Constants.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import Foundation
struct Constants {
    
    static let baseUrl = "https://@madalex2022-ios.myshopify.com/admin/api/2022-04/"
    // endpoints
    static let endPointCreateCustomer = "customers.json"
    static let locationId = 66823782573  //for post inventory
    static let loginPassword = "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"
}

struct ErrorMessages {
    static let genericError = "Something went wrong!"
    static let statusCode422 = "Error while creating request!"
    static let emailAndPhoneError = "You need to provide untaken email and phone!"
}
