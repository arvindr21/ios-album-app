//
//  ViewController.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 10/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// Get todos on load
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }

}
