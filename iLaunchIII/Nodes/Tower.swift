//
//  Tower.swift
//  iLaunchIII
//
//  Created by Wendell Li on 6/6/18.
//  Copyright © 2018 Wendell Li. All rights reserved.
//

import Foundation
import SceneKit

class Tower:SCNNode {
    
    //nodes
    let towerAttach = SCNNode()
    //var TArm1 = SCNNode()
    //var TArm2 = SCNNode()
    //var TArm3 = SCNNode()
    
    //initialization
    override init() {
        super.init()
        setupModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //scene
    func setupModel() {
        
        let TowerScene = SCNScene(named: "art.scnassets/EarthStage/Tower/Tower.scn")!
        
        let TArm1 = TowerScene.rootNode.childNode(withName: "polySurface1038", recursively: true)!
        let TArm2 = TowerScene.rootNode.childNode(withName: "polySurface1044", recursively: true)!
        let TArm3 = TowerScene.rootNode.childNode(withName: "polySurface1055", recursively: true)!
        let TArm4 = TowerScene.rootNode.childNode(withName: "polySurface942", recursively: true)!
        let Tower = TowerScene.rootNode.childNode(withName: "polySurface969", recursively: true)!
        
        //TArm1.pivot = SCNMatrix4MakeTranslation(0.5, 0.5, 0.5)
        
        towerAttach.addChildNode(TArm1)
        towerAttach.addChildNode(TArm2)
        towerAttach.addChildNode(TArm3)
        towerAttach.addChildNode(TArm4)
        towerAttach.addChildNode(Tower)
        
        self.addChildNode(towerAttach)
        
    }
    
    
    func towerAnimations() {
        
        print("rotating tower")
        
        let TowerScene = SCNScene(named: "art.scnassets/EarthStage/Tower/Tower.scn")!
        
        let TArm1 = TowerScene.rootNode.childNode(withName: "polySurface1038", recursively: true)!
        let TArm2 = TowerScene.rootNode.childNode(withName: "polySurface1044", recursively: true)!
        let TArm3 = TowerScene.rootNode.childNode(withName: "polySurface1055", recursively: true)!
        let TArm4 = TowerScene.rootNode.childNode(withName: "polySurface942", recursively: true)!
        let Tower = TowerScene.rootNode.childNode(withName: "polySurface969", recursively: true)!
        
        let towerAnimation1 = SCNAction.rotate(by: CGFloat(Double.pi / 2), around: SCNVector3(0,0,1), duration: 3)
        TArm1.runAction(towerAnimation1)
        TArm2.runAction(towerAnimation1)
        TArm3.runAction(towerAnimation1)
        
    }
    
    
}
