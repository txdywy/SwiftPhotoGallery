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
    var imageList = ["https://ig-s-b-a.akamaihd.net/hphotos-ak-xta1/t51.2885-15/e35/17265902_267101913747541_3627374961242406912_n.jpg",
                     "https://ig-s-b-a.akamaihd.net/hphotos-ak-xta1/t51.2885-15/e35/17265902_267101913747541_3627374961242406912_n.jpg",
                     "https://ig-s-b-a.akamaihd.net/hphotos-ak-xta1/t51.2885-15/e35/17265902_267101913747541_3627374961242406912_n.jpg",
                     "https://ig-s-b-a.akamaihd.net/hphotos-ak-xta1/t51.2885-15/e35/17265902_267101913747541_3627374961242406912_n.jpg"]
    let urlString = "https://mei12356.com/ios"
    

    

    @IBAction func didPressShowMeButton(_ sender: AnyObject) {
        let gallery = SwiftPhotoGallery(delegate: self, dataSource: self)

        let semaphore = DispatchSemaphore(value: 0)


        gallery.backgroundColor = UIColor.black
        gallery.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
        gallery.currentPageIndicatorTintColor = UIColor(red: 0.0, green: 0.66, blue: 0.875, alpha: 1.0)
        gallery.hidePageControl = false
        gallery.modalPresentationStyle = .overCurrentContext
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    
                    //let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                    print("!!!!")
                    let parsedData = String(data: data!, encoding: String.Encoding.utf8)
                    print(parsedData)
                    self.imageList.append(parsedData!)
                    //self.imageList.append("https://ig-s-b-a.akamaihd.net/hphotos-ak-xta1/t51.2885-15/e35/17817954_1690413417638899_3647683851540496384_n.jpg")

                    
                } catch let error as NSError {
                    print(error)
                }
            }
            semaphore.signal()
            
            }.resume()

        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        print("hahahha")
        //print(parsedData)

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
        //return imageNames.count
        return imageList.count
    }

    func imageInGallery(gallery: SwiftPhotoGallery, forIndex: Int) -> UIImage? {
        //let imageUrl:URL = URL(string: imageInst)!
        let imageUrl:URL = URL(string: imageList[forIndex])!
        let imageData:NSData = NSData(contentsOf: imageUrl)!
        
        let image = UIImage(data: imageData as Data)
        return image
        //return UIImage(named: imageNames[forIndex])
    }
}

// MARK: SwiftPhotoGalleryDelegate Methods
extension ViewController: SwiftPhotoGalleryDelegate {

    func galleryDidTapToClose(gallery: SwiftPhotoGallery) {
        dismiss(animated: true, completion: nil)
    }
}
