//
//  ViewController.swift
//  Animations
//
//  Created by Swati Singh on 16/06/18.
//  Copyright © 2018 Swati Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    
    
    
    
    @IBAction func fadeIn(_ sender: Any) {
        // Makes the image invisible
        image.alpha = 0
        //gradually makes the alpha to 1
        
        UIView.animate(withDuration: 1, animations: {
            
            
            self.image.alpha = 1
            
            
            
        })
        
        
    }
    
    
    @IBAction func slideIn(_ sender: Any) {
        // For slider we first need to move the image off screen
        //For that we need to change the centre of the imgae using CG Point i.e short for core graphcis and we need to define X and Y
        
        image.center = CGPoint(x: image.center.x-600, y: image.center.y)
        UIView.animate(withDuration: 1) {
            
            self.image.center = CGPoint(x: self.image.center.x+600, y: self.image.center.y)
            
        }
        
        
    }
    
    
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width:0, height: 0)
        
        UIView.animate(withDuration : 1) {
            
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
        
        
    }
    
    
    
    
    @IBOutlet var startButton: UIButton!
    
    var counter = 1
    
    var timer = Timer()
    
    var isAnimating = false
    
    @objc func animate()
    {
        image.image = UIImage(named: "frame_0\(counter)_delay-0.08s.gif")
        
        counter += 1
        
        if counter == 6 {
            
            counter = 0
        }
        
        
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        if isAnimating {
            
            timer.invalidate()
            
            startButton.setTitle("Start Animating", for: [])
            
            isAnimating = false
            
        } else {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            startButton.setTitle("Stop Animating", for: [])
            isAnimating = true
        }
        
    }
    
    
    @IBOutlet var image: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

