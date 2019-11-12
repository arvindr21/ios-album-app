//
//  Result.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 11/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import Foundation

enum Result<T, U> where U: Error {
    case success(T)
    case failure(U)
}
