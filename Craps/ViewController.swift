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
    var point = 0
    
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
        
        let loseMsg = "Player LOSES :("
        let winMsg = "Player WINS!"
        
        if(rolls.contains(loseMsg) || rolls.contains(winMsg)) {
             die1 = 1
             die2 = 1
             rolls = [String]()
             total = 0
             point = 0
        }
        
        let roll = RollDice()

        total = roll.die1 + roll.die2
        
        let status = RollResults(roll)
        
        if(status == .Lose){
            rolls.append(loseMsg)
            UpdateRolls()
            
        } else if (status == .Win){
            rolls.append(winMsg)
            UpdateRolls()
        } else {
            UpdateRolls()
        }
 
    }
    
    func RollDice() -> (die1: Int, die2: Int){
        self.die1 = Int.random(in: 1..<7)
        self.die2 = Int.random(in: 1..<7)
        
        return (die1, die2)
    }
    
    func UpdateDice(_ tuple : (Int, Int)) {
        
        lblTotal.text = "The Total is " + String(total);
        lblDice1.text = String(die1);
        lblDice2.text = String(die2);
        
        rolls.append("Player Rolled: " + String(die1) + " + "
                        + String(die2) + " = " + String(total))
    }
    
    func UpdateRolls() {
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
    
    func RollResults(_ tuple : (Int, Int)) -> ViewController.statusEnum {
        UpdateDice(tuple)
        let total = die1 + die2
        if(point == 0){
            switch (total) {
            case 7, 11:
                return .Win
            case 2, 3, 12:
                return .Lose
            default:
                point = total
                rolls.append("Point is: " + String(point))
                return .Continue
            }
        } else {
            switch total {
            case point:
                return .Win
            case 7:
                return .Lose
            default:
                return .Continue
            }
        }
        
        
    }
    
}

