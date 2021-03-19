//
//  DataService.swift
//  Rntc
//
//  Created by Domiik on 10.03.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    static let instance = DataService()
    
    var items = [ItemScanning]()
    
    func downloadItem(url: String,completionHandler: @escaping (Bool) -> ()) {
        var title, imageUrl: String!
        if Connectivity.isConnectedToInternet {
            AF.request(url).responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = try? JSON(value) {
                        for item in json["items"].arrayValue {
                            title = item["title"].string
                            imageUrl = item["images"].string
                            let item = ItemScanning(title: title, imagesUrl: imageUrl)
                            self.items.append(item)
                        }
                        completionHandler(true)
                    }
                    break
                case .failure(let error):
                    print(error)
                    completionHandler(false)
                    break
                }
            }
        } else {
            UIAlert
            completionHandler(false)
        }
    }
    
    
    func removeAllItem() {
        items.removeAll()
    }
}
