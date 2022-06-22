//
//  AddPriceRule.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 20/06/2022.
//

import SwiftUI

struct AddPriceRule: View {
    @ObservedObject  var viewModelDiscount = DiscountCodeViewModel()

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var targetTypeScheme = 0
    @State private var targetSelectionScheme = 0
    @State private var allocationMethodScheme = 0
    @State private var valueTypeScheme = 0
    @State private var valuetypeScheme = 0
    @State private var customerSelectionScheme = 0
    @State var priceRuleTitle: String = ""
    @State var priceRuleValue: String = ""
    @State var showAlert : Bool = false
    
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
                
                Text("Add Price Rule")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
            }
            //header
            
            Text("When the value of target_type is shipping line, then this value must be each")
                .font(.body)
                .foregroundColor(Color.red)
                .lineLimit(.max)
                .padding()
            Text("If target_type is shipping_line, then only percentage is accepted")
                .font(.body)
                .foregroundColor(Color.red)
                .lineLimit(.max)
                .padding()
            
            //Body
            
            TextField("enter the title whithout any spaces", text: $priceRuleTitle)
                .foregroundColor(Color.blue)
                .border(.gray)
                .cornerRadius(5)
                .font(.title2)
                .padding()
            
            TextField("enter the value whithout any spaces", text: $priceRuleValue)
                .foregroundColor(Color.blue)
                .border(.gray)
                .cornerRadius(5)
                .font(.title2)
                .padding()
            
                Form {
                    Section("Price Rule Selection") {
                        Picker("Target Type", selection: $targetTypeScheme) {
                            Text("line item").tag(0)
                            Text("shipping line").tag(1)
                        }
                        
                        Picker("Target Selection", selection: $targetSelectionScheme) {
                            Text("all").tag(0)
                            Text("entitled").tag(1)
                        }
                        
                        Picker("Allocation Method", selection: $allocationMethodScheme) {
                            Text("each").tag(0)
                            Text("across").tag(1)
                        }
                        
                        Picker("Value Type", selection: $valuetypeScheme) {
                            Text("fixed amount").tag(0)
                            Text("percentage").tag(1)
                        }
                        
                        Picker("Customer Selection", selection: $customerSelectionScheme) {
                            Text("all").tag(0)
                            Text("prerequisite").tag(1)
                        }

                    }
                }
            

            Button {
                var targetTypeStr : String = ""
                var targetSelectionStr : String = ""
                var allocationMethodStr : String = ""
                var valueTypeStr : String = ""
                var customerSelectionStr : String = ""
                
                //item 1
                if targetTypeScheme == 0{
                    targetTypeStr = "line_item"
                }else{
                    targetTypeStr = "shipping_line"
                }
                
                //item 2
                if targetSelectionScheme == 0{
                    targetSelectionStr = "all"
                }else{
                    targetSelectionStr = "entitled"
                }
                //item 3
                if allocationMethodScheme == 0{
                    allocationMethodStr = "each"
                }else{
                    allocationMethodStr = "across"
                }
                //item 4
                if customerSelectionScheme == 0{
                    customerSelectionStr = "all"
                }else{
                    customerSelectionStr = "prerequisite"
                }
                
                if valueTypeScheme == 0{
                    valueTypeStr = "fixed_amount"
                }else{
                    valueTypeStr = "percentage"
                }
                
                
                if priceRuleTitle.isEmpty || priceRuleValue.isEmpty {
                    showAlert = true
                }else{
                    
                                                   let priceRuleObj = [
                                                       "price_rule": [
                                                                    "title": priceRuleTitle,
                                                                    "target_type": targetTypeStr,
                                                                    "target_selection": targetSelectionStr,
                                                                    "allocation_method": allocationMethodStr,
                                                                    "value_type": valueTypeStr,
                                                                    "value": "-\(priceRuleValue).0",
                                                                    "customer_selection": customerSelectionStr,
                                                                    "starts_at": "2021-11-10T13:00:10Z"
                                                       ]
                                                   ]
                    
                    viewModelDiscount.postPriceRule(priceRule: priceRuleObj)
                }
                
                
                
            } label: {
                Text("Add Price Rule")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                
            }.alert("Please fill all Fields", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }}

            
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct AddPriceRule_Previews: PreviewProvider {
    static var previews: some View {
        AddPriceRule()
    }
}
