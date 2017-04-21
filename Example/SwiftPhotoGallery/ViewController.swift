//
//  ViewController.swift
//  SwiftPhotoGallery
//
//  Created by Justin Vallely on 08/25/2015.
//  Copyright (c) 2015 Justin Vallely. All rights reserved.
//

import UIKit
import SwiftPhotoGallery

class ViewController: PortraitOnlyViewController {

    let imageNames = ["image1.jpeg", "image2.jpeg", "image3.jpeg", "Lips-48.png"]
    let imageInst = "https://ig-s-b-a.akamaihd.net/hphotos-ak-xta1/t51.2885-15/e35/17265902_267101913747541_3627374961242406912_n.jpg"

    @IBAction func didPressShowMeButton(_ sender: AnyObject) {
        let gallery = SwiftPhotoGallery(delegate: self, dataSource: self)

        gallery.backgroundColor = UIColor.black
        gallery.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
        gallery.currentPageIndicatorTintColor = UIColor(red: 0.0, green: 0.66, blue: 0.875, alpha: 1.0)
        gallery.hidePageControl = false
        gallery.modalPresentationStyle = .overCurrentContext

        present(gallery, animated: true, completion: nil)

        /// Or load on a specific page like this:
        /*
        present(gallery, animated: false, completion: { () -> Void in
            gallery.currentPage = 2
        })
        */
    }
}

// MARK: SwiftPhotoGalleryDataSource Methods
extension ViewController: SwiftPhotoGalleryDataSource {

    func numberOfImagesInGallery(gallery: SwiftPhotoGallery) -> Int {
        return imageNames.count
    }

    func imageInGallery(gallery: SwiftPhotoGallery, forIndex: Int) -> UIImage? {
        return UIImage(named: imageNames[forIndex])
    }
}

// MARK: SwiftPhotoGalleryDelegate Methods
extension ViewController: SwiftPhotoGalleryDelegate {

    func galleryDidTapToClose(gallery: SwiftPhotoGallery) {
        dismiss(animated: true, completion: nil)
    }
}
