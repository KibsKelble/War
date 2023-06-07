//
//  ViewController.swift
//  War
//
//  Created by Chris Kelble on 10/20/16.
//  Copyright © 2016 Kibs. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
   
       var leftScore = 0
    
    
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var rightScoreLabel: UILabel!
    var rightScore = 0
    
    
    let cardNames = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]

    let resetPic = #imageLiteral(resourceName: "back")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetButton(_ sender: AnyObject) {
        rightScore = 0
        leftScore = 0

        rightImageView.image = #imageLiteral(resourceName: "back")
        leftImageView.image = #imageLiteral(resourceName: "back")
        
        leftScoreLabel.text = String(leftScore)
        rightScoreLabel.text = String(rightScore)
        
        //Set Color of Labels
        leftScoreLabel.textColor = UIColor.white
        rightScoreLabel.textColor  = UIColor.white

        
           }
    
    @IBAction func dealTapper(_ sender: AnyObject) {
      
        let winner = 5
        
        if rightScore == winner || leftScore == winner {
            
            return;
            
        }
        else {
            
            
        
        //Randomize left number from 0 to 12
        let leftNumber = Int(arc4random_uniform(13))
        
        
        //Set the left image
        leftImageView.image = UIImage(named: cardNames[leftNumber])
        
        //Randomize Right Image from 0 to 12
        let rightNumber = Int(arc4random_uniform(13))
        
        //Set the right image
        rightImageView.image = UIImage(named: cardNames[rightNumber])
        
        
        //Comapre the card numbers
        if leftNumber > rightNumber {
            //left card wins
            
            //Incrament Score
            leftScore += 1
            
            //Update lable
            leftScoreLabel.text = String(leftScore)
        }
        else if leftNumber == rightNumber {
            //It's a tie
        }
        else {
            //Right card wins
            
            //incrament score
            rightScore += 1
            
            //Update label
            rightScoreLabel.text = String(rightScore)
        }
        // Declare Winner forced to Reset
        if rightScore == winner {
            rightScoreLabel.textColor = UIColor.blue
        }
        else if leftScore == winner {
            leftScoreLabel.textColor = UIColor.cyan
        
        }
        }
}
}
