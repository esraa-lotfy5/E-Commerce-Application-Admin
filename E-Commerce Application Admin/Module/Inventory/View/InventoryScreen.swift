//
//  InventoryScreen.swift
//  E-Commerce Application Admin
//
//  Created by Nour Gweda on 24/06/2022.
//

import SwiftUI

struct InventoryScreen: View {
    @State var inventoryItemId : Int?
    @ObservedObject  var viewModelInventory = InventoryViewModel()
    @State var textInventoryId: String = ""
    @State var showingAlert = false
    @State var itemInventory : InventoryLevel?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

//    init (inventoryItemId : Int){
//        self.inventoryItemId = inventoryItemId
//    }
    
    
    var body: some View {
        
        VStack{
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
                
                Text("Inventory Item")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
            }
            

           VStack{

                Text(" Available Items = \(viewModelInventory.inventoryArr?.available ?? 0)")
                    .foregroundColor(Color.green)
                    .font(.title2)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    //.border(.gray)
                    .cornerRadius(5)
                    .padding()
                    
                
                
        Button {
            print("\nButton is pressed\n")
            
            viewModelInventory.getInventoryLevel(inventoryItemId: inventoryItemId! )
            self.itemInventory = viewModelInventory.inventoryArr
           // print("id== \(inventoryItemId!)")

        } label: {
            Text("Get Quantity")
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(10)
                .padding()
  
        }
        //.padding()


            }
            
            
            
            Text ("To check the quantity of a specific item for a certain location of this shop")
                .lineLimit(.max)
                .font(.body)
                .foregroundColor(Color.gray)

                
            
            
           // Spacer()
            Divider()
            //Spacer()

        ////////edit inventory item
//        Button {
//                                                   let inventoryItemObj = [
//                    "location_id": Constants.locationId,
//                    "inventory_item_id": 43702138863789,
//                    "available_adjustment": -1
//              ]
//                    viewModelInventory.updateInventoryLevel(inventoryItem: inventoryItemObj)
//        } label: {
//            Text("update value the inventory item of certain item")
//                .padding()
//                .foregroundColor(.blue)
//
//        }
         //end of edit button
            
            //start of search field
            HStack{
            VStack {
                TextField("Input the number of updated quantity", text: $textInventoryId)
                    .textFieldStyle(.roundedBorder)
                    .padding()
//                    .foregroundColor(Color.blue)
//                    .border(.gray)
//                    .cornerRadius(5)
                
                //start of button
                /////// post inventory item of available item
                Button {
                    if textInventoryId.isEmpty{
                        showingAlert = true
                    }else{
                        
                        let inventoryItemObj = [
                        "location_id": Constants.locationId,
                        "inventory_item_id": inventoryItemId!,
                        "available": Int(textInventoryId)
                         ]
                        viewModelInventory.postInventoryLevel(inventoryItem: inventoryItemObj)
                    }

                } label: {
                    Text("Add")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding()
                        
                }.alert("the input isn't correct", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
                //end of button
                
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.decimalPad)
            }
            //.padding()
        

            Text ("To add the quantity of a specific item for a certain location of this shop,this field adjust the quantity and not increase , this field accept only a number")
                .font(.body)
                .foregroundColor(Color.gray)
                .lineLimit(.max)

            
        //Spacer()
            

        }.navigationBarBackButtonHidden(true)
        Spacer()
    }
}

struct InventoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        InventoryScreen()
    }
}

