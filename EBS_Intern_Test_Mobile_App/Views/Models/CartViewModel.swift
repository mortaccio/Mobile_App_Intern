//
//  CartViewModel.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 18/05/2024.
//

import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func addToCart(product: Product) {
        if products.firstIndex(where: { $0.id == product.id }) != nil {
            
        } else {
            let newProduct = product
            
            products.append(newProduct)
        }
    }
    
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
}
