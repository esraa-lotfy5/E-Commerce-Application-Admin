//
//  ProductScreen1.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import SwiftUI

var items : [Product] = [Product(id: 6870135341195, title: "ADIDAS | CLASSIC BACKPACK | LEGEND INK MULTICOLOUR", bodyHTML: "The adidas BP Classic Cap features a pre-curved brim to keep your face shaded, while a hook-and-loop adjustable closure provides a comfortable fit. With a 3-Stripes design and reflective accents. The perfect piece to top off any outfit.", vendor: "ADIDAS", productType: "ACCESSORIES", createdAt: "2022-05-24T16:37:50+02:00", handle: "adidas-classic-backpack-legend-ink-multicolour", updatedAt: "2022-06-15T18:20:41+02:00", publishedAt: "2022-05-24T16:37:50+02:00", status: "active" , publishedScope: "web", tags: "adidas, backpack, egnition-sample-data", adminGraphqlAPIID: "gid://shopify/Product/6870135341195", variants: [Variant(id: 6870135275659, productID: 40335555395723, title: "OS / black", price: "70.00", sku: "AD-03-black-OS", position: 1, inventoryPolicy: "deny", fulfillmentService: "manual", inventoryManagement: "shopify", option1: "OS", option2: "black", createdAt: "2022-05-24T16:37:47+02:00", updatedAt: "2022-05-24T16:38:50+02:00", taxable: true, grams: 0, weight: 0, weightUnit: "kg", inventoryItemID: 42434113142923, inventoryQuantity: 5, oldInventoryQuantity: 5, requiresShipping: true, adminGraphqlAPIID:  "gid://shopify/ProductVariant/40335555395723")], options: [], images: [], image: ProductImage(id: 29882743947403, productID: 6870135341195, position: 1, createdAt: "2022-05-24T16:37:50+02:00", updatedAt: "2022-05-24T16:37:50+02:00", width: 635, height: 560, src: "https://cdn.shopify.com/s/files/1/0589/7509/2875/products/8072c8b5718306d4be25aac21836ce16.jpg?v=1653403070", variantIDS: [], adminGraphqlAPIID: "gid://shopify/ProductImage/29882743947403"))]


struct ProductScreen: View {
    @ObservedObject var productsViewModel : ProductsViewModel = ProductsViewModel()
    var body: some View {
        
            VStack{
                ProductsNavigationBar()
            
                List {
                    ForEach(productsViewModel.products) {product in
                        NavigationLink(destination: ProductDetailsScreen(product: product)) {
                        ProductCell(product:product)
                        }
                      }
                        
                      .onDelete { indexSet in
                
                          DispatchQueue.main.async {
                              
                          productsViewModel.deleteProduct(product: productsViewModel.products[indexSet.first ?? -1])
                              productsViewModel.products.remove(atOffsets: indexSet)
                          }
                      }
                }
                
            }.onAppear(perform: {
                print("we are on Appear")
                self.productsViewModel.getProducts()
            })
            .navigationBarHidden(true)
    }
    
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen()
    }
}


