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
    var selectedAlbum: Album?

    /// Get todos on load
    override func viewDidLoad() {
        super.viewDidLoad()
        startActivityIndicator()

        Alamofire.request("https://jsonplaceholder.typicode.com/albums").responseAlbums { response in
            if let albums = response.result.value {
                self.albums = albums
                self.tableView.reloadData()
                self.stopActivityIndicator()
            }
        }
    }
    
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.albums.count)
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
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAlbumView" {
            // initialize new view controller and cast it as your view controller
            let path = self.tableView.indexPathForSelectedRow
            guard let row = path?.row else {
                return
            }
            selectedAlbum = albums[row]
            guard let viewController = segue.destination as? PhotoViewController else {
                return
            }
            // your new view controller should have property that will store passed value
            viewController.album = selectedAlbum
        }
    }
}
