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
    
    override func viewWillAppear(animated: Bool) {
        compSelection = RPS.init()
        print("Comp has selected \(compSelection)")
        
        
        
        establishWinner(userSelection, comp: compSelection)
    }
    
    override func viewDidLoad() {
        
    }

    //Convert RPS to numbers.
    func convertToNumber(selection: String) -> Int {
        
        switch selection {
            case "Rock": return 1
            case "Paper": return 2
            case "Scissor": return 3
            default: return 0
        }
        
    }
    
    
    //Establish Winner.
    func establishWinner(user: RPS, comp: RPS) {
        
        print(user.rawValue)
        print(comp.rawValue)
        
        if user == comp {
            print("It's a tie")
        } else {
            switch (user, comp) {
            case (.Rock, .Scissor), (.Scissor, .Paper), (.Paper, .Rock):
                print("You Win!")
            case (.Scissor, .Rock), (.Paper, .Scissor), (.Rock, .Paper):
                print("You Lose!")
            default:
                print("I think something went wrong... Oops")
            }
        }   
        
    }
}
