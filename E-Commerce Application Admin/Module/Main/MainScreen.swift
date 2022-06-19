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
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                NavigationLink(destination: Text("CRUD Product")
                    .navigationBarBackButtonHidden(true)
//                NavigationLink(destination: ProductScreen()
//                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Products")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                
                NavigationLink(destination: Text("CRUD Inventory")
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Inventory")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                
                NavigationLink(destination: Text("CRUD Coupons")
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Coupons")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                
                NavigationLink(destination: Text("CRUD Gift Cards")
                    .navigationBarBackButtonHidden(true)
                ) {
                    Text("Gift Cards")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
                
            }
            
        }
        
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
