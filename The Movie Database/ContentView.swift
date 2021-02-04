//
//  ContentView.swift
//  The Movie Database
//
//  Created by Sergey Lukaschuk on 04.02.2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            Home()
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
    }
}


struct Home: View {
    
    @State var userName = ""
    @State var password = ""
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .padding(.vertical)
            
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
            
            HStack {
                
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("EMAIL", text: $userName)
            }
            .padding()
            .background(Color.white.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            
            HStack {
                
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("PASSWORD", text: $password)
            }
            .padding()
            .background(Color.white.opacity(0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
//        .foregroundColor(.white)
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





