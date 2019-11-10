//
//  ViewController.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 10/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    /// Get todos on load
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager
            .sharedInstance.getAll(api: "albums", onSuccess: onSuccess, onFailure: onFailure)
    }

    func onSuccess(json: JSON) {
        print(json)
    }

    func onFailure(json: JSON) {
        print(json)
    }

}
