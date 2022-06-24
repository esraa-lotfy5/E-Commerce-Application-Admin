//
//  ProductsNavigationBar1.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import SwiftUI

struct ProductsNavigationBar: View {
    @State private var isActive = false
    @State private var backIsActive = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            HStack {
           
               Spacer().frame(width: 24.0)
            // --------Start back button -------------
                NavigationLink(destination: MainScreen(), isActive: $backIsActive) {
                Button(action: {
                    backIsActive = true
                })
                {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    .padding(15)
                    .frame(width: 50, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                }
                }
            // -------- End back button ---------
            
               Spacer()
            //  ------------- start of header text --------------------------
               Text("Products")
                   .fontWeight(.bold)
            //  ------------ end of header text --------------------
               Spacer()
            
            Spacer().frame(width:8)
            //  --------- start of add icon -----------------
        
                HStack {
                    Image(systemName: "plus")
                    .foregroundColor(.black)
                }
                .onTapGesture {self.isActive.toggle() }
                    
                .background(NavigationLink(destination: AddProductScreen(), isActive: $isActive) { EmptyView() })
                .padding(15)
                .frame(width: 50, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                
            //  --------- end of fav icon -----------------
               Spacer().frame(width: 24.0)
            }.padding(.bottom, 16)
               .padding(.top, 16)

        
        }.navigationBarHidden(true)
    }
}

struct ProductsNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        ProductsNavigationBar()
    }
}

