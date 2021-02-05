//
//  LoginPageView.swift
//  The Movie Database
//
//  Created by Sergey Lukaschuk on 04.02.2021.
//


import SwiftUI
import LocalAuthentication

struct LoginPageView : View {
    
    @State var userName = ""
    @State var password = ""
    @State var statusLogin: Bool = false
    
    //when first time user logged in via email store this for future biometric login
    @AppStorage("stored_User") var user = "s.lukaschuk@yahoo.com"
    @AppStorage("status") var logged: Bool = false
    
    
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
                .padding(.horizontal, 35) // Dynamic Frame
//                .frame(width: 180) // Not Dynamic Frame
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
            .padding(.leading, 15)
            
            // MARK: - Field Email
            
            HStack {
                
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                TextField("EMAIL", text: $userName)
                    .autocapitalization(.none)
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
                SecureField("PASSWORD", text: $password)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white.opacity(password == "" ? 0.0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            // MARK: - Button: login
            
            HStack(spacing: 15) {
            
                Button(action: authenticateUser2) {
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("green"))
                        .clipShape(Capsule())
                }
                .opacity(userName != "" && password != "" ? 1.0 : 0.5)
                .disabled(userName != "" && password != "" ? false : true)
                
                
                
                // MARK: - Face ID
                
                if getBioMetricStatus() {
                    
                    Button(action: {}) {
                        Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color("green"))
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.top)
            
            // MARK: - Button: forgot password
            
            Button(action: {}) {
                Text("Forgot password?")
                    .foregroundColor(Color("green"))
            }
            .padding(.top, 5.0)
            
            Spacer()
            
            // MARK: - Create account
            
            HStack(spacing: 10) {
                
                Text("Don't have an account?")
                    .foregroundColor(Color.white.opacity(0.6))
                
                Button(action: {}) {
                    Text("Signup")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("green"))
                }
            }
            .padding(.vertical)
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
    }
    
    // Getting BioMetricType...
    
    func getBioMetricStatus() -> Bool {
        
        let scanner = LAContext()
        if userName == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            return true
        }
        return false
    }
    
    // Authenticate User...
    
    func authenticateUser() {
        
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: "To Unlock \(userName)") { (status, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            // setting logged status as true...
            withAnimation(.easeOut) { logged = true }
        }
    }
    
    
    func authenticateUser2() {
        if (userName == "s.lukaschuk@yahoo.com") && (password == "123") {
            withAnimation(.easeOut) { logged = true }
        }
    }
    
}

