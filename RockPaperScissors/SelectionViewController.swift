//
//  SelectionViewController.swift
//  RockPaperScissors
//
//  Created by Jason Lemrond on 11/13/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit
import Foundation

class SelectionViewController: UIViewController {
    
    var rockButton: UIButton!
    var scissorButton: UIButton!
    var paperButton: UIButton!
    var rpsButtons: [UIButton]!
    
    override func viewWillAppear(animated: Bool) {
        
        //Set up RPS buttons
        let rpsImgSize = CGSizeMake(65, 65)
        
        rockButton = UIButton(frame: CGRect(origin: CGPoint(x: 45.0, y: 250.0), size: rpsImgSize))
        rockButton.setImage(UIImage(named: "Rock"), forState: .Normal)
        
        scissorButton = UIButton(frame: CGRect(origin: CGPoint(x: 155.0, y: 250.0), size: rpsImgSize))
        scissorButton.setImage(UIImage(named: "Scissors"), forState: .Normal)
        
        paperButton = UIButton(frame: CGRect(origin: CGPoint(x: 265.0, y: 250.0), size: rpsImgSize))
        paperButton.setImage(UIImage(named: "Paper"), forState: .Normal)
        
        rpsButtons = [rockButton, scissorButton, paperButton]
        
        for x in rpsButtons {
            x.addTarget(self, action: "selectionMade:", forControlEvents: UIControlEvents.TouchUpInside)
            self.view.addSubview(x)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func selectionMade(sender: UIButton!) {
        
        var controller: ResultViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        switch sender {
        case rockButton: controller.userSelection = "Rock"
        case paperButton: controller.userSelection = "Paper"
        case scissorButton: controller.userSelection = "Scissor"
        default: print("Error with selection")
        }
        
        print("User has selected \(controller.userSelection).")
        
        presentViewController(controller, animated: true, completion: nil)
        
    }

}

