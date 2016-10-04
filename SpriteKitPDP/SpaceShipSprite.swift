//
//  SpaceShipSprite.swift
//  SpriteKitPDP
//
//  Created by Ildar Zalyalov on 04.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

import Foundation
import SpriteKit

public class SpaceShipSprite: SKSpriteNode{
    private var destination : CGPoint!
    private let easing : CGFloat = 0.1
    
    public static func newInstance() -> SpaceShipSprite {
        let spaceShip = SpaceShipSprite(imageNamed: "Spaceship")
        
        let path = UIBezierPath(cgPath:PocketSVG.path(fromSVGFileNamed: "Spaceship.svg").takeUnretainedValue() )
           path.move(to: CGPoint())
        
//        let myShapeLayer = CAShapeLayer()
//        myShapeLayer.path = PocketSVG.path(fromSVGFileNamed: "Spaceship.svg").takeUnretainedValue()
        
        spaceShip.physicsBody = SKPhysicsBody(polygonFrom:path.cgPath)
        spaceShip.physicsBody?.isDynamic = false
        spaceShip.physicsBody?.categoryBitMask = UmbrellaCategory
        spaceShip.physicsBody?.contactTestBitMask = RainDropCategory
        spaceShip.physicsBody?.restitution = 0.9
        
        return spaceShip
    }
    
    public func updatePosition(point : CGPoint) {
        position = point
        destination = point
    }
    
    public func setDestination(destination : CGPoint) {
        self.destination = destination
    }
    
    public func update(deltaTime : TimeInterval) {
        let distance = sqrt(pow((destination.x - position.x), 2) + pow((destination.y - position.y), 2))
        
        if(distance > 1) {
            let directionX = (destination.x - position.x)
            let directionY = (destination.y - position.y)
            
            position.x += directionX * easing
            position.y += directionY * easing
        } else {
            position = destination;
        }
    }
}
