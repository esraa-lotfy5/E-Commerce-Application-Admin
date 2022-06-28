//
//  ProductDetailsScreen.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 19/06/2022.
//

import SwiftUI
import Kingfisher

struct ProductDetailsScreen: View {
    @State var product : Product
    
    @State private var presentAlert = false
    @State var selectedSize = ""
    @State var selectedColor = ""
//    @State var editingEnabled = false
    
    @State var isAvailable : Bool = false
    @State var addToCartColor : Color = Color.green
    @State var productQuantity = 0
    @State var productVariants : [Variant] = []
    @State var varients : [String] = []

    
    @State var varientInventoryID:Int?

    @State var isAlertInventory : Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    @ObservedObject var productDetailsViewModel : ProductDetailsViewModel = ProductDetailsViewModel()
    
    let colorGray = Color(red: 232/255, green: 232/255, blue: 232/255)
    let colorWhite = Color(red: 1, green: 1, blue: 1)
    var productSizes = "OS"
    var productColors = "black"
        
    var body: some View {
        ScrollView {
        VStack{
            //------------- Start of Naviagtion Bar --------------------
            ProductDetailsNavigationBar(product: self.$product)
            //------------ End of Navigation Bar -----------------------
            
            //------------ Start of Product details --------------------
            //---------- Product ID ----------
            
                //#TODO: product Image -----------------------
                PageView(pages: [
                    FeatureCard(image:
                                    KFImage.url(URL(string:
                                                        product.images?[0].src ?? "" ))
                                        .placeholder { Image("default") }
                        .resizable()
                        .onSuccess { r in print("done") }
                        .onFailure { r in print("failure") }
                        .loadImmediately()),
                    
                    FeatureCard(image:  KFImage.url(URL(string:    product.images![1].src ))
                        .placeholder { Image("default") }
                        .resizable()
                        .onSuccess { r in print("done") }
                        .onFailure { r in print("failure") }
                        .loadImmediately()),
                    
                    FeatureCard(image: KFImage.url(URL(string:    product.images?[2].src ?? ""))
                        .placeholder { Image("default") }
                        .resizable()
                        .onSuccess { r in print("done") }
                        .onFailure { r in print("failure") }
                        .loadImmediately())
                ]).frame( height: 300)

            
                VStack(alignment: .leading) {
                    //#TODO: TITLE AND PRICE
                    HStack {
                        Text(product.title?.split(separator: "|")[1] ?? "nothing").bold() // product.title ??
                        Spacer()
                        Text("$\(product.variants?[0].price ?? "" )").foregroundColor(.blue)
                    }


                    //#TODO: HTML BODY
                    VStack(alignment: .center){

                        Spacer()
                        Text(product.bodyHTML ?? "") //product.body_html ??
                            .font(.subheadline)
                            .foregroundColor(.secondary).padding(.top, 5).padding(.bottom, 5)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .topLeading
                            )
                    }

            
                    //#TODO: Inventory Level BUTTON
                   // NavigationLink(destination: Text("CRUD Gift Cards").navigationBarBackButtonHidden(true)
                    //)
                    
                    Button(action: {
                        print("Go to Inventory level")
                        for varient in product.variants ?? []{
                            if( ((varient.title?.split(separator: "/")[0].trimmingCharacters(in: .whitespaces) ?? "") == selectedSize.trimmingCharacters(in: .whitespaces)) && (varient.title?.split(separator: "/")[1].trimmingCharacters(in: .whitespaces) ?? "" == selectedColor.trimmingCharacters(in: .whitespaces))){
                                varientInventoryID = varient.inventoryItemID ?? -1
                                print("varient id: ->>>>> \(varientInventoryID ?? -1)")
                            }
                        }
                        print("from details == \(product.variants?[0].inventoryItemID ?? 0)")
                        isAlertInventory.toggle()
                    })
                    {
                        Text("Inventory level").bold()
                    }.padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(addToCartColor)
                        .cornerRadius(10)
                        .disabled(isAvailable)
                        
                    .background(NavigationLink(destination:  // link in background
                       InventoryScreen(inventoryItemId: varientInventoryID), isActive: $isAlertInventory) { EmptyView() })


                    //TODO: Details
                    Text("Details").bold()
                    
                    //TODO: Vendor
                    HStack {
                        Text("Vendor")
                        Spacer()
                        Text(product.vendor ?? "")
                    }.padding().background(colorGray)
                    
                    //TODO: Product Type
                    HStack {
                        Text("Type")
                        Spacer()
                        Text(product.productType ?? "")
                    }.padding().background(colorWhite)
                    
                    //TODO: Sizes
                    VStack{
                    HStack {
                        Text("Sizes")
                        Spacer(minLength: 100)
                        Picker(selection: $selectedSize, label: Text("Select size")) {
                            ForEach(product.options?.first?.values.map { $0 } ?? ["N/A"], id: \.self) {
                                Text($0)
                            }
                       }.pickerStyle(MenuPickerStyle())
                    }.frame(height: 50)
                        .padding(.leading)
                        .padding(.trailing)
                }.background(colorGray)
                    
                //TODO: Colors
                VStack{
                HStack {
                    Text("Colors")
                    Spacer(minLength: 100)
                    Picker("Select color" ,selection: $selectedColor) {
                                   ForEach(product.options?.last?.values.map { $0 } ?? ["N/A"], id: \.self) {
                                       Text($0)
                                   }
                               }
                               .pickerStyle(.menu)
                
                }.frame(height: 50)
                    .padding(.leading)
                    .padding(.trailing)
                    .background(colorWhite)
                    }.padding(.top, -8)
                }.padding()
            }
            //------------ End of Product details ----------------------
        }.navigationBarHidden(true)
            .onAppear{
                selectedSize = product.options?.first?.values.map { $0 [0]} ?? ""
                selectedColor = product.options?.last?.values.map { $0 [0]} ?? ""
            }
    }
}


struct ProductDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsScreen(product: items[0])
    }
}
