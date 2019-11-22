//
//  AlbumTestCase.swift
//  albumappUnitTests
//
//  Created by Pandey, Pratishtha on 11/21/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import XCTest
@testable import albumapp


struct AlbumTestCase {
   
    struct Valid {
       
        static let albumData: JSONValue = .object(
            [
                 "userId": 1,
                          "id": 1,
                          "title": "quidem molestiae enim"
                
            ]
        ) 
    }
} 
