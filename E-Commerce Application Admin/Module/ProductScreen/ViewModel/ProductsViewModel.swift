//
//  ProductsViewModel.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import Foundation

class ProductsViewModel : ObservableObject{
    
    @Published var products : [Product] = []
    var api :NetworkAPIProtocol = NetworkAPI()

    
    func getProducts() -> Void{
        api.getProducts(completion: { (result) in
            switch result {
            case .success(let response):
                let productsResponse = response
//                print("----------------------------------- products count = \(productsResponse?.products.count)")
                self.products = productsResponse?.products ?? []
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
            
        })
    }
    
    func deleteProduct(product: Product){
//        print("deleted Product name: \(product.title)")
        api.deleteProduct(productID: product.id ?? 0)
    }
}
