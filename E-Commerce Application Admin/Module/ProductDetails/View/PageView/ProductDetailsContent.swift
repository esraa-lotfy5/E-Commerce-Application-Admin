//
//  ProductDetailsContent.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import SwiftUI

struct ProductDetailsContent: View {
    var title: String
    var details: String
    var backgroundColor: Color
    
    var body: some View {
        
        HStack {
            Text(title)
            Spacer()
            Text(details)
        }.padding().background(backgroundColor)
        
    }
}

struct ProductDetailsContentWithOptions: View {
    
    var title: String
    var details: [String]
    var backgroundColor: Color
    @Binding var text: String
    @State var isSelected : Bool = false
    @State var color : Color = Color.black
    var body: some View {
        
        HStack {
            Text(title)
            Spacer(minLength: 100)

                HStack {
                    ForEach(details , id: \.self){ item  in

                        
                        
                        Button(action: {
                            _text.wrappedValue = item
                            print("item \(item) tapped")
                        }, label: {
                            Text(item)
                                .foregroundColor( _text.wrappedValue == item ? .black: .white)  // <-- Here
                                .fontWeight(.semibold)
                                .padding(3)
                                .background(Color.blue)
                                .cornerRadius(5)
                        })
             

                    }
                }
            .frame(height: 50)
            
        }.padding().background(backgroundColor)
        
    }
}


struct ProductDetailsContent_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsContent(
            title: "Sizes",
            details: "7.5, 8, 8.5, 9, 9.5, 10, 10.5",
            backgroundColor: Color(red: 232/255, green: 232/255, blue: 232/255)
        )
    }
}

