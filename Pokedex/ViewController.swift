//
//  ViewController.swift
//  Pokedex
//
//  Created by CFPAPP on 12/2/16.
//  Copyright © 2016 Nintendo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var attack1: UIButton!
    @IBOutlet weak var attack2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pokemonImageView.image = UIImage(named: "Idle_0001")
        returnToIdle()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setButton(enable enable :Bool){
        attack1.enabled = enable
        attack2.enabled = enable
        
        if enable {
            attack1.setTitle("Attack1", forState: UIControlState.Normal)
            attack2.setTitle("Attack2", forState: UIControlState.Normal)
            
        }
        
    }
    
    func setAnimation (animationKey : String, maxFrames : Int,
        frameDuration : Double, repeatCount : Int = 0) {
            
            pokemonImageView.stopAnimating()
            
            var animationImages = [UIImage]()
            for i in 1 ... 41 {
                let extraZero = i < 10 ? "0" : ""
                let currentImage = UIImage(named: "\(animationKey)00\(extraZero)\(i)")
                if let currentImage = currentImage {
                    animationImages.append(currentImage)
                }
            }
            
            pokemonImageView.animationImages = animationImages
            pokemonImageView.animationDuration = frameDuration
            pokemonImageView.animationRepeatCount = repeatCount
            pokemonImageView.startAnimating()
            
            
            
    }
    
    func returnToIdle() {
        setAnimation("Idle_", maxFrames: 41, frameDuration: 0.9)
        setButton(enable: true)
    }
    
    //MARK: - Actions
    @IBAction func attackAction(sender: UIButton) {
        setButton(enable: false)
        sender.setTitle("Attacking", forState: UIControlState.Normal)
    }
        
    @IBAction func attack1Action(sender: UIButton) {
        
        setAnimation("Attack1_", maxFrames: 51, frameDuration: 1.6, repeatCount: 1)

        NSTimer.scheduledTimerWithTimeInterval(1.2, target: self, selector: Selector("returnToIdle"), userInfo: nil, repeats: false)
    }
    
    @IBAction func attack2Action(sender: UIButton) {

        setAnimation("Attack_2", maxFrames: 66, frameDuration: 1.2, repeatCount: 1)
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("returnToIdle"), userInfo: nil, repeats: false)
    }
    
}

