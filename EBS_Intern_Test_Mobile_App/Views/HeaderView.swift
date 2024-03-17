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
                        .aspectRatio(contentMode: .fit)
                        .colorInvert()
                }
                .frame(width: 24,height: 24)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                
                Image("ic-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 85,height: 85)
                Button {
                    favoritesMenuAction()
                } label: {
                    Image("ic-heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .colorInvert()
                }
                .frame(width: 24,height: 24)
                .frame(maxWidth: .infinity,alignment: .trailing)
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 45)
        .background(Color.accentColor)
        .shadow(radius: 0.3)
    }
}

