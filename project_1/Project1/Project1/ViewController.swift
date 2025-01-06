//
//  ViewController.swift
//  Project1
//
//  Created by Galih Samudra on 30/12/24.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
        setTitle("Storm Viewer")
        setNavBarButton()
    }
    
    private func setTitle(_ text: String) {
        title = text
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setNavBarButton() {
        let customButton = UIButton(type: .system)
        customButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        customButton.addTarget(self, action: #selector(shareTapped(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customButton)
    }
    
    @objc
    private func shareTapped(_ sender: UIButton) {
        let message = "Check out this amazing app: https://apps.apple.com/app/id1234567890"
        let activityVC = UIActivityViewController(activityItems: [message], applicationActivities: [])
        activityVC.popoverPresentationController?.sourceView = sender
        activityVC.popoverPresentationController?.sourceRect = sender.bounds
        activityVC.popoverPresentationController?.permittedArrowDirections = .any
        self.present(activityVC, animated: true)
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
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }
        let title = "Picture \((indexPath.row) + 1) of \(pictures.count)"
        vc.selectedTitle = title
        vc.selectedImage = pictures[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

