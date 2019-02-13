//
//
//  Created by joakim lundberg on 2019-02-07.
//  Copyright © 2019 joakim. All rights reserved.
//

import UIKit

class LevelBuilderViewController: UIViewController {
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet var pinchAction: UIPinchGestureRecognizer!
    
    var counter = 0, levelCount = 0, points = 0
    var antBtns = 0, antChss = 0, timeInter = 1.5
    var cstmMode = false, esyMode = false, hrdMode = false
    
    
    var timer = Timer()
    let buttonPressed = UIImage(named: "orangeButton.jpg")
    let buttonNormal = UIImage(named: "greenButton.jpg")
    var isSelected = false, isWinner = false
    var choise: Int?
    var comChoises = [Int]()
    var choises = [Int]()

    
    @IBAction func pinchToMain(_ sender: UIPinchGestureRecognizer) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isHidden = true
        nextButton.isHidden = true
        startButton.isHidden = false
        disableAll()
        
    }
    @objc func hideColor() {
        for i in 0...22{
            buttons[i].setImage(buttonNormal, for: .normal)        }
    }
    
    func levelBuilder(antButtons: Int, antChoises: Int, levelNr: Int, timeInterVl: Double) {
        levelLabel.text = "Level \(levelNr)"
        resetChoises()
        antBtns = antButtons - 1
        antChss = antChoises - 1
        
        comChoises = Array(repeating: 0, count: antButtons)
        choises = Array(repeating: 0, count: antButtons)
        print(comChoises)
        for i in 0...antButtons{
            buttons[i].isHidden = false
            buttons[i].isEnabled = true
        }
        for _ in 0...antChoises{
            let com = Int.random(in: 0...antButtons)
            
            print("Com picked button \(com)")
            print("Com choises \(comChoises)")
            comChoises[com] = 1
            buttons[com].setImage(buttonPressed, for: .normal)
        }
        timer = Timer.scheduledTimer(timeInterval: timeInter, target: self, selector: #selector(hideColor), userInfo: nil, repeats: false)
        print(comChoises)
    }
    
    
    
    func hideAll()  {
        for i in 0...23 {
            buttons[i].isHidden = true
        }
    }
    func resetColor(){
        for i in 0...23 {
            buttons[i].setImage(buttonNormal, for: .normal)
        }
    }
    func disableAll(){
        for i in 0...23 {
            buttons[i].isEnabled = false
        }
    }
    func resetChoises() {
        for index in choises.indices{
            choises[index] = 0
        }
        for index in comChoises.indices{
            comChoises[index] = 0
        }
    }
    
    
    @IBAction func nextLevel(_ sender: UIButton) {        hideAll()
        resetColor()
        print("going to next level")
        startRound(nextButton)
        
    }
    
    @IBAction func startRound(_ sender: UIButton) {
        print("starting on level:")
        print(levelCount)
        timer.invalidate()
        startButton.isHidden = true
        submitButton.isHidden = false
        nextButton.isHidden = true
        
        hideAll()
        if levelCount == 0{
            levelBuilder(antButtons: antBtns, antChoises: antChss, levelNr: levelCount, timeInterVl: timeInter)
        }
        if levelCount == 1{
            levelBuilder(antButtons: 8, antChoises: 4, levelNr: 2, timeInterVl: 1.5)
        }
        if levelCount == 2{
            levelBuilder(antButtons: 12, antChoises: 6, levelNr: 3, timeInterVl: 1.5)
        }
        if levelCount == 3{
            levelBuilder(antButtons: 16, antChoises: 8, levelNr: 4, timeInterVl: 2.0)
        }
        if levelCount == 4{
            levelBuilder(antButtons: 20, antChoises: 8, levelNr: 5, timeInterVl: 2.0)
        }
        if levelCount == 5{
            levelBuilder(antButtons: 24, antChoises: 8, levelNr: 6, timeInterVl: 2.0)
        }
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        print("submiting")
        print("com=")
        print(comChoises)
        print("you=")
        print(choises)
        
        if choises == comChoises{
            print("next round")
            print("Levelcount \(levelCount)")
           levelCount += 1
            print("Levelcount after \(levelCount)")
            points = points + 5
            antBtns += 4
            antChss += 2
            
            submitButton.isHidden = true
            nextButton.isHidden = false
        }
        else{
            print("try again")
            print("Levelcount \(levelCount)")
            print("com= \(comChoises)")
            print("you= \(choises)")
            startButton.isHidden = false
            submitButton.isHidden = true
            nextButton.isHidden = true
            resetChoises()
            print("Comchoises after fail \(comChoises)")
            print("youchoises after fail \(choises)")
            for _ in 0...3{
               comChoises.removeLast()
                choises.removeLast()
            }
            
            for i in 0...23 {
                buttons[i].setImage(buttonNormal, for: .normal)
            }
        }
    }
  
   
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.setImage(buttonPressed, for: .normal)
        print("Button \(sender.tag) pressed")
        choises[sender.tag] = 1
        print("your choises ")
        print(choises)
        
    }
}
