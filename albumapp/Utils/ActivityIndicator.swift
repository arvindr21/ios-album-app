//
//  ActivityIndicator.swift
//  albumapp
//
//  Created by Ravulavaru, Arvind on 14/11/19.
//  Copyright © 2019 arvind. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    var activityIndicatorTag: Int { return 999999 }

    func startActivityIndicator(
        style: UIActivityIndicatorView.Style = .medium,
        location: CGPoint? = nil) {

        //Set the position - defaults to `center` if no`location`

        //argument is provided

        let loc = location ?? self.view.center

        //Ensure the UI is updated from the main thread
        //in case this method is called from a closure
        DispatchQueue.main.async {

            //Create the activity indicator
            let activityIndicator = UIActivityIndicatorView(style: style)
            //Add the tag so we can find the view in order to remove it later

            activityIndicator.tag = self.activityIndicatorTag
            //Set the location

            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            //Start animating and add the view

            activityIndicator.startAnimating()

            self.view.addSubview(activityIndicator)

        }
    }

    func stopActivityIndicator() {

        //Again, we need to ensure the UI is updated from the main thread!

        DispatchQueue.main.async {
            //Here we find the `UIActivityIndicatorView` and remove it from the view

            if let activityIndicator = self.view.subviews.filter({ $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
}
