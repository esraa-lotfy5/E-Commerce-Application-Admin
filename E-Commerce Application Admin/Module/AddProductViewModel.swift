//
//  AddProductViewModel.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import Foundation
import Alamofire


class AddProductViewModel : ObservableObject{
    @Published var product : Product = items[0]
    var api :NetworkAPIProtocol = NetworkAPI()

    func createProduct(product: Parameters, completion: @escaping(Result<Product?, NSError>) -> Void) {
        
        api.createProduct(product: product) { result in
            
            switch result {
            
            case .success(let response):
                guard let newProduct = response else {
                    return
                }  // New Product

                self.product = newProduct
                completion(.success(self.product))
                
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
                completion(.failure(error))
            }
        }
    }
}
