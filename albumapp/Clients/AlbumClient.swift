//
//  AlbumClient.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 11/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import Foundation

enum AlbumFeed {
    case GETALL
    case GETONE
    case CREATE
    case UPDATE
    case DELETE
}

extension AlbumFeed: Endpoint {

    var base: String {
        return "https://jsonplaceholder.typicode.com"
    }

    var path: String {
        switch self {
        case .GETALL: return "/albums"
        case .GETONE: return "/albums/"
        case .CREATE: return "/albums"
        case .UPDATE: return "/albums/"
        case .DELETE: return "/albums/"
        }
    }

    var method: String {
        switch self {
        case .GETALL: return "GET"
        case .GETONE: return "GET"
        case .CREATE: return "POST"
        case .UPDATE: return "PATCH"
        case .DELETE: return "DELETE"
        }
    }
}

class AlbumClient: APIClient {

    let session: URLSession

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func getAll(from albumFeedType: AlbumFeed, completion: @escaping (Result<Albums?, APIError>) -> Void) {

        let endpoint = albumFeedType
        let request = endpoint.request

        fetch(with: request, decode: { json -> Albums? in
            guard let albumFeedResult = json as? Albums else { return  nil }
            return albumFeedResult

        }, completion: completion)
    }

    func getOne(from albumFeedType: AlbumFeed, completion: @escaping (Result<Albums?, APIError>) -> Void) {

        let endpoint = albumFeedType
        let request = endpoint.request

        fetch(with: request, decode: { json -> Albums? in
            guard let albumFeedResult = json as? Albums else { return  nil }
            return albumFeedResult

        }, completion: completion)
    }
}
