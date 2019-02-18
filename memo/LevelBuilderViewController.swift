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
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var backToMain: UIButton!
    
    
    
    var counter = 0, levelCount = 1, points = 0, totalComchoises = 0
    var antBtns = 0, antChss = 0, timeInter = 1.5, antLives = 3
    var cstmMode = false, esyMode = false, hrdMode = false
    var firstTry = true, highScoreEasy = 0, highScoreHard = 0
    var gameOverMessage = ""
    
    var timer = Timer()
    let buttonPressed = UIImage(named: "orangeButton.jpg")
    let buttonNormal = UIImage(named: "greenButton.jpg")
    let buttonHardMode = UIImage(named: "redButton.jpg")
    var isSelected = false, isWinner = false
    var choise: Int?
    var comChoises = [Int]()
    var choises = [Int]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isHidden = true
        nextButton.isHidden = true
        startButton.isHidden = false
        livesLabel.text = "\(antLives) ❤️"
        disableAll()
        if hrdMode == true {
            for i in 0...23{
                buttons[i].setImage(buttonHardMode
                    ,for: .normal)
            }
            startButton.setTitleColor(.red, for: .normal)
            submitButton.setTitleColor(.red, for: .normal)
            nextButton.setTitleColor(.red, for: .normal)
        }
        
        
       // buttons[0].setImage(buttonPressed, for: .normal)
        
       
       
        
    }
    @objc func hideColor() {
        if hrdMode == true{
            for i in 0...23{
                buttons[i].setImage(buttonHardMode, for: .normal)
            }
        }
        else if esyMode == true{
            for i in 0...23{
                buttons[i].setImage(buttonNormal, for: .normal)
            }
        }
        
    }
    
    func levelBuilder(antButtons: Int, antChoises: Int, levelNr: Int, timeInterVl: Double) {
        levelLabel.text = "Level \(levelNr)"
        resetChoises()
        resetColor()
        antBtns = antButtons
        antChss = antChoises
        
        comChoises = Array(repeating: 0, count: 24)
        choises = Array(repeating: 0, count: 24)
        print("com:\(comChoises)")
            print("you:\(choises)")
        
        for button in buttons{
            button.isHidden = false
            button.isEnabled = true
        }
        
        for _ in 0...antChoises{
            totalComchoises = antButtons - 1
            var com = Int.random(in: 0...totalComchoises)
            comChoises[com] = 1
            buttons[com].setImage(buttonPressed, for: .normal)
            print("Com picked nr: \(com)")
            print(comChoises)
        }
        
        timer = Timer.scheduledTimer(timeInterval: timeInter, target: self, selector: #selector(hideColor), userInfo: nil, repeats: false)
        print("com: \(comChoises)")
    }
    
    
    
    func hideAll()  {
        for i in 0...23 {
            buttons[i].isHidden = true
        }
    }
    func resetColor(){
        for button in buttons {
            if hrdMode == false{
                button.setImage(buttonNormal, for: .normal)
            }
            else if hrdMode == true {
                button.setImage(buttonHardMode, for: .normal)
            }
            
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
//        print("com: \(comChoises)")
//        print("you: \(choises)")
    }
    
    
    @IBAction func nextLevel(_ sender: UIButton) {        hideAll()
        resetColor()
      //  print("going to next level")
        startRound(nextButton)
        
    }
    
    @IBAction func startRound(_ sender: UIButton) {
   //     print("starting on level:")
        print(levelCount)
        
  //      print("number of buttons:")
        print(antBtns)
 
     //   print("number of choises:")
        print(antChss)
        
     //   print("time:")
        print(timeInter)
        
        
        timer.invalidate()
        startButton.isHidden = true
        submitButton.isHidden = false
        nextButton.isHidden = true
        
        disableAll()
        
        levelBuilder(antButtons: antBtns, antChoises: antChss, levelNr: levelCount, timeInterVl: timeInter)
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        print("submitting")
        print("com:\(comChoises)")
        print("you:\(choises)")
        if choises == comChoises{
            print("going to next level")
            print("level \(levelCount)")
            levelCount += 1
            levelLabel.text = "Level \(levelCount)"
            points = points + 5
            if levelCount < 7 {
                antChss += 1
            }
            pointLabel.text = "\(points)p"
            resetChoises()

            print("Next Level")
            
            levelBuilder(antButtons: antBtns, antChoises: antChss, levelNr: levelCount, timeInterVl: timeInter)
            submitButton.isHidden = false
            startButton.isHidden = true
        }
        else{

            startButton.isHidden = false
            submitButton.isHidden = true
            nextButton.isHidden = true
            firstTry = false
            antLives = antLives - 1
            livesLabel.text = "\(antLives)❤️"
            disableAll()
            resetChoises()
        
            for i in 0...23 {
                if hrdMode == false{
                    buttons[i].setImage(buttonNormal, for: .normal)
                }
                else if hrdMode == true{
                    buttons[i].setImage(buttonHardMode, for: .normal)
                }
            }
            if antLives == 0 {
                
                if esyMode == true {
                    if points > highScoreEasy {
                        highScoreEasy = points
                        gameOverMessage = "New high score! \n You reached level: \(levelCount) and got \(points) points "
                        print("New high score!")
                    }
                    else{
                        gameOverMessage = "You reached level: \(levelCount) and got \(points) points"
                    }
                    
                }
                else if hrdMode == true {
                    if points > highScoreHard {
                        highScoreHard = points
                       gameOverMessage = "New high score! \n You reached level: \(levelCount) and got \(points) points"
                        print("New high score!")
                    }
                    else{
                        gameOverMessage = "You reached level: \(levelCount) and got \(points) points"
                    }
                }
                
                let alert = UIAlertController(title: "Game over!", message: "\(gameOverMessage)", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "try again", style: .default, handler: nil))
                self.present(alert, animated: true)
                
                
                
                antLives = 3
                levelCount = 1
                points = 0
                levelLabel.text = "Level \(levelCount)"
                pointLabel.text = "\(points)p"
                livesLabel.text = "\(antLives)❤️"

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToStartScreen" {
            let destinationVC = segue.destination as! startScreeenViewController
            //destinationVC.easyMode.isOn = false
            print("highscores= \(highScoreHard) \(highScoreEasy)" )
            destinationVC.highScoreHrd = highScoreHard
            destinationVC.highScoreEsy = highScoreEasy
        }
    }
    
    
}
