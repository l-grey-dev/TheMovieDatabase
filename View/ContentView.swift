//
//  ContentView.swift
//  The Movie Database
//
//  Created by Sergey Lukaschuk on 04.02.2021.
//

import SwiftUI


struct ContentView: View {
   
  @AppStorage("status") var logged = false

    var body: some View {
     
        NavigationView {
            
            if logged {
                Text("User Logged In...")
                    .navigationTitle("Home")
                    .navigationBarHidden(false)
                    .preferredColorScheme(.light)
            } else {
                LoginPageView ()
                    .preferredColorScheme(.dark)
                    .navigationBarHidden(true)
            }
        }
    }
    
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





