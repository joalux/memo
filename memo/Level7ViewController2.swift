//
//  Level7ViewController2.swift
//  memo
//
//  Created by joakim lundberg on 2019-02-04.
//  Copyright © 2019 joakim. All rights reserved.
//

import UIKit

class Level7ViewController2: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var choises: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    var comChoise: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    var counter = 0
    var timer = Timer()
    let buttonPressed = UIImage(named: "orangeButton.jpg")
    let buttonNormal = UIImage(named: "greenButton.jpg")
    var isSelected = false
    var randomNumb = Int.random(in: 0...4)
    var choise: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isHidden = true
        startButton.isHidden = false
        submitButton.isHidden = true
        for i in 0...7 {
            buttons[i].isEnabled = false
        }
    }
    @IBAction func nextLevel(_ sender: UIButton) {
    }
    
    @IBAction func startRund(_ sender: UIButton) {
        timer.invalidate()
        startButton.isHidden = true
        submitButton.isHidden = false
        var x = 0
        
        for i in 0...7 {
            buttons[i].isEnabled = true
        }
        
        while x < 3 {
            randomNumb = Int.random(in: 1...8)
            
            if randomNumb == 1 {
                if comChoise[0] == 0{
                    buttons[0].setImage(buttonPressed, for: .normal)
                    comChoise[0] = 1
                    print("com picked button 1")
                }
                else{
                    print("com picked button 1 again, picking another")
                    randomNumb = Int.random(in: 1...8)
                    print("com picked button ", randomNumb)
                    buttons[randomNumb].setImage(buttonPressed, for: .normal)
                    
                    comChoise[randomNumb] = 1
                }
                
            }
            else if randomNumb == 2{
                if comChoise[1] == 0{
                    buttons[1].setImage(buttonPressed, for: .normal)
                    comChoise[1] = 1
                    print("com picked button 2")
                }
                else{
                    print("com picked button 2 again, picking another")
                    randomNumb = Int.random(in: 1...8)
                    print("com picked button ", randomNumb)
                    
                    buttons[randomNumb].setImage(buttonPressed, for: .normal)
                    comChoise[randomNumb] = 1
                }
            }
            else if randomNumb == 3 {
                if comChoise[2] == 0{
                    buttons[2].setImage(buttonPressed, for: .normal)
                    comChoise[2] = 1
                    print("com picked button 3")
                }
                else{
                    print("com picked button 3 again, picking another")
                    randomNumb = Int.random(in: 1...8)
                    print("com picked button ", randomNumb)
                    
                    buttons[randomNumb].setImage(buttonPressed, for: .normal)
                    comChoise[randomNumb] = 1
                }
            }
            else if randomNumb == 4{
                if comChoise[3] == 0{
                    buttons[3].setImage(buttonPressed, for: .normal)
                    comChoise[3] = 1
                    print("com picked button 4")
                }
                else{
                    print("com picked button 4 again, picking another")
                    randomNumb = Int.random(in: 1...8)
                    print("com picked button ", randomNumb)
                    
                    buttons[randomNumb].setImage(buttonPressed, for: .normal)
                    comChoise[randomNumb] = 1
                }
            }
            else if randomNumb == 5 {
                if comChoise[4] == 0{
                    buttons[4].setImage(buttonPressed, for: .normal)
                    comChoise[4] = 1
                    print("com picked button 5")
                }
                else{
                    print("com picked button 5 again, picking another")
                    randomNumb = Int.random(in: 1...8)
                    print("com picked button ", randomNumb)
                    
                    buttons[randomNumb].setImage(buttonPressed, for: .normal)
                    comChoise[randomNumb] = 1
                }
            }
            else if randomNumb == 6 {
                if comChoise[5] == 0{
                    buttons[5].setImage(buttonPressed, for: .normal)
                    comChoise[5] = 1
                    print("com picked button 6")
                }
                else{
                    print("com picked button 6 again, picking another")
                    randomNumb = Int.random(in: 1...8)
                    print("com picked button ", randomNumb)
                    
                    buttons[randomNumb].setImage(buttonPressed, for: .normal)
                    comChoise[randomNumb] = 1
                    
                }
            }
            else if randomNumb == 7 {
                if comChoise[6] == 0{
                    buttons[6].setImage(buttonPressed, for: .normal)
                    comChoise[6] = 1
                    print("com picked button 7")
                }
                else{
                    print("com picked button 7 again, picking another")
                    randomNumb = Int.random(in: 1...8)
                    print("com picked button ", randomNumb)
                    
                    buttons[randomNumb].setImage(buttonPressed, for: .normal)
                    comChoise[randomNumb] = 1
                    
                }
            }
            else if randomNumb == 8 {
                if comChoise[7] == 0{
                    buttons[7].setImage(buttonPressed, for: .normal)
                    comChoise[7] = 1
                    print("com picked button 8")
                }
                else{
                    print("com picked button 8 again, picking another")
                    randomNumb = Int.random(in: 1...8)
                    print("com picked button ", randomNumb)
                    
                    buttons[randomNumb].setImage(buttonPressed, for: .normal)
                    comChoise[randomNumb] = 1
                    
                }
            }
            
            x = x + 1
        }
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideColor), userInfo: nil, repeats: false)
    }
    @IBAction func button1pressed(_ sender: UIButton) {
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
    @IBAction func button5pressed(_ sender: UIButton) {
        buttons[4].setImage(buttonPressed, for: .normal)
        choises[4] = 1
        print("you picked button 5")
    }
    @IBAction func button6pressed(_ sender: UIButton) {
        buttons[5].setImage(buttonPressed, for: .normal)
        choises[5] = 1
        print("you picked button 6")
    }
    @IBAction func button7pressed(_ sender: UIButton) {
        buttons[6].setImage(buttonPressed, for: .normal)
        choises[6] = 1
        print("you picked button 7")
    }
    @IBAction func button8pressed(_ sender: UIButton) {
        buttons[7].setImage(buttonPressed, for: .normal)
        choises[7] = 1
        print("you picked button 8")
    }
    @objc func hideColor() {
        buttons[0].setImage(buttonNormal, for: .normal)
        buttons[1].setImage(buttonNormal, for: .normal)
        buttons[2].setImage(buttonNormal, for: .normal)
        buttons[3].setImage(buttonNormal, for: .normal)
        buttons[4].setImage(buttonNormal, for: .normal)
        buttons[5].setImage(buttonNormal, for: .normal)
        buttons[6].setImage(buttonNormal, for: .normal)
        buttons[7].setImage(buttonNormal, for: .normal)

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
            choises = [0, 0, 0, 0, 0, 0, 0, 0]
            comChoise = [0, 0, 0, 0, 0, 0, 0, 0]
            
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
