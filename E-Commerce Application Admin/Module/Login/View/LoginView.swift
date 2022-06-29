//
//  LoginView.swift
//  E-Commerce Application Admin
//
//  Created by Abdelrhman Ahmed on 29/06/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var proceedWithLogin = false
    
    var body: some View {
        
        NavigationView {
         
            VStack {
                
                TextField("Enter Store Password", text: $password)
                    .padding()
                    .padding(.bottom, -25)
                    .foregroundColor(Color.blue)
                
                Button(action: {
                    
                    if self.validateLogin() {
                        // continue with register
                        loginAdmin()
                    }
                    
                }) {
                    
                    Text("Login").bold().frame(maxWidth: .infinity)
                    
                }.padding().frame(maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding()
                
                Text(self.errorMessage)
                    .foregroundColor(Color.red)
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: MainScreen().navigationBarBackButtonHidden(true), isActive: $proceedWithLogin) {
                    EmptyView()
                }
                
            }
            
        }
        
    }
    
    func validateLogin() -> Bool {
        
        if !validateFields() {
            
            self.showErrorMessage("You need to provide password to continue!")
            return false
            
        } else if !validatePassword() {
            
            self.showErrorMessage("Wrong password!")
            return false
            
        } else {
            
            // continue with login
            return true
            
        }
        
    }
    
    func validateFields() -> Bool {
        
        if self.password.count > 0 {
            return true
        }
        
        return false
        
    }
    
    func validatePassword() -> Bool {
        
        if self.password == Constants.loginPassword {
            return true
        }
        
        return false
        
    }
    
    func showErrorMessage(_ errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    func loginAdmin() {
        proceedWithLogin = true
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
