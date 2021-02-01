//
//  ViewController.swift
//  Craps
//
//  Created by user183240 on 2/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblDice1: UILabel!
    @IBOutlet weak var lblDice2: UILabel!
    @IBOutlet weak var lblRolls: UILabel!
    
    var die1 = 1
    var die2 = 1
    var gameOver = false
    var rolls = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the
        lblRolls.text = ""
        lblRolls.numberOfLines = 0
        lblTotal.text = ""
        lblDice1.text = ""
        lblDice2.text = ""
    }
    
    @IBAction func btnRollDice(_ sender: Any) {
        if(gameOver) {
            lblRolls.text = ""
        }
        RollDice()
    }
    
    func RollDice() {
        die1 = Int.random(in: 1..<7)
        die2 = Int.random(in: 1..<7)
        UpdateLables()
    }
    
    func UpdateLables() {
        let total = die1 + die2
        lblTotal.text = "The Total is " + String(total);
        lblDice1.text = String(die1);
        lblDice2.text = String(die2);
        
        rolls.append("Player Rolled: " + String(die1) + " + "
                        + String(die2) + " = " + String(total))
        
        var rollsText = "";
        
        for s in rolls {
            rollsText += "\n" + s
        }
        
        lblRolls.text = rollsText
    }
    
    func RollResults() {
        // Determin the results of the roll:
        // Win, Loss, Point Round.
        // Display the result and do necessary logic.
        // if win or loss gameOver = true else false.
        // Append to the rolls array and then update
        // lable to add text to the rolls label
    }

}

