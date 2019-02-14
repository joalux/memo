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
    @IBOutlet weak var hardMode: UISwitch!
    @IBOutlet weak var customMode: UISwitch!
    
    @IBOutlet weak var buttonSlider: UISlider!
    @IBOutlet weak var choisesSlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBOutlet weak var startGame: UIButton!

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var choiseLabel: UILabel!
    @IBOutlet weak var buttonsLabel: UILabel!
    
    
    var gameModeEasy = false, gameModeHard = false, gameModeCustom = false
    var totButtons = 1, totChoises = 1, totTime = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        easyMode.isOn = false
        hardMode.isOn = false
        customMode.isOn = false
        startGame.isEnabled = false
        
        
        timeLabel.text = "\(totTime)"
        choiseLabel.text = "\(totChoises)"
        buttonsLabel.text = "\(totButtons)"
        buttonSlider.isEnabled = false
        choisesSlider.isEnabled = false
        timeSlider.isEnabled = false
        
    }
   
    
    @IBAction func startGame(_ sender: UIButton) {
        print("choises \(totChoises)")
        print("buttons \(totButtons)")
        print("time \(totTime)")
    }
    
    
    @IBAction func easyMode(_ sender: UISwitch) {
        if easyMode.isOn == true {
            startGame.isHidden = false
            
            hardMode.isOn = false
            customMode.isOn = false
            startGame.isEnabled = true
            buttonSlider.isEnabled = false
            choisesSlider.isEnabled = false
            timeSlider.isEnabled = false
            startGame.setImage(UIImage(named: "greenButton.png"), for: .normal)
            print("antt button on switch= \(totButtons)")
            totButtons = 4
            totChoises = 2
            totTime = 1.0
        }
    }
    @IBAction func hardMode(_ sender: UISwitch) {
        if hardMode.isOn == true {
            
            easyMode.isOn = false
            customMode.isOn = false
            startGame.isEnabled = true

            buttonSlider.isEnabled = false
            choisesSlider.isEnabled = false
            timeSlider.isEnabled = false
            startGame.setImage(UIImage(named: "redButton.png"),            for: .normal)
            totButtons = 23
            totChoises = 7
            totTime = 2
        }
    }
    @IBAction func customMode(_ sender: UISwitch) {
        if customMode.isOn == true {
            
            easyMode.isOn = false
            hardMode.isOn = false
            startGame.isEnabled = true

            startGame.setImage(UIImage(named: "orangeButtonButton.png"), for: .normal)
            buttonSlider.isEnabled = true
            choisesSlider.isEnabled = true
            timeSlider.isEnabled = true
        }
    }
    @IBAction func antButtons(_ sender: UISlider) {
        totButtons = Int(sender.value)
        buttonsLabel.text = "\(totButtons)"

    }
    @IBAction func antChoises(_ sender: UISlider) {
        totChoises = Int(sender.value)
        choiseLabel.text = "\(totChoises)"

    }
    @IBAction func amoTime(_ sender: UISlider) {
        totTime = Double(sender.value)
        timeLabel.text = "\(totTime)"

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToLevelBuilder" {
            let destinationVC = segue.destination as! LevelBuilderViewController
            
            destinationVC.antBtns = totButtons
            destinationVC.antChss = totChoises
            destinationVC.timeInter = totTime
            destinationVC.cstmMode = gameModeCustom
            destinationVC.esyMode = gameModeEasy
            destinationVC.hrdMode = gameModeHard
        }
    }
    

  

}
