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

class PhotoCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
}

class PhotoViewController: UICollectionViewController {

    var photos: [Photo] = []
    var album: Album?
    let reuseIdentifier = "cell"

    /// Get todos on load
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request("https://jsonplaceholder.typicode.com/photos?albumId=\(album?.id ?? 0)").responsePhotos { response in
            if let photos = response.result.value {
                self.photos = photos
            }
            self.collectionView.reloadData()
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotoCollectionCell else {
            fatalError("Wrong cell class dequeued")
        }

        let photo = photos[indexPath.row]

        print(photo.url)

        UIImage.downloadImage(photo.url, inView: cell.imageView)
        return cell
    }

}

extension UIImage {
    public class func downloadImage(_ uri: String, inView: UIImageView) {
        if let url = URL(string: uri) {
            let task = URLSession.shared.dataTask(with: url) { responseData, _, error in
                if error == nil {
                    if let data = responseData {
                        DispatchQueue.main.async {
                            inView.image = UIImage(data: data)
                        }
                    } else {
                        print("no data")
                    }
                } else {
                    print("Error in downloading the image")
                }
            }
            task.resume()
        }
    }
}
