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
    
    var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.sizeToFit()
        return label
    }()
    
    var countries = [String]()
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var correctAnswerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCountries()
        askQuestions()
        setButtons()
        setScore()
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
    
    private func setScore() {
        // Wrap the label in a UIBarButtonItem
        let labelBarButtonItem = UIBarButtonItem(customView: scoreLabel)
        
        // Add both items to the right side
        self.navigationItem.rightBarButtonItems = [labelBarButtonItem]
        score = 0
    }
    
    private func askQuestions() {
        countries.shuffle()
        correctAnswerIndex = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswerIndex].uppercased()
    }
    
    private func alertAction(_ action: UIAlertAction) {
        askQuestions()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String = ""
        if sender.tag == correctAnswerIndex {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        let alert = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: alertAction))
        self.present(alert, animated: true)
    }
    
}

