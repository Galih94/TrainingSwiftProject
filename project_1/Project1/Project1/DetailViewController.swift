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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        shouldHideBarOnTap(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        shouldHideBarOnTap(false)
    }

    private func loadImage() {
        guard let imageName = selectedImage else { return }
        imageView.image = UIImage(named: imageName)
    }
    
    private func shouldHideBarOnTap(_ isHide: Bool) {
        navigationController?.hidesBarsOnTap = isHide
    }
}
