//
//  Endpoint.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 11/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import Foundation

protocol Endpoint {

    var base: String { get }
    var path: String { get }
    var method: String { get }
}

extension Endpoint {

    var apiKey: String {
        return "api_key=34a92f7d77a168fdcd9a46ee1863edf1"
    }

    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
//        components.query = apiKey
        return components
    }

    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        // set Method type
        request.httpMethod = method
        // set the API Key in the header
        request.setValue("x-api-key", forHTTPHeaderField: apiKey)
        return request
    }
}
