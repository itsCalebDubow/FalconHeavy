//
//  SolarSystem.swift
//  iLaunchIII
//
//  Created by Wendell Li on 6/8/18.
//  Copyright © 2018 Wendell Li. All rights reserved.
//

import Foundation
import SceneKit

class SolarSystem:SCNNode {
    
    //nodes
    let systemAttach = SCNNode()
    
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
        
        let SolarSystemScene = SCNScene(named: "art.scnassets/SolarSystem.scn")!
        
        let Sun = SolarSystemScene.rootNode.childNode(withName: "sun", recursively: true)!
        
        systemAttach.addChildNode(Sun)
        
        self.addChildNode(systemAttach)
        
    }
    
    
}

