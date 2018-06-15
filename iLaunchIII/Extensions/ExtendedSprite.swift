//
//  ExtendedSprite.swift
//  Cycles
//
//  Created by Caleb Dubow on 1/12/17.
//  Copyright © 2017 Caleb Dubow. All rights reserved.
//

struct PhysicsMasks{
    static let Light:UInt32 = 0x1<<1
    static let Sprite:UInt32 = 0x1<<2
}

import SpriteKit

class ExtendedSprite:SKSpriteNode{
    var myScene:SKScene
    var light:SKLightNode = SKLightNode()
    var booster:SKEmitterNode = SKEmitterNode()
    var camera:SKCameraNode = SKCameraNode()
    
    //Define any other properties here:
    
    
    //
    
    init(scene:SKScene){
        //Establish Scene property
        self.myScene = scene
        
        //Set SKSpriteNode Positional and Visual Properties
        let texture:SKTexture = SKTexture(imageNamed:"SomeDefaultImage")
        super.init(texture:texture,color:.clear,size:texture.size())    //Set default image and size
        self.zPosition = 0                                              //Set zPosition
        self.name = "someSpriteName"                                    //Set name
        self.setScale(0.3)                                              //Set size (you can use anything really)
        self.position = CGPoint(x:0,y:0)                                //Set position
        
        //Add animation
        addAnimation()
        //Set SKSpriteNode Physics
        setPhysics()
        
        //AddLighting
        addLighting()
        //AddEmitter
        addEmitter()
    }
    
    init(){
        self.myScene = SKScene()
        let texture = SKTexture(imageNamed: "SomeDefaultImage")
        super.init(texture:texture,color:.clear,size:texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///
    func addAnimation(){
        let myAnimation:[String] = ["List of Image Names for your animation"]    //Define the frames of your sprite animation
        let frameSpeed:TimeInterval = 0.04                                       //Define in seconds how fast each frame will go by
        var array:[SKTexture] = []
        for image in myAnimation{
            let t:SKTexture = SKTexture(imageNamed:image)
            array.append(t)
        }
        let walk:SKAction = SKAction.animate(with:array,timePerFrame:frameSpeed)
        let walkOn:SKAction = SKAction.repeatForever(walk)
        self.run(walkOn)
    }
    
    func setPhysics(){ //change all properties here to your needs
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: CGSize(width:self.size.width,height:self.size.height))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = true
        
        self.physicsBody?.categoryBitMask = PhysicsMasks.Sprite
        self.physicsBody?.collisionBitMask = PhysicsMasks.Sprite
        self.physicsBody?.contactTestBitMask = PhysicsMasks.Sprite
        
        self.physicsBody?.mass = 100
        self.physicsBody?.restitution = 0
        self.physicsBody?.friction = 0
    }
    
    func addLighting(){
        light.position = CGPoint(x:0,y:0)                                       //Define the position of the light relative to the spritenode
        light.isEnabled = true
        light.categoryBitMask = PhysicsMasks.Light                              //Define the physics light reference
        light.falloff = 1                                                       //Define (0-1) how much the light fades
        light.shadowColor = UIColor(red:0,green:0,blue:0,alpha:0.3)             //Define the color of the shadow
        light.lightColor = .white                                               //Define the color of the light
        light.ambientColor = .black                                             //Define the ambient color (usually black)
        light.zPosition = 4
        self.addChild(light)
        
        self.lightingBitMask = PhysicsMasks.Light                               //Make self respond to light
        self.shadowCastBitMask = PhysicsMasks.Light                             //Make self get a shadow from light
    }
    
    func addEmitter(){
        booster = SKEmitterNode(fileNamed:"SomeSKSFile")!                        //Define the particles
        booster.position = CGPoint(x:0,y:0)                                         //Define position of particles relative to the spritenode
        booster.zPosition = 4
        self.addChild(booster)
    }
    
    //Define any action methods that the sprite can do:
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ///////
    
    
}

