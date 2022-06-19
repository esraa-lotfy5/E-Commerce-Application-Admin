//
//  ProductDetailsImage.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import SwiftUI

struct ProductDetailsImage: View {
    var image: Image
    var body: some View {
        
        
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<10) {_ in

                    self.image.resizable()
                        .frame(maxWidth: .infinity, maxHeight: 250)

                }
            }
        }
    }
}

struct ProductDetailsImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsImage(image: Image("bag1"))
    }
}
