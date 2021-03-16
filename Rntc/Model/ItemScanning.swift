//
//  Scaning.swift
//  Rntc
//
//  Created by Domiik on 09.03.2021.
//

import Foundation
import Alamofire

class ItemScanning {
    
    let title: String
    var imagesUrl: String
    var rntcImage: UIImage?
    
    init(title: String, imagesUrl: String) {
        self.title = title
        self.imagesUrl = imagesUrl
    }
    
     func downloadImage(completed: @escaping DownloadComplete) {
        AF.request(self.imagesUrl).responseData { (response) in
            switch response.result {
            case .success(let value):
                if let image = UIImage(data: value) {
                    self.rntcImage = image
                }
                completed()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        completed()
    }

}
