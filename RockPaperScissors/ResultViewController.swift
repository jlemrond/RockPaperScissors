//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Jason Lemrond on 11/13/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit
import Foundation

enum RPS: String {
    
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissor = "Scissor"
    
    
    //Use init to generate a random value.
    init() {
        let int = arc4random_uniform(3)
        
        switch int {
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissor
        }
    }
    
}


class ResultViewController: UIViewController {

    var userSelection: RPS!
    var compSelection: RPS!
    
    var playAgain: UIButton!
    var result: UILabel!
    
    let textColor: UIColor = UIColor(red: CGFloat(91/255.0), green: CGFloat(112/255.0), blue: CGFloat(101/255.0), alpha: 1.0)
    
    override func viewWillAppear(animated: Bool) {
        compSelection = RPS.init()
        print("Comp has selected \(compSelection)")
        
        establishWinner(userSelection, comp: compSelection)
        
        let x = UIButton(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
        self.view.addSubview(x)
        
        self.view.backgroundColor = UIColor(red: CGFloat(201/255.0), green: CGFloat(209/255.0), blue: CGFloat(200/255.0), alpha: 1.0)
    }
    
    override func viewDidLoad() {
        
        //Set up Play Again Button.
        playAgain = UIButton(frame: CGRect(x: 125, y: 450, width: 125, height: 40))
        self.view.addSubview(playAgain)
        
        playAgain.setTitle("Play Again", forState: .Normal)
        playAgain.setTitleColor(textColor, forState: .Normal)
        playAgain.addTarget(self, action: "playAgainSelected", forControlEvents: UIControlEvents.TouchUpInside)
        
        //Set up Result Label.
        result = UILabel(frame: CGRect(x: 125, y: 250, width: 125, height: 40))
        self.view.addSubview(result)
        
        result.textColor = textColor
        result.textAlignment = .Center

    }
    
    
    //Establish Winner.
    func establishWinner(user: RPS, comp: RPS) {
        
        print(user.rawValue)
        print(comp.rawValue)
        
        if user == comp {
            result.text = "It's a Tie!"
        } else {
            switch (user, comp) {
            case (.Rock, .Scissor), (.Scissor, .Paper), (.Paper, .Rock):
                result.text = "You Win!"
            case (.Scissor, .Rock), (.Paper, .Scissor), (.Rock, .Paper):
                result.text = "You Lose, Sucker!"
            default:
                print("I think something went wrong... Oops")
            }
        }
        
        print(result.text)

    }
    
    //Method to bring up previous screen (Play Again)
    func playAgainSelected() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
