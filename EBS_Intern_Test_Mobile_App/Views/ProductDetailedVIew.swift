//
//  ProductDetailedVIew.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 15/03/2024.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @State private var isFavorite: Bool
    @State private var inCartProducts: Set<Product> = []
    init(product: Product, isFavorite: Bool) {
            self.product = product
            self._isFavorite = State(initialValue: isFavorite)
        }
    var body: some View {
        
        NavigationView{
            VStack {
                AsyncImage(url: product.main_image) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity,maxHeight: 500,alignment: .top)
                VStack{
                    Text(product.name)
                        .font(Font.productTitle)
                        .foregroundStyle(Color.black)
                    
                    Text("$ \(product.price)")
                        .font(Font.productActualPrice)
                        .foregroundStyle(Color.price)
                }
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity,maxHeight: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 1)
                        .stroke(Color.details, lineWidth: 0.5)
                )
                HStack{
                    Text("Information")
                        .font(Font.informationTitle)
                        .foregroundStyle(Color.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                }
                
                Text(product.details)
                    .foregroundStyle(Color.details)
                    .font(Font.productDescription)
                    .padding()
            }
        }
    }
}

