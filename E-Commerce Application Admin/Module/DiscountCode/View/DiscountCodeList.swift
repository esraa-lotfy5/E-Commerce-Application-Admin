//
//  DiscountCodeList.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 20/06/2022.
//

import SwiftUI

struct DiscountCodeList: View {
    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()
    @State var showAlert : Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var priceRuleId : Int = 0
    @State var discountArrInDetails : [DiscountCode] = []

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
            
            Text("Discount Codes")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding()
        }
        //header
        
        //start of the list
        List{
        
            ForEach(discountArrInDetails, id: \.self) { row in

                Section{

                        VStack{

                            Text("Code Name: \(row.code)")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)

                        }
                    .background(Color.white)
                    .cornerRadius(10)
                    .deleteDisabled(false)
                    .padding()
                                        
                }.onTapGesture {
                    
                    showAlert.toggle()
                    
               }
                .alert("you want to delete this item", isPresented: $showAlert) {
                    
                    Button ("Cancel" , role: .destructive){
                        print("cancel is pressed")
                    }
                   Button("OK", role: .cancel) {
                       print("ok in alert is pressed")
                       viewModelDiscount.deleteDiscountCode(priceRuleId: row.priceRuleID, discountCodeId: row.id)
                   }
               }

               

            }

        
         }
        //end of the list
        }.navigationBarBackButtonHidden(true)
//            .onAppear {
//                viewModelDiscount.getDiscountCode(priceRuleId: priceRuleId )
//                print("\n FROM INSIDE VIEW IT SELF \(viewModelDiscount.discountArr)")
//            }
    }
}

struct DiscountCodeList_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCodeList()
    }
}
