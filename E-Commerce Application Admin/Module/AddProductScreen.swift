//
//  AddProductScreen.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import SwiftUI
import Alamofire

struct AddProductScreen: View {
    @State var editing : Bool = false
    @State var productID : Int = -1
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
    
    init(){}
    
    init(editingProduct: Product){
        self.init()
        self.editing = true
        self.productID = editingProduct.id ?? -1
        self.productName = editingProduct.title ?? ""
        self.productDescription = editingProduct.bodyHTML ?? ""
        self.productVendor = editingProduct.vendor ?? ""
        self.productType = editingProduct.productType ?? ""
        self.productTags = editingProduct.tags ?? ""
        self.productPrice = editingProduct.variants?[0].price ?? ""
        self.productSize = editingProduct.variants?[0].option1 ?? ""
        self.productColor = editingProduct.variants?[0].option2 ?? ""
    }
    
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
                        if(!editing){
                        // continue with register
                        DispatchQueue.main.async{
                            createProduct()
                            isActive = true
                        }
                        }else{
                            // edit product
                            DispatchQueue.main.async{
                                updateProduct()
                                isActive = true
                            }
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
//            let product: Parameters = [ "product": [
//                "title": "\(productVendor)|\(productName)",
//                "body_html": productDescription,
//                "vendor": productVendor,
//                "product_type": productType,
//                "tags": tags,
//                "variants": [[
//                    "title":"\(productSize)|\(productColor)",
//                    "price": productPrice,
//                    "option1": productSize,
//                    "option2": productColor
//                ]],
//                "images": [[
//                    "src":"http://example.com/rails_logo.gif"
//                ]]
//            ]
//            ]
            let product = Product()
            product.title = "\(productVendor)|\(productName)"
            product.bodyHTML = productDescription
            product.vendor = productVendor
            product.productType = productType
            product.tags = productTags.replacingOccurrences(of: "|", with: ",")
            product.variants?[0].price = productPrice
            product.variants?[0].option1 = productSize
            product.variants?[0].option2 = productColor
//            do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try! jsonEncoder.encode(product)
            //let json = String(data: jsonData, encoding: String.Encoding.utf8)
            //print("json: \(json)")
//            }catch(error){
//                print("error occured while ")
//            }
            addProductViewModel.createProduct(product: jsonData) { result in

                switch result {

                case .success(let product):
                    print("product created successfully , product name: \(product?.title)")

                case .failure(let error):
                    showErrorMessage(error.localizedDescription)
                }
            }
        }
    
    func updateProduct() {
        let tags = productTags.split(separator: "|")
        print("product color: \(productColor)")
        let product: Parameters = [ "product": [
            "title": "\(productVendor)|\(productName)",
            "body_html": productDescription,
            "vendor": productVendor,
            "product_type": productType,
            "tags": tags,
            "variants": [[
                "title":"\(productSize) / \(productColor)",
                "price": productPrice,
                "option1": productSize,
                "option2": productColor
            ]],
            "images": [[
                "src":"http://example.com/rails_logo.gif"
            ]]
        ]
        ]
        

        addProductViewModel.updateProduct(productId: productID ,product: product) { result in

            switch result {

            case .success(let product):
                print("product updated successfully , product name: \(product?.title)")

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
