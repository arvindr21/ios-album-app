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

    func getAll(api: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(JSON) -> Void) {

        Alamofire.request(baseURL + api)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GETALL on \(api)")
                    print(response.result.error!)
                    onFailure(JSON([
                        "error": response.result.error!
                    ]))
                    return
                }

                let json = JSON(response.result.value!)

                onSuccess(json)

        }

    }

    func getOne(objId: Int, api: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(JSON) -> Void) {

        Alamofire.request(baseURL + api + String(objId))
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on \(api)")
                    print(response.result.error!)
                    onFailure(JSON([
                        "error": response.result.error!
                    ]))
                    return
                }

                let json = JSON(response.result.value!)

                onSuccess(json)
        }

    }

    func create(data: Any, api: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(JSON) -> Void) {

        Alamofire.request(baseURL + api, method: .post, parameters: data as? Parameters)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling CREATE on \(api)")
                    print(response.result.error!)
                    onFailure(JSON([
                        "error": response.result.error!
                    ]))
                    return
                }

                let json = JSON(response.result.value!)

                onSuccess(json)
        }

    }

    func update(objId: Int, data: Any, api: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(JSON) -> Void) {

        Alamofire.request(baseURL + api + String(objId), method: .put, parameters: data as? Parameters)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling UPDATE on \(api)")
                    print(response.result.error!)
                    onFailure(JSON([
                        "error": response.result.error!
                    ]))
                    return
                }

                let json = JSON(response.result.value!)

                onSuccess(json)
        }

    }

    func delete(objId: Int, api: String, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(JSON) -> Void) {

        Alamofire.request(baseURL + api + String(objId), method: .delete)
            .responseJSON { response in
                // check for errors
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling GET on \(api)")
                    print(response.result.error!)
                    onFailure(JSON([
                        "error": response.result.error!
                    ]))
                    return
                }

                let json = JSON(response.result.value!)

                onSuccess(json)
        }

    }

}
