//
//  LoginPageView.swift
//  The Movie Database
//
//  Created by Sergey Lukaschuk on 04.02.2021.
//

import SwiftUI

struct LoginPage : View {
    
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("The Movie Database")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .padding(.vertical)
            
            // MARK: - Title Logo
            
            HStack {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Please sing in to continue")
                        .foregroundColor(Color.white.opacity(0.5))
                }
                Spacer()
            }
            .padding()
            
            // MARK: - Field Email
            
            HStack {
                
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("EMAIL", text: $userName)
            }
            .padding()
            .background(Color.white.opacity(userName == "" ? 0.0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            
            // MARK: - Field Password
            
            HStack {
                
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("PASSWORD", text: $password)
            }
            .padding()
            .background(Color.white.opacity(password == "" ? 0.0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            // MARK: - Login Button
            
            Button(action: {}) {
                Text("LOGIN")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    .background(Color("green"))
                    .clipShape(Capsule())
            }
            .padding()
            
            // MARK: - Forget Button
            
            Button(action: {}) {
                Text("Forget password")
                    .foregroundColor(Color("green"))
            }
            .padding(.top, 5.0)
            
            Spacer()
            
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
    }
}

