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
            print(result)
            return result
        } else {
            return "Scissor"
        }
        
    }

    
}
