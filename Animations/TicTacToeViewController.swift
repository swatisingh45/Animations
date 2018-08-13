//
//  TicTacToeViewController.swift
//  Animations
//
//  Created by Swati Singh on 16/06/18.
//  Copyright © 2018 Swati Singh. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    // 1 is nought and 2 is cross
    
    
    
    
    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playAgainLabel: UIButton!
    
    @IBAction func playAgainButton(_ sender: Any) {
    }
    
    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0] // 0-empty, 1-noughts, 2 -crosses
    let wininngCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    // we need a variable in order track the status of game
    
    var activeGame = true
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        var activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            if activePlayer == 1{
                
                //For getting the tag in the output console,do the following :-
                //Putting this exclamation mark will make sure, this doesn't assume it as an optional value.
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for : [])
                activePlayer = 2
                
                
            } else {
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for : [])
                activePlayer = 1
               
            }
            
            // Looping over winning combinations
            for combination in wininngCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    // It's a win
                    
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainLabel.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        winnerLabel.text = "Noughts have won!"
                    }else {
                        
                        winnerLabel.text = "Crosses have won!"
                    }
                        UIView.animate(withDuration: 1) {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainLabel.center = CGPoint(x: self.playAgainLabel.center.x + 500, y: self.playAgainLabel.center.y)
                    }
                    
                }
            
            }
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        playAgainLabel.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x-500, y: winnerLabel.center.y)
        playAgainLabel.center = CGPoint(x: playAgainLabel.center.x-500, y: playAgainLabel.center.y)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
