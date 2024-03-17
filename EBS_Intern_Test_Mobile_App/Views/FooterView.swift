//
//  FooterView.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 14/03/2024.
//

import SwiftUI

struct FooterView: View {
    
//    var addToCartAction: ButtonAction
//    var buyNowAction: ButtonAction
    
    var body: some View {
        ZStack{
            HStack(spacing: 0){
                Spacer()
                //Add To Cart Button
                Button {
                    
                } label: {
                    Image("ic-addToCart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(0)
                }
                //Buy Now Button
                Button {
                    
                } label: {
                    Image("ic-buyNow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(0)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(Color.background)
        .shadow(radius: 0.3)
    }
}

#Preview {
    FooterView()
}
