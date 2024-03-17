//
//  TextPriceExtension.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 15/03/2024.
//

import Foundation
import SwiftUI


extension Text {
    func priceFormat(_ price: Double) -> Text {
        let formattedPrice = String(format: "%.2f", price)
        let priceComponents = formattedPrice.components(separatedBy: ".")
        let priceString = priceComponents.first ?? ""
        return Text("$ \(priceString)")
    }
}
