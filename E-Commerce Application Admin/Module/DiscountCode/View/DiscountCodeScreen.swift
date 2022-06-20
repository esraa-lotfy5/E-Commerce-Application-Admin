//
//  DiscountCodeScreen.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 19/06/2022.
//

import SwiftUI

struct DiscountCodeScreen: View {
    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()
    @State var isActive : Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
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
            
            //start of the list
            List{
            
                ForEach(viewModelDiscount.priceArr, id: \.self) { row in
 
                    Section{

                            VStack{

                                Text("Title: \(row.title)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("Value: \(row.value)")
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
                        print("onTap == \(String(describing: row.id))")
                        self.isActive.toggle()
                   }

                    .background(NavigationLink(destination:  // link in background
                                               PriceRuleItem( priceRuleItemId: row.id), isActive: $isActive) { EmptyView() })

                }

            
             }
            //end of the list
            Button {
                isActive.toggle()

            } label: {
                Text("Create new price rule")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                
            }.background(NavigationLink(destination:  // link in background
                                        AddPriceRule()  , isActive: $isActive) { EmptyView() })

        }.onAppear {
            viewModelDiscount.getPriceRule()
        }
    }
}

struct DiscountCodeScreen_Previews: PreviewProvider {
    static var previews: some View {
        DiscountCodeScreen()
    }
}
