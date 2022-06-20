//
//  PriceRuleItem.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 20/06/2022.
//

import SwiftUI

struct PriceRuleItem: View {
    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var priceRuleItemId: Int = 0
    @State var discountCodeTitle : String = ""
    @State var showAlert : Bool = false
    @State var isActive : Bool = false

    
    var body: some View {
        
        VStack{
            //header
            HStack{
                Spacer().frame(width:10)
                
                HStack{
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
                .frame(width: 50, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 3, x: 0, y: 3)
                
                Text("Price Rules")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
            }
            //header
            
            //body
            HStack{
                Text("Item Id : ")
                    .font(.body)
                    .foregroundColor(Color.black)
                Text("\(priceRuleItemId)")
                    .font(.body)
                    .foregroundColor(Color.blue)
            }.padding()
            
            //delete price rule button
            Button {
                print("delete button is pressed")
                viewModelDiscount.deletePriceRule(priceRuleId: priceRuleItemId)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Delete price rule")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    //.padding()
            }

            
            //retreive all discount code button
            Button {
                print("retreive button is pressed")
                isActive.toggle()
                viewModelDiscount.getDiscountCode(priceRuleId: priceRuleItemId)
                
                
            } label: {
                Text("Retreive all discount codes")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    //.padding()
            }.background(NavigationLink(destination:  // link in background
                                        DiscountCodeList( priceRuleId: priceRuleItemId)  , isActive: $isActive) { EmptyView() })
            
            
            
            
            
            //create discount code button
            TextField("Input the title of discount code", text: $discountCodeTitle )
            Button {
                print("create button is pressed")
                if discountCodeTitle.isEmpty{
                    showAlert.toggle()
                }else{
                                                   let discountCodeObj = [
                                                       "discount_code": [
                                                           "code": discountCodeTitle
                                                       ]
                                                   ]
                  //  print(discountCodeObj)
                   // viewModelDiscount.postDiscountCode(discountCode: discountCodeObj, discountCodeId: priceRuleItemId)
                }
                
                
                
            } label: {
                Text("Create discount code")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                   // .padding()
            }.alert("the input isn't correct", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            
            
            
        }.navigationBarBackButtonHidden(true)
        
       
    }
}

struct PriceRuleItem_Previews: PreviewProvider {
    static var previews: some View {
        PriceRuleItem()
    }
}