//
//  ExplorerViewModel.swift
//  PhoneStoreApp
//
//  Created by i0240 on 07.01.2023.
//

import Foundation
import Alamofire

class ExplorerViewModel: BottomExplorerCollectionViewCellDelegate{
    
    private var phones: [BestSellerProduct] = []
    
    func makeAPIRequest(completion: @escaping (ExplorerProducts) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                print(data)
                let response = try JSONDecoder().decode(ExplorerProducts.self, from: data)
                
                completion(response)
//                print(response)
                    } catch let error {
                        print(String(describing: error))
                    }
                }.resume()
    }
    
    func setFavorite(product: BestSellerProduct)  {
        if product.isFavorites == true {
            phones.append(product)
        } else {
            if let index = phones.firstIndex(where: { $0.id == product.id }) {
                phones.remove(at: index)
            }
        }
    }
}

