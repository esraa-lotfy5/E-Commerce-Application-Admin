//
//  ProductsViewModel.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 17/06/2022.
//

import Foundation

class ProductsViewModel : ObservableObject{
    
    @Published var products : [Product] = []
    var api :NetworkAPIProtocol = NetworkAPI()
    
    init(){
        getProducts()
    }
    
    func getProducts(){
        api.getProducts(completion: { (result) in
            switch result {
            case .success(let response):
                let productsResponse = response
                print("----------------------------------- products count = \(productsResponse?.products.count)")
                self.products = productsResponse?.products ?? []
                //self.productsCopy = self.products
                //print("----------------------------------for: \(self.products.isEmpty)----------")
//                for product in self.products{
                    //print("----------------------------------product----------")
    //                    print("product name -> \(product.title)")
//                }
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
            
        })
    }
    
    func deleteProduct(product: Product){
        print("Product name: \(product.title)")
        api.deleteProduct(productID: product.id)
    }
}
