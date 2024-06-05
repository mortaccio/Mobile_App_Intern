//
//  HeaderView.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 14/03/2024.
//

import SwiftUI

struct HeaderView: View {
    
    var userMenuAction: ButtonAction
    var favoritesMenuAction: ButtonAction
    
    var body: some View {
        ZStack{
            HStack{
                Button {
                    userMenuAction()
                } label: {
                    Image("ic-user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom, 15)
                }
                .frame(width: 24,height: 24)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                HStack{
                    Text("TECH").font(Font.system(.largeTitle))
                        .aspectRatio(contentMode: .fill)
                        .bold()
                        .padding(.bottom, 15)
                        
                    Image("ic-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity,height: 50)
                        .padding(.bottom, 15)
                    Text("DEUS").font(Font.system(.largeTitle))
                        .aspectRatio(contentMode: .fill)
                        .bold()
                        .padding(.bottom, 15)
                }
                Button {
                    favoritesMenuAction()
                } label: {
                    Image("ic-heart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom, 15)
                }
                .frame(width: 24,height: 24)
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 45)
        .background(Color.orange)
        .shadow(radius: 0.3)
    }
}

#Preview {
    ContentView()
}

