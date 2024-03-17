//
//  ProductDIsplayCardTransactions.swift
//  EBS_Intern_Test_Mobile_App
//
//  Created by Artiom on 14/03/2024.
//

import Foundation
import Combine
import Collections

func getTransactions() {
    guard let url = URL(string: "http://mobile-shop-api.hiring.devebs.net/products") else {
        print("Invalid Url")
        return
    }
    
    URLSession.shared.dataTaskPublisher(for: url)
        .tryMap { (data, response) -> Data in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                dump(response)
                throw URLError(.badServerResponse)
            }
            return data
        }
        .decode(type:[Transaction].self, decoder: JSONDecoder())
        .receive(on:DispatchQueue.main)
        .sink { complition in
            switch complition{
            case .failure(let error):
                print("Error fetching transactions", error.localizedDescription)
            case.finished:
                print("Finish fetching transactions")
            }
        } receiveValue: { [weak self] result in
            self?.transactions = result
        }
        .store(in: &cancellables)

}


