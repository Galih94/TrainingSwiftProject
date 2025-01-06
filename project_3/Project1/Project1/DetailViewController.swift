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
    public var selectedTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        setTitle(selectedTitle)
        setNavBarButton()
    }
    
    private func setNavBarButton() {
        let customButton = UIButton(type: .system)
        customButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        customButton.addTarget(self, action: #selector(shareTapped(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customButton)
    }
    
    @objc
    private func shareTapped(_ sender: UIButton) {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else { return }
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: [])
        activityVC.popoverPresentationController?.sourceView = sender
        activityVC.popoverPresentationController?.sourceRect = sender.bounds
        activityVC.popoverPresentationController?.permittedArrowDirections = .any
        self.present(activityVC, animated: true)
    }
    
    private func setTitle(_ text: String?) {
        title = text
        navigationItem.largeTitleDisplayMode = .never
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
