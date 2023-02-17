//
//  ProductDetailViewModel.swift
//  PhoneStoreApp
//
//  Created by i0240 on 09.01.2023.
//

import Foundation
import UIKit
import Alamofire

class ProductDetailsViewModel {
    func makeAPIRequest(completion: @escaping (Result<ProductDetails, Error>) -> Void) {
        let url = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        AF.request(url).responseDecodable(of: ProductDetails.self) { response in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else {
                        throw AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)
                    }
                    let decoder = JSONDecoder()
                    let productDetails = try decoder.decode(ProductDetails.self, from: data)
                    completion(.success(productDetails))
                    print("PRODUCT DETAILS ++++ \(productDetails)")
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

