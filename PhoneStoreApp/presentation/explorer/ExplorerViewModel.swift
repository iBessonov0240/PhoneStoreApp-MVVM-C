//
//  ExplorerViewModel.swift
//  PhoneStoreApp
//
//  Created by i0240 on 07.01.2023.
//

import Foundation

class ExplorerViewModel {
    func makeAPIRequest() {
        let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let products = try decoder.decode([ExplorerProducts].self, from: data)
                    // Use the products here
                    
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
