//
//  FavoritesDatabase.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 16/03/2024.
//

import Foundation


final class Database {
    private let FavoriteKey = "FavoriteKey"
    
    func saveItems(favoriteProducts: Set<Int>){
        let array = Array(favoriteProducts)
        UserDefaults.standard.set(array, forKey: FavoriteKey)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FavoriteKey) as? [Int] ?? [Int]()
        return Set(array)
    }
}
