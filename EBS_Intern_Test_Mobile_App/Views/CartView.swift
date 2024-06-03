//
//  CartView.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 18/05/2024.
//

import Foundation
import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.products, id: \.id) { product in
                HStack {
                    AsyncImage(url: product.main_image) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 120, height: 100)
                    .cornerRadius(8)
                    
                    Text(product.name)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Text("$\(product.price, specifier: "%.2f")")
                    // Text("Quantity: \(product.quantity)") // Раскомментировать если учитываете количество
                    Button(action: {
                        viewModel.removeFromCart(product: product)
                    }) {
                        Image(systemName: "minus.circle")
                    }
                }
            }
        }
        .navigationBarTitle("Cart")
    }
}
