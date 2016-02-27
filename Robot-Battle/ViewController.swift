//
//  ViewController.swift
//  Robot-Battle
//
//  Created by Dide van Berkel on 27-02-16.
//  Copyright © 2016 Gary Grape Productions. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player1: DarthVader!
    var player2: BB8!
    var character: Character!
    
    var bladeSound: AVAudioPlayer!
    var laserSound: AVAudioPlayer!
    var yattaSound: AVAudioPlayer!
    var gameoverSound: AVAudioPlayer!
    
    @IBOutlet weak var leftRobotHpLbl: UILabel!
    @IBOutlet weak var leftRobotImage: UIImageView!
    @IBOutlet weak var leftAttackImage: UIButton!
    
    @IBOutlet weak var rightRobotHpLbl: UILabel!
    @IBOutlet weak var rightRobotImage: UIImageView!
    @IBOutlet weak var rightAttackImage: UIButton!
    
    @IBOutlet weak var textBlockLbl: UILabel!
    @IBOutlet weak var textBlock: UIImageView!
    @IBOutlet weak var playImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blade = NSBundle.mainBundle().pathForResource("blade", ofType: "wav")
        let bladeUrl = NSURL(fileURLWithPath: blade!)
        
        do {
            try bladeSound = AVAudioPlayer(contentsOfURL: bladeUrl)
            bladeSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let laser = NSBundle.mainBundle().pathForResource("laser", ofType: "wav")
        let laserUrl = NSURL(fileURLWithPath: laser!)
        
        do {
            try laserSound = AVAudioPlayer(contentsOfURL: laserUrl)
            laserSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let yatta = NSBundle.mainBundle().pathForResource("yatta", ofType: "mp3")
        let yattaUrl = NSURL(fileURLWithPath: yatta!)
        
        do {
            try yattaSound = AVAudioPlayer(contentsOfURL: yattaUrl)
            yattaSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let gameover = NSBundle.mainBundle().pathForResource("gameover", ofType: "wav")
        let gameoverUrl = NSURL(fileURLWithPath: gameover!)
        
        do {
            try gameoverSound = AVAudioPlayer(contentsOfURL: gameoverUrl)
            gameoverSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        loadItems()
        
    }
    
    func loadItems() {
        player1 = DarthVader(startingHp: 100, attackPower: 10)
        player2 = BB8(startingHp: 125, attackPower: 15)
        
        leftRobotHpLbl.hidden = false
        leftRobotHpLbl.text = "\(player1.hp) HP"
        leftRobotImage.hidden = false
        leftAttackImage.hidden = false
        
        rightRobotHpLbl.hidden = false
        rightRobotHpLbl.text = "\(player2.hp) HP"
        rightRobotImage.hidden = false
        rightAttackImage.hidden = false
        
        textBlockLbl.hidden = false
        textBlock.hidden = false
        textBlockLbl.text = "Attack by pressing attack button!"
        
        playImage.hidden = true
    }

    @IBAction func leftRobotAttackBtn(sender: AnyObject) {
        
        if player2.attack(player1.attackPower) {
            rightRobotHpLbl.text = "\(player2.hp) HP"
            textBlockLbl.text = "Attacked by \(player1.name) for \(player2.attackPower) HP"
            
            if laserSound.playing {
                laserSound.stop()
            }
            laserSound.play()
            
        } else {
            textBlockLbl.text = "Attack was unsuccesful"
        }
        
        if !player2.isAlive {
            textBlockLbl.text = "Darth Vader defeated BB-8!"
            
            if gameoverSound.playing {
                gameoverSound.stop()
            }
            gameoverSound.play()
            
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "disableItems", userInfo: nil, repeats: false)
        } else {
            rightAttackImage.hidden = true
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "getAttackBtnBack", userInfo: nil, repeats: false)
        }
        
    }

    @IBAction func rightRobotAttackBtn(sender: AnyObject) {
        
        if player1.attack(player2.attackPower) {
            leftRobotHpLbl.text = "\(player1.hp) HP"
            textBlockLbl.text = "Attacked by \(player2.name) for \(player1.attackPower) HP"
            
            if bladeSound.playing {
                bladeSound.stop()
            }
            bladeSound.play()
            
        } else {
            textBlockLbl.text = "Attack was unsuccesful"
        }
        
        if !player1.isAlive {
            textBlockLbl.text = "BB-8 defeated Darth Vader!"
            
            if yattaSound.playing {
                yattaSound.stop()
            }
            yattaSound.play()
            
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "disableItems", userInfo: nil, repeats: false)
        } else {
            leftAttackImage.hidden = true
            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "getAttackBtnBack", userInfo: nil, repeats: false)
        }
    }
    
    @IBAction func playBtn(sender: AnyObject) {
        loadItems()
    }
    
    func disableItems(){
        
        playImage.hidden = false
        
        leftRobotHpLbl.hidden = true
        leftRobotImage.hidden = true
        leftAttackImage.hidden = true
        
        rightRobotHpLbl.hidden = true
        rightRobotImage.hidden = true
        rightAttackImage.hidden = true
        
        textBlockLbl.hidden = true
        textBlock.hidden = true
        
    }
    
    func getAttackBtnBack() {
        if rightAttackImage.hidden == true {
            rightAttackImage.hidden = false
        } else if leftAttackImage.hidden == true {
            leftAttackImage.hidden = false
        }
    }
}

