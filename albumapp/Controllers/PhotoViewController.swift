//
//  PhotoViewController.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 12/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class PhotoViewController: UICollectionViewController {

    var photos: [Photo] = []

    /// Get todos on load
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("https://jsonplaceholder.typicode.com/photos").responsePhotos { response in
            if let photos = response.result.value {
                self.photos = photos
            }
        }
    }

}
