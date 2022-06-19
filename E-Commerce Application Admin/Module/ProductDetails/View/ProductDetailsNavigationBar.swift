//
//  ProductDetailsNavigationBar.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import SwiftUI

struct ProductDetailsNavigationBar: View {
    @State var buttonText = "Edit"
    @Binding var editingEnabled : Bool
    @State private var isActive = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            HStack {
           
               Spacer().frame(width: 24.0)
            // --------Start back button -------------
            
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
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
            // -------- End back button ---------
            
               Spacer()
            //  ------------- start of header text --------------------------
               Text("Product Details")
                   .fontWeight(.bold)
            //  ------------ end of header text --------------------
               Spacer()
            
            Spacer().frame(width:8)
            //  --------- start of add icon -----------------
        
                HStack {
                    Text(buttonText)
                    .foregroundColor(.black)
                }
                .onTapGesture {
                    self.isActive.toggle()
                    if(editingEnabled){
                        buttonText = "Save"
                        editingEnabled = false
                    }else{
                        buttonText = "Edit"
                        editingEnabled = true
                    }
                }
                    
//                .background(NavigationLink(destination: WishList(product: [Product3(name: "test", price: 90.0, size: "S", desc: "desc")]), isActive: $isActive) { EmptyView() })
                .padding(15)
                .frame(width: 70, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                
            //  --------- end of fav icon -----------------
               Spacer().frame(width: 24.0)
            }.padding(.bottom, 16)
               .padding(.top, 16)

        
        }
    }
}

//struct ProductDetailsNavigationBar_Previews: PreviewProvider {
//    @State var test = false
//    static var previews: some View {
//        ProductDetailsNavigationBar(editingEnabled: $test)
//    }
//}
