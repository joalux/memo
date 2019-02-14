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
    
    var counter = 0, levelCount = 1, points = 0, totalComchoises = 0
    var antBtns = 0, antChss = 0, timeInter = 1.5
    var cstmMode = false, esyMode = false, hrdMode = false
    var firstTry = true
    
    var timer = Timer()
    let buttonPressed = UIImage(named: "orangeButton.jpg")
    let buttonNormal = UIImage(named: "greenButton.jpg")
    var isSelected = false, isWinner = false
    var choise: Int?
    var comChoises = [Int]()
    var choises = [Int]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isHidden = true
        nextButton.isHidden = true
        startButton.isHidden = false
        disableAll()
        print("choises on load \(antChss)")
        print("buttons on load \(antBtns)")
        print("time on load \(timeInter)")
        
    }
    @objc func hideColor() {
        for i in 0...22{
            buttons[i].setImage(buttonNormal, for: .normal)        }
    }
    
    func levelBuilder(antButtons: Int, antChoises: Int, levelNr: Int, timeInterVl: Double) {
        levelLabel.text = "Level \(levelNr)"
        resetChoises()
        antBtns = antButtons
        antChss = antChoises
        
        comChoises = Array(repeating: 0, count: antButtons)
        choises = Array(repeating: 0, count: antButtons)
        print(comChoises)
        
        for i in 0 ..< antBtns{
            buttons[i].isHidden = false
            buttons[i].isEnabled = true
        }
        for _ in 0...antChoises{
            
            print("buttons before random \(antButtons)")
            totalComchoises = antButtons - 1
            var com = Int.random(in: 0...totalComchoises)
            

            print("Com picked button \(com)")
           
            print("Total buttons \(antButtons)")
            comChoises[com] = 1
             print("Com choises \(comChoises)")
            buttons[com].setImage(buttonPressed, for: .normal)
        }
       /* timer = Timer.scheduledTimer(timeInterval: timeInter, target: self, selector: #selector(hideColor), userInfo: nil, repeats: false)*/
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
        
        print("number of buttons:")
        print(antBtns)
 
        print("number of choises:")
        print(antChss)
        
        print("time:")
        print(timeInter)
        
        
        timer.invalidate()
        startButton.isHidden = true
        submitButton.isHidden = false
        nextButton.isHidden = true
        
        hideAll()
        
        levelBuilder(antButtons: antBtns, antChoises: antChss, levelNr: levelCount, timeInterVl: timeInter)
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        print("submiting")
        print("com=")
        print(comChoises)
        print("you=")
        print(choises)
        print("level after  \(levelCount)")
        print("buttons after \(antBtns)")
        print("choises after \(antChss)")
        
        
        if choises == comChoises{
            print("next round")
            print("Levelcount \(levelCount)")
           levelCount += 1
            print("Levelcount after \(levelCount)")
            points = points + 5
            if levelCount < 7 {
                antBtns += 4
                antChss += 1
                
            }
            pointLabel.text = "\(points)p"
            resetChoises()
            print("your choises after reset \(choises)")
            print("com choises after reset \(comChoises)")

            
            levelBuilder(antButtons: antBtns, antChoises: antChss, levelNr: levelCount, timeInterVl: timeInter)
            submitButton.isHidden = false
            startButton.isHidden = true
        }
        else{
            print("try again")
            print("Levelcount \(levelCount)")
            print("com choises before disable= \(comChoises)")
            print("your choises before disable= \(choises)")
            print("level before disable \(levelCount)")
            print("buttons before disable \(antBtns)")
            print("choises before disable \(antChss)")
            disableAll()
            print("Comchoises after disable \(comChoises)")
            print("youchoises after disable \(choises)")
            print("level after diable \(levelCount)")
            print("buttons after disable \(antBtns)")
            print("choises after disable \(antChss)")
            startButton.isHidden = false
            submitButton.isHidden = true
            nextButton.isHidden = true
            firstTry = false
            //antBtns += 1
            //antChss += 1
            
            print("buttons after add \(antBtns)")
            print("choises after add \(antChss)")
            
            resetChoises()
            

            /*if(levelCount != 1){
                for _ in 0...3{
                    print("removing button")
                    comChoises.removeLast()
                    choises.removeLast()
                }
            }*/
            
            
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
