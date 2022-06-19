//
//  ProductCell1.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import SwiftUI
import Kingfisher

struct ProductCell: View {
    @State private var isActive = false
    var product: Product
    var body: some View {
        HStack{
        KFImage(URL(string: product.image.src))
            .resizable()
            .frame(width: 100, height: 140)
            .padding(.trailing, 8)
            
        //Spacer().frame(width:8)
        VStack(alignment: .leading){
            Text(product.title.split(separator: "|")[1].trimmingCharacters(in: .whitespacesAndNewlines))
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer().frame(height:8)
            
            Text(product.title.split(separator: "|")[0])
                
            
            Spacer().frame(height:16)
            
            Text("price: \(product.variants[0].price)$")
                .foregroundColor(.gray)
        }
        }
        //.padding(.bottom, 2)
        .onTapGesture { self.isActive.toggle() } // activate link on image tap
                   .background(NavigationLink(destination:  // link in background
                                              ProductDetailsScreen(product: product), isActive: $isActive) { EmptyView() })
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: items[0])
    }
}
