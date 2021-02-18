override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches {
//            ship.spaceShip.position.y = touch.location(in: self).y + 80
            ship.spaceShip.position.y = touch.location(in: self).y + 100
            ship.spaceShip.position.x = touch.location(in: self).x
            
            touchedNode = atPoint(touch.location(in: self))
            
            
            if circle {
//                self.powerUp.bubble.position.y = touch.location(in: self).y + 80
                self.powerUp.bubble.position.y = touch.location(in: self).y + 100
                self.powerUp.bubble.position.x = touch.location(in: self).x
            }
            
            touchedNodeLogic()
        }

        
    }
    
    func touchedNodeLogic() {
        if touchedNode.name == "homeLabel" {
            
            resetGame()
        }
        
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            //ship.spaceShip.position = touch.location(in: self)
//            ship.spaceShip.position.y = touch.location(in: self).y + 80
            ship.spaceShip.position.y = touch.location(in: self).y + 100
            ship.spaceShip.position.x = touch.location(in: self).x
            
            if circle {
//                self.powerUp.bubble.position.y = touch.location(in: self).y + 80
                self.powerUp.bubble.position.y = touch.location(in: self).y + 100
                self.powerUp.bubble.position.x = touch.location(in: self).x
            }
        }
            
            
            ----------------------------------------------------------------------------------------------------------------------------
             //gameScene
            
            if defaults.integer(forKey: "maxHearts") == 4 {
                //heart = 3
                 heart = 4
            }else {
                 heart = 2
            }

        

            ----------------------------------------------------------------------------------------------------------------------------
