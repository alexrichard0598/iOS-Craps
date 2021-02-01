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
    var rolls = [String]()
    var total = 0
    var status = statusEnum.Continue
    
    enum statusEnum {
        case Continue
        case Win
        case Lose
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblRolls.text = ""
        lblRolls.numberOfLines = 0
        lblTotal.text = ""
        lblDice1.text = ""
        lblDice2.text = ""
    }
    
    @IBAction func btnRollDice(_ sender: Any) {
        status = RollResults(total)
        
        if(status == .Lose){
            //update rolls array with Lose
            UpdateLables(RollDice(die1, die2))
        } else if (status == .Win){
            //update rolls array with Win
            UpdateLables(RollDice(die1, die2))
        } else {
            //continue
            UpdateLables(RollDice(die1, die2))
        }
        
    }
    
    func RollDice(_ die1: Int, _ die2: Int) -> (die1: Int, die2: Int){
        self.die1 = Int.random(in: 1..<7)
        self.die2 = Int.random(in: 1..<7)
        
        return (die1, die2)
    }
    
    func UpdateLables(_ tuple : (Int, Int)) {
        total = die1 + die2
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
    
    func ResetLabels(){
        total = 0
        lblTotal.text = "The Total is "
        lblDice1.text = ""
        lblDice2.text = ""
        
    }
    
    func RollResults(_ total: Int) -> ViewController.statusEnum {
        // Determin the results of the roll:
        // Win, Loss, Point Round.
        // Display the result and do necessary logic.
        // if win or loss gameOver = true else false.
        // Append to the rolls array and then update
        // lable to add text to the rolls label
        
        switch (total) {
        case 7, 11:
            return .Win
        case 2, 3, 12:
            return .Lose
        default:
            return .Continue
        }
        
    }
    
}

