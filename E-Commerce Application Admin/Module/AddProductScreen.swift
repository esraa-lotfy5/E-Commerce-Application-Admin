//
//  AddProductScreen.swift
//  E-Commerce Application Admin
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import SwiftUI
import Alamofire

struct AddProductScreen: View {
    var editedProduct : Product = items[0]
    @State var editingMode: Bool = false
    @State var productVendor : String = ""
    @State var productName : String = ""
    @State var productDescription : String = ""
    @State var productType : String = ""
    @State var productTags : String = ""
    @State var productPrice : String = ""
    @State var productSize : String = ""
    @State var productColor : String = ""
    @State var imageOneURL = ""
    @State var imageTwoURL = ""
    @State var imageThreeURL = ""
    @State var imageFourURL = ""
    @State var confirmPassword: String = ""
    @State var errorMessage: String = ""
    @State var confirmationMessage: String = ""
    
    @ObservedObject var addProductViewModel : AddProductViewModel = AddProductViewModel()
    @State private var isActive = false
    
    init(){}
    init(product: Product){
        self.init()
        self.editedProduct = product
        self.editingMode = true
        self.productVendor = product.vendor ?? ""
        self.productName = String(product.title?.split(separator: "|")[1] ?? "")
        self.productDescription = product.bodyHTML ?? ""
        self.productType = product.productType ?? ""
        self.productTags = product.tags ?? ""
        self.productPrice = product.variants?[0].price ?? ""
        self.productSize = product.variants?[0].option1 ?? ""
        self.productColor = product.variants?[0].option2 ?? ""
        self.imageOneURL = product.images?[0].src ?? ""
        self.imageTwoURL = product.images?[1].src ?? ""
        self.imageThreeURL = product.images?[2].src ?? ""
        self.imageFourURL = product.images?[3].src ?? ""
    }
    
    var body: some View {
        ScrollView{
            AddProductNavigationBar()
            VStack{
                
                VStack (alignment: .leading){
                    Text("Product name")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .padding(.leading)
                    TextField("Product Name", text: $productName)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }

                
                VStack (alignment: .leading){
                    Text("Product description")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .padding(.leading)
                    TextField("Product Description", text: $productDescription)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
                
                
                
                VStack (alignment: .leading){
                    Text("Product vendor")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .padding(.leading)
                    TextField("Product Vendor", text: $productVendor)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
                
                VStack (alignment: .leading){
                    Text("Product Type")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .padding(.leading)
                    TextField("product type", text: $productType)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
            
                VStack (alignment: .leading){
                    Text("Product price")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .padding(.leading)
                    TextField("Price", text: $productPrice)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
            
                VStack (alignment: .leading){
                    Text("Product size")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .padding(.leading)
                    TextField("Size", text: $productSize)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
            
                VStack (alignment: .leading){
                    Text("Product color")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .padding(.leading)
                    TextField("Color", text: $productColor)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
                
                VStack (alignment: .leading){
                    Text("Product Tags")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(alignment: .leading)
                        .padding(.leading)
                        
                    Text("WARNING: Tags must be sepreted by '|'")
                        .frame(alignment: .leading)
                        .font(.system(size: 15))
                        .foregroundColor(.green)
                        .padding(.leading)
                    TextField("product Tags", text: $productTags)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    
                    Divider().padding()
                }
            
            VStack (alignment: .leading){
                Text("Product Images")
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .frame(alignment: .leading)
                    .padding(.leading)
                
                Text("Images' url must be sepreted by '|'")
                    .frame(alignment: .leading)
                    .font(.system(size: 15))
                    .foregroundColor(.green)
                    .padding(.leading)
                
                HStack{
                    
                    TextField("First", text: $imageOneURL)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.gray)
                    TextField("Second", text: $imageTwoURL)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    TextField("Third", text: $imageThreeURL)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                    TextField("Fourth", text: $imageFourURL)
                        .padding()
                        .padding(.bottom, -25)
                        .foregroundColor(Color.black)
                }
                
                Divider().padding()
            }
            }
        }
        
            VStack{
                NavigationLink(destination: ProductScreen(), isActive: $isActive) { EmptyView()}
                Button(action: {
                    if self.validateCreation() {
                        if(editingMode){
                            // continue with register
                            DispatchQueue.main.async{
                                updateProduct()
                                isActive = true
                            }
                        }else{
                            // continue with register
                            DispatchQueue.main.async{
                                createProduct()
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
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding()
                
                
                Text(self.errorMessage)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                
                Text(self.confirmationMessage)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                
            }.navigationBarHidden(true)
            
            Spacer().frame(height: 16)
                
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
            
            if self.productName.count > 0 && self.productVendor.count > 0 && self.productType.count > 0 && self.productTags.count > 0 && self.productDescription.count > 0 && self.productColor.count > 0 && self.productSize.count > 0 && self.productPrice.count > 0 && self.imageOneURL.count > 0 && self.imageTwoURL.count > 0 && self.imageThreeURL.count > 0 && self.imageFourURL.count > 0   {
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
                "images": [
                    ["src": imageOneURL],
                    ["src": imageTwoURL],
                    ["src": imageThreeURL],
                    ["src": imageFourURL]
                ],
                "options": [
                    [
                        "name": "Color",
                        "position": 1,
                        "values": productColor
                    ],
                    [
                        "name": "Size",
                        "position": 1,
                        "values": productSize
                    ]
            ]
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
                "title":"\(productSize)|\(productColor)",
                "price": productPrice,
                "option1": productSize,
                "option2": productColor
            ]],
            "images": [
                ["src": imageOneURL],
                ["src": imageTwoURL],
                ["src": imageThreeURL],
                ["src": imageFourURL]
            ],
            "options": [
                [
                    "name": "Color",
                    "position": 1,
                    "values": productColor
                ],
                [
                    "name": "Size",
                    "position": 1,
                    "values": productSize
                ]
        ]
        ]
        ]

        addProductViewModel.updateProduct(productID :editedProduct.id ?? -1 , product: product) { result in

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
