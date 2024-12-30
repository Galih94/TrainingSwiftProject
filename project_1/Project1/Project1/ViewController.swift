//
//  ViewController.swift
//  Project1
//
//  Created by Galih Samudra on 30/12/24.
//

import UIKit

class ViewController: UIViewController {

    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
        print("pictures: ", pictures)
    }

    private func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }

}

