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
            
            LoginPage ()
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





