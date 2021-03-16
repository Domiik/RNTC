//
//  ApiCall.swift
//  RNTCiPiPStoryboard
//
//  Created by Domiik on 01.02.2021.
//  Copyright © 2021 Domiik. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}

enum ApiError: Error {
    case noData
    case noConnection
}

protocol ApiCall {
    func loginClient(completion: @escaping (Result<String, Error>) -> Void)
}



class ApiClient: ApiCall {
    
    var items = [ItemScanning]()
    
    
    func loginClient(completion: @escaping (Result<String, Error>) -> Void) {
        var title, imageUrl: String!
        if Connectivity.isConnectedToInternet {
            AF.request("http://rntc.bromanla.ml/skanirovaniye.json").responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            if let json = try? JSON(value) {
                                for item in json["items"].arrayValue {
                                    title = item["title"].string
                                    imageUrl = item["images"].string
                                    let item = ItemScanning(title: title, imagesUrl: imageUrl)
                                    self.items.append(item)
                                }
                                completion(.success("ok"))
                            }
                            break
                        case .failure(let error):
                            completion(.failure(ApiError.noData))
                        }
                       }
        } else {
            completion(.failure(ApiError.noConnection))
        }
        
    }
    
    
    
}
