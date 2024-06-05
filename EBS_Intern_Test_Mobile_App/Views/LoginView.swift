//
//  LoginView.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 03/06/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore

struct LoginView: View {
    @State var email = ""
    @State var pass = ""
    @State private var userIsLoggedIn = false
    
    var body : some View{
        if userIsLoggedIn == true{
            ContentView()
        } else {
            content
        }
    }
    
    var content : some View {
        VStack{
             Text("Wellcome").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
                .foregroundColor(.orange)
            VStack{
                
                VStack(alignment: .leading){
                    
                    VStack(alignment: .leading){
                        
                        Text("Email").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        HStack{
                            
                            TextField("cool@email", text: $email)
                            
                            
                            if email != ""{
                                
                                Image("check").foregroundColor(.orange)
                            }
                            
                        }
                        
                        Divider()
                        
                    }.padding(.bottom, 15)
                    
                    VStack(alignment: .leading){
                        
                        Text("Password").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                        
                        SecureField("Enter Your Password", text: $pass)
                        
                        Divider()
                    }
                      
                }.padding(.horizontal, 6)
             
            }.padding()
            VStack{
                
                Button(action: {
                    register()
                }) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 100)
                            .frame(maxWidth: .infinity,maxHeight: 50)
                            .padding()
                        Text("Sign up").foregroundColor(.white).padding()
                    }
                    
                    
                }.background(Color("color"))
                    .clipShape(Capsule())
                    .padding(.top, 45)
                
                
                HStack(spacing: 8){
                    
                    Text("Have an account?").foregroundColor(Color.gray.opacity(0.5))
                    
                    Button(action: {
                        login()
                    }) {
                        
                        Text("Sign in")
                        
                    }.foregroundColor(.orange)
                    
                }.padding(.top, 25)
            }
            .onAppear() {
                Auth.auth().addStateDidChangeListener {auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: pass) {result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: pass){ result, error in
            if error != nil{
                print (error!.localizedDescription)
            }
        }
    }
   }

#Preview {
    LoginView()
}
