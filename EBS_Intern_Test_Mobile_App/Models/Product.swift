//
//  Product.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 14/03/2024.
//

import Foundation

struct Product: Identifiable, Hashable, Codable{
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}


