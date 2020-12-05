//
//  PowerUp.swift
//  SpaceInvadersGame
//
//  Created by Adam Tout on 8/7/20.
//  Copyright © 2020 Adam Tout. All rights reserved.
//

import SpriteKit
import GameplayKit

//This class makes the powerups and allows them to fall from random points on the screen down. If the player collects any of them, they will receive a unique ability that will assist them in fighting off the aliens.

class PowerUp {
    
    
    func spawnInvincibilityPowerUp() -> SKSpriteNode{
        let spawn = SKSpriteNode(imageNamed: "StarPic.png")
        
        let randomPosition = Int.random(in: Int(-screenWidth * 2)...Int(screenWidth * 2))
        
        spawn.position = CGPoint(x: randomPosition, y: Int(screenHeight) + 100  )
        spawn.size = CGSize(width: screenWidth / 3, height: screenWidth / 3)
        
        spawn.physicsBody = SKPhysicsBody(rectangleOf: spawn.size)
        spawn.physicsBody?.affectedByGravity = false
        spawn.physicsBody?.allowsRotation = false
        spawn.physicsBody?.categoryBitMask = physicsCategory.powerUp
        spawn.physicsBody?.contactTestBitMask = physicsCategory.player
        spawn.physicsBody?.isDynamic = true
        spawn.physicsBody?.collisionBitMask = 0
        spawn.name = "star"
        
        //Making starPowerUp including szie and setting location
        
        let moveForward = SKAction.move(by: CGVector(dx: 0, dy: -screenHeight * 3), duration: 5)
        
        let remove = SKAction.run {
            spawn.removeFromParent()
        }
        
        //this allows the star to move a set distance at a set speed from the top of the screen to the bottom then removes it
        
        let rotate = SKAction.rotate(byAngle: 2, duration: 1)
               
        let sequence = SKAction.sequence([moveForward,remove])
        spawn.run(sequence)
        spawn.run(SKAction.repeatForever(rotate))
        
        //makes for a spinning animation
        
        
        return spawn
    }
    
    let bubble = SKSpriteNode(imageNamed: "spaceBubble.png")
    
    func spawnBubblePowerUp() -> SKSpriteNode {
        
         
        bubble.size = CGSize(width: screenWidth / 2, height: screenWidth / 2)
        
        
        let wait = SKAction.wait(forDuration: 4.2)
        
        let blink = SKAction.run {
            self.bubble.isHidden = true
        }
        let waitSmallDuration = SKAction.wait(forDuration: 0.1)
        
        let back = SKAction.run {
            self.bubble.isHidden = false
        }
        
        
        let otherSequence = SKAction.sequence([blink,waitSmallDuration,back,waitSmallDuration])
        
        let performAction = SKAction.repeat(otherSequence, count: 4)
        
        let remove = SKAction.run {
            self.bubble.removeFromParent()
        }
        let sequence = SKAction.sequence([wait,performAction,remove])
        
        bubble.run(sequence)
        
        //This is the bubble invincibility power affect that the player recieves if he runs into the star. Allows spaceship to have a bubble around him and is unable to be hit by attacks coming from the aliens.
        return bubble
    }
    
    
    
    func spawnBombPowerUp() -> SKSpriteNode{
        let spawn = SKSpriteNode(imageNamed: "bomb.png")
        
        let randomPosition = Int.random(in: Int(-screenWidth * 2)...Int(screenWidth * 2))
        
        spawn.position = CGPoint(x: randomPosition, y: Int(screenHeight) + 100  )
        spawn.size = CGSize(width: screenWidth / 3, height: screenWidth / 3)
        
        spawn.physicsBody = SKPhysicsBody(rectangleOf: spawn.size)
        spawn.physicsBody?.affectedByGravity = false
        spawn.physicsBody?.allowsRotation = false
        spawn.physicsBody?.categoryBitMask = physicsCategory.powerUp
        spawn.physicsBody?.contactTestBitMask = physicsCategory.player
        spawn.physicsBody?.isDynamic = true
        spawn.physicsBody?.collisionBitMask = 0
        spawn.name = "bomb"
        
        //make bomb
        
        let moveForward = SKAction.move(by: CGVector(dx: 0, dy: -screenHeight * 3), duration: 5)
        
        let remove = SKAction.run {
            spawn.removeFromParent()
        }
        
        let rotate = SKAction.rotate(byAngle: 2, duration: 1)
               
        let sequence = SKAction.sequence([moveForward,remove])
        spawn.run(sequence)
        spawn.run(SKAction.repeatForever(rotate))
        
        //This function makes a bomb that if spaceship comes in contact with will eliminate all aliens on the screen and shots coming your way.
        
        return spawn
    }
}
