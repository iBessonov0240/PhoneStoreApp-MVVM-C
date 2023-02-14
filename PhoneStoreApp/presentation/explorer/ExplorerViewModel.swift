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
                
//                for product in response.homeStore {
//                    print("Product ID: \(product.id)")
//                    print("Title: \(product.title)")
//                    print("Subtitle: \(product.subtitle)")
//                    print("Picture URL: \(product.picture)")
//                    print("Is New: \(product.isNew)")
//                    print("Is Buy: \(product.isBuy)")
//                }
//            
//                for product in response.bestSeller {
//                                print("Product ID: \(product.id)")
//                                print("Title: \(product.title)")
//                                print("Price without discount: \(product.priceWithoutDiscount)")
//                                print("Discount price: \(product.discountPrice)")
//                                print("Picture URL: \(product.picture)")
//                                print("Is favorites: \(product.isFavorites)")
//                            }
                        
//                        print(response)
                    } catch let error {
                        print(String(describing: error))
                    }
                }.resume()
    }
    
//    func makeAPIRequest(completion: @escaping (ExplorerProducts) -> Void) {
//        AF.request("https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175").responseDecodable(of: ExplorerProducts.self) { (response) in
//            switch response.result {
//            case .success(let explorerProducts):
//                completion(explorerProducts)
//                if ((response.result) != nil) {
//                    let jsonData = response.data
//
//                    do {
//                        let decoder = JSONDecoder()
//                        let jsonnDict = try decoder.decode(ExplorerProducts.self, from: jsonData!)
//                        print(jsonnDict)
//                    } catch {
//                        print("Error: \(error)")
//                    }
//                }
//                print(explorerProducts)
//            case .failure(let error):
//                // handle error
//                print(error)
//            }
//        }
//    }
    
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

