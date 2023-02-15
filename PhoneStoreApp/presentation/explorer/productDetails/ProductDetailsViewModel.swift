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
        func makeAPIRequest(completion: @escaping (ProductDetails) -> Void) {
            AF.request("https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5").responseDecodable(of: ProductDetails.self) { response in
                switch response.result {
                case .success(let productDetails):
                    print("CPU: \(productDetails.cpu)")
                    print("Camera: \(productDetails.camera)")
                    // Access other properties of the object as needed
                case .failure(let error):
                    print("Error parsing JSON: \(error.localizedDescription)")
                }
            }
        }
}

