//
//  Constants.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import Foundation
struct Constants {
    
    static let baseUrl = "https://@madalex20220.myshopify.com/admin/api/2022-01/"
    
    // endpoints
    static let endPointCreateCustomer = "customers.json"
    
}

struct ErrorMessages {
    static let genericError = "Something went wrong!"
    static let statusCode422 = "Error while creating request!"
    static let emailAndPhoneError = "You need to provide untaken email and phone!"
}
