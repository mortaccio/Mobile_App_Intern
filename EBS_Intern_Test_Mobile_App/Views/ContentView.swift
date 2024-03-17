//
//  ContentView.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 14/03/2024.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack{
                ProductListView()
                    .padding(.top,40)
                    .padding(.bottom,40)
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView {
                    
                } favoritesMenuAction:{
                    
                }
            }
            
            //MY CART Button
            ZStack{
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .overlay(alignment: .bottom){
                Button{
                    
                }label: {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.buttons)
                        .overlay {
                            
                            HStack {
                                Image("ic-cart")
                                    .frame(width: 24,height: 24)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .padding()
                                    .colorInvert()
                                
                                Text("MY CART")
                                    .foregroundColor(.white)
                                    .font(Font.myCartActionButton)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 85,height: 85)
                                
                                Spacer()
                                    .frame(width: 24,height: 24)
                                    .frame(maxWidth: .infinity,alignment: .trailing)
                                    .padding()
                            }
                            
                        }
                        .frame(width: .infinity, height: 40)
                        .padding(10)
                }
                
            }
        }
    }
}
#Preview {
    ContentView()
}

