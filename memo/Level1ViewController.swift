//
//  Level1ViewController.swift
//  memo
//
//  Created by joakim lundberg on 2019-01-29.
//  Copyright © 2019 joakim. All rights reserved.
//

import UIKit

class Level1ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var choises: [Int] = [0, 0]
    var comChoise: [Int] = [0, 0]
    var counter = 0
    var timer = Timer()
    let buttonPressed = UIImage(named: "orangeButton.jpg")
    let buttonNormal = UIImage(named: "greenButton.jpg")
    var isSelected = false
    var randomNumb = Int.random(in: 1...2)
    var choise: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
        startButton.isHidden = false
        submitButton.isHidden = true
        buttons[0].isEnabled = false
        buttons[1].isEnabled = false
        
    }
    @IBAction func nextLevel(_ sender: UIButton) {
    }
    
    @IBAction func startRound(_ sender: UIButton) {
        timer.invalidate()
        startButton.isHidden = true
        submitButton.isHidden = false
        buttons[0].isEnabled = true
        buttons[1].isEnabled = true

        if randomNumb == 1 {
            buttons[0].setImage(buttonPressed, for: .normal)
             comChoise[0] = 1
        }
        else if randomNumb == 2 {
            buttons[1].setImage(buttonPressed, for: .normal)
            comChoise[1] = 1
        }
    
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideColor), userInfo: nil, repeats: false)
    }
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        buttons[0].setImage(buttonPressed, for: .normal)
        choises[0] = 1
    }
    @IBAction func button2pressed(_ sender: UIButton) {
        buttons[1].setImage(buttonPressed, for: .normal)
        choises[1] = 1
        print("Button 2 pressed")
    }
    
    @objc func hideColor() {
        buttons[0].setImage(buttonNormal, for: .normal)
        buttons[1].setImage(buttonNormal, for: .normal)
    }
    @IBAction func submitButton(_ sender: UIButton) {
        
        if choises == comChoise {
            submitButton.isHidden = true
            nextButton.setTitle("Next level", for: .normal)
            nextButton.isHidden = false
            let alertController = UIAlertController(title: "Success!", message:
                "Go to next level.", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            for i in choises {
                choises[i] = 0
            }
            startButton.isHidden = false
            submitButton.isHidden = true
            buttons[0].setImage(buttonNormal, for: .normal)
            buttons[1].setImage(buttonNormal, for: .normal)
            nextButton.setTitle("Try again", for: .normal)
            let alertController = UIAlertController(title: "Fail!", message:
                "Try again.", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
  

}
