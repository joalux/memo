//
//  Level3ViewController.swift
//  memo
//
//  Created by joakim lundberg on 2019-02-01.
//  Copyright © 2019 joakim. All rights reserved.
//

import UIKit

class Level3ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    var choises: [Int] = [0, 0, 0, 0]
    var comChoise: [Int] = [0, 0, 0, 0]
    var counter = 0
    var timer = Timer()
    let buttonPressed = UIImage(named: "orangeButton.jpg")
    let buttonNormal = UIImage(named: "greenButton.jpg")
    var isSelected = false
    var randomNumb = Int.random(in: 0...3)
    var choise: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
        startButton.isHidden = false
        submitButton.isHidden = true
        for i in 0...3 {
            buttons[i].isEnabled = false
        }
    }
    @IBAction func nextLevel(_ sender: Any) {
    }
    @IBAction func startRund(_ sender: UIButton) {
        randomNumb = Int.random(in: 1...3)
        timer.invalidate()
        startButton.isHidden = true
        submitButton.isHidden = false
        for i in 0...3 {
            buttons[i].isEnabled = true
        }
        
        
        if randomNumb == 1 {
            buttons[0].setImage(buttonPressed, for: .normal)
            comChoise[0] = 1
            print("com picked button 1")
        }
        else if randomNumb == 2 {
            buttons[1].setImage(buttonPressed, for: .normal)
            comChoise[1] = 1
            print("com picked button 2")
        }
        else if randomNumb == 3 {
            buttons[2].setImage(buttonPressed, for: .normal)
            comChoise[2] = 1
            print("com picked button 3")
        }
        else if randomNumb == 4 {
            buttons[3].setImage(buttonPressed, for: .normal)
            comChoise[3] = 1
            print("com picked button 4")
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideColor), userInfo: nil, repeats: false)
    }
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        buttons[0].setImage(buttonPressed, for: .normal)
        choises[0] = 1
        print("you picked button 1")
    }
    @IBAction func button2pressed(_ sender: UIButton) {
        buttons[1].setImage(buttonPressed, for: .normal)
        choises[1] = 1
        print("you picked button 2")
        
    }
    @IBAction func button3pressed(_ sender: UIButton) {
        buttons[2].setImage(buttonPressed, for: .normal)
        choises[2] = 1
        print("you picked button 3")
    }
    @IBAction func button4pressed(_ sender: UIButton) {
        buttons[3].setImage(buttonPressed, for: .normal)
        choises[3] = 1
        print("you picked button 4")
    }
    
    
    @objc func hideColor() {
        buttons[0].setImage(buttonNormal, for: .normal)
        buttons[1].setImage(buttonNormal, for: .normal)
        buttons[2].setImage(buttonNormal, for: .normal)
        buttons[3].setImage(buttonNormal, for: .normal)
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
            choises = [0, 0, 0, 0]
            comChoise = [0, 0, 0, 0]
            
            for button in buttons {
                button.setImage(buttonNormal, for: .normal)
            }
            startButton.isHidden = false
            submitButton.isHidden = true
            nextButton.setTitle("Try again", for: .normal)
            let alertController = UIAlertController(title: "Fail!", message:
                "Try again.", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    
    
}

    

   


