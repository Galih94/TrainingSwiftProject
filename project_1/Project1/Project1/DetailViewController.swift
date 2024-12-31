//
//  DetailViewController.swift
//  Project1
//
//  Created by Galih Samudra on 31/12/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    public var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }

    private func loadImage() {
        guard let imageName = selectedImage else { return }
        imageView.image = UIImage(named: imageName)
    }
    
}
