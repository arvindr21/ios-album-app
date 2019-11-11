//
//  APIManager.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 10/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {

    let baseURL = "https://jsonplaceholder.typicode.com/"
    static let sharedInstance = APIManager()


    func getAll<T: Decodable>(api: String, decodable: T.Type, completion: @escaping (_ details: [T]) -> Void) {
        Alamofire.request(baseURL + api, method: .get).responseJSON { response in
            let result_ = response.data
            do {
                let data = try JSONDecoder().decode([T].self, from: result_!)
                print("data[0] : \(data[0])")
                completion(data)
            } catch let e as NSError {
                print("error : \(e)")
            }
        }
    }
    
}
