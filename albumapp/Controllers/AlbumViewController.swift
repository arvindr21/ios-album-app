//
//  ViewController.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 10/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import UIKit
import Foundation

class AlbumViewController: UITableViewController {

    var albums: [Album] = []

    private let client = AlbumClient()

    /// Get todos on load
    override func viewDidLoad() {
        super.viewDidLoad()

        client.getAll(from: .GETALL) { [weak self] result in

            switch result {
            case .success(let albums):
                guard let albums = albums else { return }
                print(albums)
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumItemCell", for: indexPath)
        cell.textLabel?.text = albums[indexPath.row].title
        return cell
    }

}
