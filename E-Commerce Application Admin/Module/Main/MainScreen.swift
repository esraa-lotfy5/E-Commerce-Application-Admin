//
//  MainScreen.swift
//  E-Commerce Application Admin
//
//  Created by Abdelrhman Ahmed on 17/06/2022.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        
        NavigationView{
            
            VStack {
            
                NavigationLink(destination: CreateCustomerView()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Create New Customer")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding()
                }
                NavigationLink(destination: ProductScreen()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Products")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding()
                }
                
                
                NavigationLink(destination: DiscountCodeScreen()
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Coupons")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding()
                }
                
//                NavigationLink(destination: Text("CRUD Gift Cards")
//                    .navigationBarBackButtonHidden(true)
//                ) {
//                    Text("Gift Cards")
//                        .bold()
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .foregroundColor(Color.white)
//                        .background(Color.green)
//                        .cornerRadius(10)
//                        .padding()
//                }
            }
       }.navigationBarHidden(true)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
