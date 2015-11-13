//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Jason Lemrond on 11/13/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit
import Foundation

class ResultViewController: UIViewController {

    var userSelection: String!
    var compSelection: String!
    
    override func viewWillAppear(animated: Bool) {
        compSelection = generateOpponentResult()
        print("Comp has selected \(compSelection)")
        
        
        
        establishWinner()   
    }
    
    override func viewDidLoad() {
        
    }
    
    
    //Generate Random Result for 'Opponent'
    func generateOpponentResult() -> String {
        
        let index = arc4random_uniform(3)
        let result: String?
        
        switch index {
        case 0: result = "Rock"
        case 1: result = "Paper"
        default: result = "Scissor"
        }
        
        if let result = result {
            return result
        } else {
            return "Scissor"
        }
        
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
    func establishWinner() {
        
        let user = convertToNumber(userSelection)
        let comp = convertToNumber(compSelection)
        
        print(user)
        print(comp)
        
        if user == comp {
            print("it's a Tie")
        } else if user == 1 {
            if comp == 2 {
                print("Comp Wins")
            } else {
                print("User Wins")
            }
        } else if user > comp {
            print("User Wins")
        } else {
            print("Comp Wins")
        }
        
        
    }
}
