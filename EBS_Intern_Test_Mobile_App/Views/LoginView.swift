//
//  LoginView.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 03/06/2024.
//

import SwiftUI

struct LoginView: View {
    @State var user = ""
    @State var pass = ""
    var body : some View{
           VStack {
                Text("Wellcome back,").fontWeight(.heavy).font(.largeTitle).padding([.top,.bottom], 20)
                   .foregroundColor(.orange)
               VStack{
                   
                   VStack(alignment: .leading){
                       
                       VStack(alignment: .leading){
                           
                           Text("Username").font(.headline).fontWeight(.light).foregroundColor(Color.init(.label).opacity(0.75))
                           
                           HStack{
                               
                               TextField("Enter Your Username", text: $user)
                               
                               if user != ""{
                                   
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
                       
                   }) {
                       ZStack{
                           RoundedRectangle(cornerRadius: 100)
                               .frame(maxWidth: .infinity,maxHeight: 50)
                               .padding()
                           Text("Sign In").foregroundColor(.white).padding()
                       }
                       
                       
                   }.background(Color("color"))
                       .clipShape(Capsule())
                       .padding(.top, 45)
                   
                   
                   HStack(spacing: 8){
                       
                       Text("Don't Have An Account ?").foregroundColor(Color.gray.opacity(0.5))
                       
                       Button(action: {
                           
                       }) {
                           
                           Text("Sign Up")
                           
                       }.foregroundColor(.orange)
                       
                   }.padding(.top, 25)
               }
           }
       }
   }


#Preview {
    LoginView()
}
