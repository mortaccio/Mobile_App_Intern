//
//  ProductListModel.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 14/03/2024.
//

import Foundation

// Структура для представления категории продукта
struct Category: Codable , Identifiable , Hashable{
    let name: String
    let icon: URL
    let id: Int
}

// Структура для представления данных продукта
struct Product: Codable , Identifiable, Hashable{
    let category: Category
    let name: String
    let details: String
    let size: String
    let colour: String
    let price: Double
    let main_image: URL
    let id: Int
}

// Структура для представления ответа от API
struct APIResponse: Codable, Hashable {
    let count: Int
    let total_pages: Int
    let per_page: Int
    let current_page: Int
    let results: [Product]
}
class ProductListModel: ObservableObject {
    // Функция для получения данных с API
    func fetchProducts(page: Int, pageSize: Int, completion: @escaping (APIResponse?, Error?) -> Void) {
        // Создаем URL из строки
        guard var urlComponents = URLComponents(string: "http://mobile-shop-api.hiring.devebs.net/products") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        // Добавляем параметры запроса
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "page_size", value: "\(pageSize)")
        ]
        
        // Получаем URL из URLComponents
        guard let url = urlComponents.url else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        // Создаем сессию URLSession
        let session = URLSession.shared
        
        // Создаем задачу для выполнения запроса
        let task = session.dataTask(with: url) { data, response, error in
            // Проверяем наличие ошибки
            if let error = error {
                completion(nil, error)
                return
            }
            
            // Проверяем наличие данных
            guard let responseData = data else {
                completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
                return
            }
            
            do {
                // Декодируем полученные данные в объект APIResponse
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: responseData)
                completion(apiResponse, nil)
            } catch {
                // В случае ошибки декодирования, возвращаем ошибку
                completion(nil, error)
            }
        }
        
        // Запускаем задачу
        task.resume()
    }
}




