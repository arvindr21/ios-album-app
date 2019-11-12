//
//  ViewController.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 10/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class AlbumViewController: UITableViewController {

    var albums: [Album] = []

    /// Get todos on load
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("https://jsonplaceholder.typicode.com/albums").responseAlbums { response in
            if let albums = response.result.value {
                self.albums = albums
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumItemCell", for: indexPath)
        cell.textLabel?.text = albums[indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(albums[indexPath.row])
    }

}
