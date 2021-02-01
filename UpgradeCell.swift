//
//  UpgradeCell.swift
//  SpaceInvadersGame
//
//  Created by Adam Tout on 8/25/20.
//  Copyright © 2020 Adam Tout. All rights reserved.
//

import UIKit

var maxHearts = 2
class UpgradeCell: UITableViewCell {

    
    
    @IBOutlet weak var typeUpgrade: UILabel!
    
    
    @IBOutlet weak var cost: UILabel!
    
    
    @IBOutlet weak var coinImage: UIImageView!
    
    @IBOutlet weak var theDescription: UILabel!
    
    @IBOutlet weak var pictureOfUpgrade: UIImageView!
    
    
    @IBOutlet weak var progressViewBar: UIProgressView!
    
    @IBOutlet weak var buttonForUpgrade: UIButton!
    
    
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        buttonForUpgrade.titleLabel?.font = UIFont(name: "Helvetica", size: 20 )
//        buttonForUpgrade.frame.size = CGSize(width: 50, height: 50)
//        buttonForUpgrade.layer.cornerRadius = 10
//        if anyIpad {
//            cost.font = cost.font.withSize(40)
//            coinImage.frame.size = CGSize(width: 1000, height: 1000)
//            buttonForUpgrade.titleLabel?.font = UIFont(name: "Helvetica", size: 50)
//            buttonForUpgrade.frame.size = CGSize(width: 1000, height: 500)
//            buttonForUpgrade.layer.cornerRadius = 25
        //
        if anyIpad{
        
            buttonForUpgrade.layer.cornerRadius = 50
            buttonForUpgrade.titleLabel?.adjustsFontSizeToFitWidth = true
            typeUpgrade.font = typeUpgrade.font.withSize(20)
            theDescription.font = typeUpgrade.font.withSize(20)
            cost.font = cost.font.withSize(20)
        }
        
        //buttonForUpgrade.frame
        
//        }
        
        
        
        buttonForUpgrade.layer.cornerRadius = 10 //10
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var theExactPositionInTheArray = 0
    func thePositionInTheArray(thePos: Int) {
        theExactPositionInTheArray = thePos
    }
    
    
    
    @IBAction func upgradeButton(_ sender: Any) {
        
        
        let theCost = Int(cost.text ?? "0")
        if theCost! <= scoreAtHome && progressViewBar.progress < 1{
            
            
            scoreAtHome -= theCost!
            upgradeBought()
            
            defaults.set(scoreAtHome, forKey: "scoreAtHome")

            NotificationCenter.default.post(name: .scoreCount, object: nil)
 

        }
        //shop.updateScore()
    }
    
   // var theArray = [0.5,true,false,2] as [Any]
    
    func upgradeBought() {
        
        
        if typeUpgrade.text == "Star" {
            if theDescription.text == "Reduce Cooldown" {
                starPowerUpMinDuration -= 5
                starPowerUpMaxDuration -= 5
            }
            starWillAppear = true
            let numberCost = String(Int(Double(Int(cost.text ?? "0")!) * 2))
            cost.text = numberCost
            progressViewBar.progress += 1 / 3
            arrayCounter[theExactPositionInTheArray] += 1/3
            theDescription.text = "Reduce Cooldown"
            
            
            defaults.set(starPowerUpMinDuration, forKey: "starPowerUpMinDuration")
            defaults.set(starPowerUpMaxDuration, forKey: "starPowerUpMaxDuration")
            
            
            items[theExactPositionInTheArray].body = "Reduce Cooldown"
            items[theExactPositionInTheArray].cost = Int(numberCost)!
            
            
            itemBodies[theExactPositionInTheArray] = "Reduce Cooldown"
            itemCosts[theExactPositionInTheArray] = Int(numberCost)!
            
            defaults.set(itemBodies, forKey: "itemBodies")
            defaults.set(itemCosts, forKey: "itemCosts")
                
            
            if progressViewBar.progress == 1 {
                theDescription.text = "Upgrade Path Complete"
            }
            }
            
            
                
        
        if typeUpgrade.text == "Extra Life" {
            maxHearts = 3
            progressViewBar.progress = 1
            arrayCounter[theExactPositionInTheArray] += 1
            
            defaults.set(3, forKey: "maxHearts")
            
            if progressViewBar.progress == 1 {
                theDescription.text = "Upgrade Path Complete"
            }
            
        }
        
        if typeUpgrade.text == "Bomb" {
            if theDescription.text == "Reduce Cooldown" {
                bombPowerUpMinDuration -= 2
                bombPowerUpMaxDuration -= 6
            }
            bombWillAppear = true
            let numberCost = String(Int(Double(Int(cost.text ?? "0")!) * 2))
            cost.text = numberCost
            progressViewBar.progress += 1 / 3
            arrayCounter[theExactPositionInTheArray] += 1/3
            theDescription.text = "Reduce Cooldown"
            
            
            defaults.set(bombPowerUpMinDuration, forKey: "bombPowerUpMinDuration")
            defaults.set(bombPowerUpMaxDuration, forKey: "bombPowerUpMaxDuration")
            
            
            items[theExactPositionInTheArray].body = "Reduce Cooldown"
            items[theExactPositionInTheArray].cost = Int(numberCost)!
            
            itemBodies[theExactPositionInTheArray] = "Reduce Cooldown"
            itemCosts[theExactPositionInTheArray] = Int(numberCost)!
            
            defaults.set(itemBodies, forKey: "itemBodies")
            defaults.set(itemCosts, forKey: "itemCosts")
            
            if progressViewBar.progress == 1 {
                theDescription.text = "Upgrade Path Complete"
            }
            
        }
        
        if typeUpgrade.text == "Increase Damage" {
            progressViewBar.progress = 1
            arrayCounter[theExactPositionInTheArray] += 1
            shipDamage = true
            
            defaults.set(shipDamage, forKey: "shipDamage")
            if progressViewBar.progress == 1 {
                theDescription.text = "Upgrade Path Complete"
            }
        }
        
//        if typeUpgrade.text == "Title of Nothing" {
//
//            progressViewBar.progress = 1
//            arrayCounter[theExactPositionInTheArray] += 1
//            theDescription.text = "No...don't tell me you actually"
//
//
//
//
//
//            items[theExactPositionInTheArray].body = "No...don't tell me you actually"
//            
//            itemBodies[theExactPositionInTheArray] = "No...don't tell me you actually"
//
//
//            defaults.set(itemBodies, forKey: "itemBodies")
//        }
        //defaults.array(forKey: "itemCosts") as! [Int]
        defaults.set(arrayCounter, forKey: "arrayCounter")
        
        
    }
    
}


