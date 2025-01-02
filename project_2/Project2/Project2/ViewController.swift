//
//  ViewController.swift
//  Project2
//
//  Created by Galih Samudra on 02/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCountries()
        askQuestions()
        setButtons()
    }
    
    private func setButtons() {
        let buttons = [button1, button2, button3]
        buttons.forEach { button in
            button?.layer.borderWidth = 1
            button?.layer.borderColor = UIColor.lightGray.cgColor
            button?.imageView?.contentMode = .scaleToFill
            button?.clipsToBounds = true
        }
    }
    
    private func loadCountries() {
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    private func askQuestions() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
}

