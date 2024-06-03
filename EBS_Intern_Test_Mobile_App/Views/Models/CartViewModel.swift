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
            // Если продукт уже в корзине, увеличиваем его количество (если вам нужно учитывать количество)
            // products[index].quantity += 1 // Раскомментировать и добавить поле quantity в модель Product
        } else {
            let newProduct = product
            // newProduct.quantity = 1 // Раскомментировать и добавить поле quantity в модель Product
            products.append(newProduct)
        }
    }
    
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
}
