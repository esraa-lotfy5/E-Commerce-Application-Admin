//
//  AddProductScreen.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import SwiftUI
import Alamofire

struct AddProductScreen: View {
    @State var productVendor : String = ""
    @State var productName : String = ""
    @State var productDescription : String = ""
    @State var productType : String = ""
    @State var productTags : String = ""
    @State var productPrice : String = ""
    @State var productSize : String = ""
    @State var productColor : String = ""
    @State var productImageURL : String = ""
    @State var confirmPassword: String = ""
    @State var errorMessage: String = ""
    @State var confirmationMessage: String = ""
    
    @ObservedObject var addProductViewModel : AddProductViewModel = AddProductViewModel()
    @State private var isActive = false
    
    var body: some View {
        VStack{
            AddProductNavigationBar()
            
                
                VStack {
                    TextField("Product Name", text: $productName)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
                
                
                
                VStack {
                    TextField("Product Description", text: $productDescription)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
                
                
                
                VStack {
                    TextField("Product Vendor", text: $productVendor)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
                
                VStack {
                    TextField("product type", text: $productType)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
            
                VStack {
                    TextField("Price", text: $productPrice)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
            
                VStack {
                    TextField("Size", text: $productSize)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
            
                VStack {
                    TextField("Color", text: $productColor)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
                
                VStack (alignment: .leading){
                    Text("WARNING: Tags must be sepreted by '|'")
                        .frame(alignment: .leading)
                        .font(.system(size: 15))
                        .foregroundColor(.green)
                        .padding(.leading)
                    TextField("product Tags", text: $productTags)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.blue)
                    
                    Divider().padding()
                }
            }
            VStack{
                NavigationLink(destination: ProductScreen(), isActive: $isActive) { EmptyView()}
                Button(action: {
                    if self.validateCreation() {
                        // continue with register
                        DispatchQueue.main.async{
                            createProduct()
                            isActive = true
                        }
                    }
                        
                }) {
                    Text("Save")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                    .padding().frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                
                
                Text(self.errorMessage)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                
                Text(self.confirmationMessage)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                
            }.navigationBarHidden(true)
            
//            Spacer().frame(height: 100)
                
        }
    
        func validateCreation() -> Bool {
            if !validateFields() {
                self.showErrorMessage("Please fill all the fields!")
                return false
            } else {
                // continue with creation
                return true
            }
        }
    
        func validateFields() -> Bool {
            
            if self.productName.count > 0 && self.productVendor.count > 0 && self.productType.count > 0 && self.productTags.count > 0 && self.productDescription.count > 0 && self.productColor.count > 0 && self.productSize.count > 0 && self.productPrice.count > 0  {
                return true
            }
            
            return false
        }
        
        func showErrorMessage(_ errorMessage: String) {
            self.confirmationMessage = ""
            self.errorMessage = errorMessage
        }
        
        func showConfirmationMessage(_ confirmationMessage: String) {
            self.errorMessage = ""
            self.confirmationMessage = confirmationMessage
        }
        
        
        func createProduct() {
            let tags = productTags.split(separator: "|")
            print("product color: \(productColor)")
            let product: Parameters = [ "product": [
                "title": "\(productVendor)|\(productName)",
                "body_html": productDescription,
                "vendor": productVendor,
                "product_type": productType,
                "tags": tags,
                "variants": [[
                    "title":"\(productSize)|\(productColor)",
                    "price": productPrice,
                    "option1": productSize,
                    "option2": productColor
                ]],
                "images": [[
                    "src":"http://example.com/rails_logo.gif"
                ]]
            ]
            ]
            

            addProductViewModel.createProduct(product: product) { result in

                switch result {

                case .success(let product):
                    print("product created successfully , product name: \(product?.title)")

                case .failure(let error):
                    showErrorMessage(error.localizedDescription)
                }
            }
        }

    }


struct AddProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddProductScreen()
    }
}
