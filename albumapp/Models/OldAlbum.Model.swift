//
//  Album.Model.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 11/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let userId: Int
    let id: Int
    let title: String

}

typealias Albums = [Album]
