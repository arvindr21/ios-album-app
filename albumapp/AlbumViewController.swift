//
//  ViewController.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 10/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation

class AlbumViewController: UITableViewController {

    var albums: [Album] = []
    
    /// Get todos on load
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager
            .sharedInstance
            .getAll(api: "albums", decodable: Album.self, completion: <#T##([Decodable]) -> Void#>)
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
