//
//  FalconHeavy.swift
//  iLaunch3DII
//
//  Created by Wendell Li on 5/15/18.
//  Copyright © 2018 Wendell Li. All rights reserved.
//

//FalconHeavy.Swift is the object for the rocket

import Foundation
import SceneKit

class FalconHeavy:SCNNode {
    
    //nodes
    let emptyFH = SCNNode()
    var FHLB = SCNNode()
    var FHMB = SCNNode()
    var FHRB = SCNNode()
    var FHLP = SCNNode()
    
    //initialization
    override init() {
        super.init()
        
        setupModel()
        //loadAnimations()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //scene
    private func setupModel() {
        
        let RocketScene = SCNScene(named: "art.scnassets/Rockets/FalconHeavy/FalconHeavy.scn")!
        
        // Main parts
        let FHMB = RocketScene.rootNode.childNode(withName: "polySurface288", recursively: true)!
        emptyFH.addChildNode(FHMB)
        let FHLB = RocketScene.rootNode.childNode(withName: "polySurface205", recursively: true)!
        emptyFH.addChildNode(FHLB)
        let FHRB = RocketScene.rootNode.childNode(withName: "polySurface286", recursively: true)!
        emptyFH.addChildNode(FHRB)
        let FHUB = RocketScene.rootNode.childNode(withName: "polySurface290", recursively: true)!
        emptyFH.addChildNode(FHUB)
        FHLP = RocketScene.rootNode.childNode(withName: "polySurface252", recursively: true)!
        emptyFH.addChildNode(FHLP)
        let FHRP = RocketScene.rootNode.childNode(withName: "polySurface253", recursively: true)!
        emptyFH.addChildNode(FHRP)
        
        // Grid Finns
        let FHLGF1 = RocketScene.rootNode.childNode(withName: "polySurface281", recursively: true)!
        emptyFH.addChildNode(FHLGF1)
        let FHLGF2 = RocketScene.rootNode.childNode(withName: "polySurface278", recursively: true)!
        emptyFH.addChildNode(FHLGF2)
        let FHLGF3 = RocketScene.rootNode.childNode(withName: "polySurface269", recursively: true)!
        emptyFH.addChildNode(FHLGF3)
        let FHLGF4 = RocketScene.rootNode.childNode(withName: "polySurface266", recursively: true)!
        emptyFH.addChildNode(FHLGF4)
        
        let FHMGF1 = RocketScene.rootNode.childNode(withName: "polySurface273", recursively: true)!
        emptyFH.addChildNode(FHMGF1)
        let FHMGF2 = RocketScene.rootNode.childNode(withName: "polySurface270", recursively: true)!
        emptyFH.addChildNode(FHMGF2)
        let FHMGF3 = RocketScene.rootNode.childNode(withName: "polySurface265", recursively: true)!
        emptyFH.addChildNode(FHMGF3)
        let FHMGF4 = RocketScene.rootNode.childNode(withName: "polySurface262", recursively: true)!
        emptyFH.addChildNode(FHMGF4)
        
        let FHRGF1 = RocketScene.rootNode.childNode(withName: "polySurface277", recursively: true)!
        emptyFH.addChildNode(FHRGF1)
        let FHRGF2 = RocketScene.rootNode.childNode(withName: "polySurface274", recursively: true)!
        emptyFH.addChildNode(FHRGF2)
        let FHRGF3 = RocketScene.rootNode.childNode(withName: "polySurface261", recursively: true)!
        emptyFH.addChildNode(FHRGF3)
        let FHRGF4 = RocketScene.rootNode.childNode(withName: "polySurface258", recursively: true)!
        emptyFH.addChildNode(FHRGF4)
        
        // Landing Legs
        let FHLLG1 = RocketScene.rootNode.childNode(withName: "polySurface180", recursively: true)!
        emptyFH.addChildNode(FHLLG1)
        let FHLLG1s = RocketScene.rootNode.childNode(withName: "polySurface179", recursively: true)!
        emptyFH.addChildNode(FHLLG1s)
        let FHLLG2 = RocketScene.rootNode.childNode(withName: "polySurface182", recursively: true)!
        emptyFH.addChildNode(FHLLG2)
        let FHLLG2s = RocketScene.rootNode.childNode(withName: "polySurface181", recursively: true)!
        emptyFH.addChildNode(FHLLG2s)
        let FHLLG3 = RocketScene.rootNode.childNode(withName: "polySurface184", recursively: true)!
        emptyFH.addChildNode(FHLLG3)
        let FHLLG3s = RocketScene.rootNode.childNode(withName: "polySurface183", recursively: true)!
        emptyFH.addChildNode(FHLLG3s)
        let FHLLG4 = RocketScene.rootNode.childNode(withName: "polySurface186", recursively: true)!
        emptyFH.addChildNode(FHLLG4)
        let FHLLG4s = RocketScene.rootNode.childNode(withName: "polySurface185", recursively: true)!
        emptyFH.addChildNode(FHLLG4s)
        
        let FHMLG1 = RocketScene.rootNode.childNode(withName: "polySurface188", recursively: true)!
        emptyFH.addChildNode(FHMLG1)
        let FHMLG1s = RocketScene.rootNode.childNode(withName: "polySurface187", recursively: true)!
        emptyFH.addChildNode(FHMLG1s)
        let FHMLG2 = RocketScene.rootNode.childNode(withName: "polySurface190", recursively: true)!
        emptyFH.addChildNode(FHMLG2)
        let FHMLG2s = RocketScene.rootNode.childNode(withName: "polySurface189", recursively: true)!
        emptyFH.addChildNode(FHMLG2s)
        let FHMLG3 = RocketScene.rootNode.childNode(withName: "polySurface192", recursively: true)!
        emptyFH.addChildNode(FHMLG3)
        let FHMLG3s = RocketScene.rootNode.childNode(withName: "polySurface191", recursively: true)!
        emptyFH.addChildNode(FHMLG3s)
        let FHMLG4 = RocketScene.rootNode.childNode(withName: "polySurface194", recursively: true)!
        emptyFH.addChildNode(FHMLG4)
        let FHMLG4s = RocketScene.rootNode.childNode(withName: "polySurface193", recursively: true)!
        emptyFH.addChildNode(FHMLG4s)
        
        let FHRLG1 = RocketScene.rootNode.childNode(withName: "polySurface196", recursively: true)!
        emptyFH.addChildNode(FHRLG1)
        let FHRLG1s = RocketScene.rootNode.childNode(withName: "polySurface195", recursively: true)!
        emptyFH.addChildNode(FHRLG1s)
        let FHRLG2 = RocketScene.rootNode.childNode(withName: "polySurface198", recursively: true)!
        emptyFH.addChildNode(FHRLG2)
        let FHRLG2s = RocketScene.rootNode.childNode(withName: "polySurface197", recursively: true)!
        emptyFH.addChildNode(FHRLG2s)
        let FHRLG3 = RocketScene.rootNode.childNode(withName: "polySurface200", recursively: true)!
        emptyFH.addChildNode(FHRLG3)
        let FHRLG3s = RocketScene.rootNode.childNode(withName: "polySurface199", recursively: true)!
        emptyFH.addChildNode(FHRLG3s)
        let FHRLG4 = RocketScene.rootNode.childNode(withName: "polySurface202", recursively: true)!
        emptyFH.addChildNode(FHRLG4)
        let FHRLG4s = RocketScene.rootNode.childNode(withName: "polySurface201", recursively: true)!
        emptyFH.addChildNode(FHRLG4s)
        
        // Attachments
        let FHLS = RocketScene.rootNode.childNode(withName: "polySurface241", recursively: true)!
        emptyFH.addChildNode(FHLS)
        let FHMS = RocketScene.rootNode.childNode(withName: "polySurface240", recursively: true)!
        emptyFH.addChildNode(FHMS)
        let FHRS = RocketScene.rootNode.childNode(withName: "polySurface239", recursively: true)!
        emptyFH.addChildNode(FHRS)
        let FHULS = RocketScene.rootNode.childNode(withName: "polySurface235", recursively: true)!
        emptyFH.addChildNode(FHULS)
        let FHURS = RocketScene.rootNode.childNode(withName: "polySurface236", recursively: true)!
        emptyFH.addChildNode(FHURS)
        let FHDLS = RocketScene.rootNode.childNode(withName: "polySurface254", recursively: true)!
        emptyFH.addChildNode(FHDLS)
        let FHDRS = RocketScene.rootNode.childNode(withName: "polySurface255", recursively: true)!
        emptyFH.addChildNode(FHDRS)
        
        emptyFH.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        emptyFH.physicsBody?.mass = CGFloat(1420788)
        
        self.addChildNode(emptyFH)
        
    }
    
    
    func force() {
        
        //print("launching")
        let force = SCNVector3(x: 0, y: 228190, z: 0)
        let position = SCNVector3(x: 0, y: 999999, z: 0)
        //emptyFH.physicsBody?.applyForce(force,at: position, asImpulse: true)
        print(emptyFH.presentation.position)
        
    }
    
    
    func addParticles() {
        
        let boosterFire = SCNParticleSystem(named: "BoosterFire.scnp", inDirectory: "art.scnassets/Particles")!
        let boosterFireEmitter = SCNNode()
        boosterFireEmitter.position = SCNVector3(x: 0, y: -46, z: 16)
        boosterFireEmitter.scale = SCNVector3(x: 10000, y: 10000, z: 10000)
        
        boosterFireEmitter.addParticleSystem(boosterFire)
        
        emptyFH.addChildNode(FHMB)
        
        FHLB.addChildNode(boosterFireEmitter)
        FHMB.addChildNode(boosterFireEmitter)
        FHRB.addChildNode(boosterFireEmitter)
        
    }
    
    
    func getFH() -> SCNNode{
        
        return emptyFH
    }
    
    func getTop() -> SCNNode{
        
        return FHLP
    }
    
    
}

