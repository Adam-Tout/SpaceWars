//
//  Shop.swift
//  SpaceInvadersGame
//
//  Created by Adam Tout on 7/30/20.
//  Copyright © 2020 Adam Tout. All rights reserved.
//

import UIKit

// This class is used to buy upgrades for the player using an in game currecy called "points" that can be collected by shooting down aliens. The class allows you to make purchases on specific upgrades that will benifit and improve the gameplay by adding powerups and overall making your ship stronger.

var arrayCounter = [0.0]

var items =  [Item] ()

var checker = true


var itemBodies: [String] = []
var itemCosts: [Int] = []

class Shop: UIViewController {
    
    
    
    
    @IBOutlet weak var amountOfPoints: UILabel?
    
    @IBOutlet weak var homeButton: UIButton?
    
    @IBOutlet weak var shopTableView: UITableView?
    
    
    @objc func updateCount(notification: NSNotification) {
        amountOfPoints!.text = "Points = \(scoreAtHome)"
        
    }
    
    func addItems() {
        //adds all the items in the shop that can be purchased
        
        let newItem = Item()
        newItem.title = "Star"
        newItem.body = "Gives Invincibility for 5 seconds"
        newItem.image = "StarPic.png"
        newItem.cost = 10000
        items.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Extra Life"
        newItem1.body = "Gives an extra life"
        newItem1.image = "heart.png"
        newItem1.cost = 50000
        items.append(newItem1)
        arrayCounter.append(0)
        
        let newItem2 = Item()
        newItem2.title = "Bomb"
        newItem2.body = "Deploys a bomb"
        newItem2.image = "bomb.png"
        newItem2.cost = 10000
        items.append(newItem2)
        arrayCounter.append(0)
        
        let newItem3 = Item()
        newItem3.title = "Increase Damage"
        newItem3.body = "upgrade"
        newItem3.image = "shot.png"
        newItem3.cost = 50000
        items.append(newItem3)
        arrayCounter.append(0)
        
        let newItem4 = Item()
        newItem4.title = "Title of Nothing"
        newItem4.body = "This doesn't do anything, don't waste your time"
        newItem4.image = "shipDead.png"
        newItem4.cost = 1000000
        items.append(newItem4)
        arrayCounter.append(0)
        
        
        for n in 0...4 {
            itemBodies.append(items[n].body)
            itemCosts.append(items[n].cost)
        }
        var count = 0.0
        for n in 0...arrayCounter.count - 1 {
            count += arrayCounter[n]
        }
        if count > 0 {
            itemBodies = defaults.stringArray(forKey: "itemBodies")!
            itemCosts = defaults.array(forKey: "itemCosts") as! [Int]
        }else {
            defaults.set(itemBodies, forKey: "itemBodies")
            defaults.set(itemCosts, forKey: "itemCosts")
        }
        
    }
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        scoreAtHome = defaults.integer(forKey: "scoreAtHome")
        
        if defaults.array(forKey: "arrayCounter") != nil {
            arrayCounter = defaults.array(forKey: "arrayCounter") as! [Double]
        }
        
        if checker {
            addItems()
        }
        checker = false
        
        
        homeButton!.layer.cornerRadius = homeButton!.frame.size.height / 2
        shopTableView!.dataSource = self
        //shopTableView!.delegate = self
        shopTableView!.register(UINib(nibName: "UpgradeCell", bundle: nil), forCellReuseIdentifier: "shopBlock")
        
        amountOfPoints!.text = "Points = \(scoreAtHome)"
        
        self.view.backgroundColor = UIColor.white
 
        NotificationCenter.default.addObserver(self, selector: #selector(updateCount(notification:)), name: .scoreCount, object: nil)
    }
    
      @IBAction func backToHomeButton(_ sender: UIButton) {
        //takes user back to homescreen
         self.dismiss(animated: true, completion: nil)
    }
}


extension Shop: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.rowHeight = 220
        tableView.estimatedRowHeight = 220
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        itemBodies = defaults.stringArray(forKey: "itemBodies")!
        itemCosts = defaults.array(forKey: "itemCosts") as! [Int]
        
        for n in 0...4 {
            items[n].body = itemBodies[n]
            items[n].cost = itemCosts[n]
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopBlock", for: indexPath) as! UpgradeCell
       
        cell.thePositionInTheArray(thePos: indexPath.row)
        cell.progressViewBar.progress =  Float(arrayCounter[indexPath.row])
        cell.typeUpgrade.text = items[indexPath.row].title
        cell.theDescription.text = items[indexPath.row].body
        cell.pictureOfUpgrade.image = UIImage(named: items[indexPath.row].image)
        cell.cost.text = "\(items[indexPath.row].cost)"
        cell.coinImage.image = UIImage(named: "CoinImage.png")
        
        if arrayCounter[indexPath.row] == 1 {
            cell.theDescription.text = "Upgrade Path Complete"
        }
        
        //adds cells in tableview to make visable for user
        
        return cell
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}



extension Notification.Name {
    static let scoreCount = Notification.Name("scorecount")
    static let buttonIsNowNotHidden = Notification.Name("buttonisnownothidden")
    static let buttonIsNowHidden = Notification.Name("buttonisnowhidden")
    //allows notifications to be sent when an upgrade is purched and make the required transaction while also giving the player an upgrade to the selected ability.
}

class Item {
    var title: String = ""
    var body: String = ""
    var image: String = ""
    var cost: Int = 0
    
    //Item class that stores attributes of an item
}


