//
//  startScreeenViewController.swift
//  memo
//
//  Created by joakim lundberg on 2019-02-07.
//  Copyright © 2019 joakim. All rights reserved.
//

import UIKit

class startScreeenViewController: UIViewController {
    @IBOutlet weak var easyMode: UISwitch!
    
    @IBOutlet weak var HighScoreHard: UIButton!
    @IBOutlet weak var HighScoreEasy: UIButton!
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var modeField: UITextField!
    
    
    
    var gameModeEasy = true, gameModeHard = false
    var totButtons = 23
    var totChoises = 2
    var totTime = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if gameModeEasy == true {
            easyMode.isOn = true
        }
        else if gameModeEasy == false {
            gameModeHard = true
            easyMode.isOn = false
        }
        
        
        HighScoreHard.isHidden = true
        HighScoreEasy.isHidden = false
        //startGame.isEnabled = true
    }
   
    @IBAction func startGame(_ sender: UIButton) {
        print("choises \(totChoises)")
        print("buttons \(totButtons)")
        print("time \(totTime)")
    }
    
    @IBAction func easyMode(_ sender: UISwitch) {
        if easyMode.isOn == true {
            //startGame.isHidden = false
            //startGame.isEnabled = true
            gameModeEasy = true
            gameModeHard = false
            HighScoreEasy.isHidden = false
            HighScoreHard.isHidden = true
            startGame.setImage(UIImage(named: "greenButton.png"), for: .normal)
            print("antt button on switch= \(totButtons)")
            modeField.text = "Easy"
            totButtons = 23
            totChoises = 2
            totTime = 1.0
        }
        if easyMode.isOn == false {
            //startGame.isHidden = false
            //startGame.isEnabled = true
            gameModeHard = true
            gameModeEasy = false
            HighScoreEasy.isHidden = true
            HighScoreHard.isHidden = false
            startGame.setImage(UIImage(named: "redButton.png"), for: .normal)
            print("antt button on switch= \(totButtons)")
            modeField.text = "Hard"
            
            totButtons = 23
            totChoises = 10
            totTime = 1.3
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToLevelBuilder" {
            let destinationVC = segue.destination as! LevelBuilderViewController
            
            destinationVC.antBtns = totButtons
            destinationVC.antChss = totChoises
            destinationVC.timeInter = totTime
            
            destinationVC.esyMode = gameModeEasy
            destinationVC.hrdMode = gameModeHard
        }
    }
    

  

}
