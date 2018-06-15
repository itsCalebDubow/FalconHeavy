//
//  GameViewController.swift
//  iLaunchIII
//
//  Created by Wendell Li on 5/15/18.
//  Copyright © 2018 Wendell Li. All rights reserved.
//

import UIKit
import SceneKit
import CoreMotion

class GameViewController: UIViewController {

    //scene
    var gameView:GameView { return view as! GameView }
    var mainScene:SCNScene!
    var solarSystemScene:SCNScene!
    var gameScene:SCNScene!
    
    //var motion = CMMotionManager()
    var motion = CoreMotionHelper()
    var game = GameHelper.sharedInstance
    var force = SCNVector3(x:0 , y:0, z:0)
    
    //general
    //var gameState:GameState = .loading
    var launch = false
    //nodes
    private var falconHeavy = FalconHeavy()
    private var tower = Tower()
    private var solarSystem = SolarSystem()
    
    private var cameraNode:SCNNode!
    private var cameraNode2:SCNNode!
    private var cameraNode3:SCNNode!
    private var cameraFollowNode:SCNNode!
    private var lightFollowNode:SCNNode!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupMainScene()
        
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    //menu scene
    private func setupMainScene() {
        
        gameView.allowsCameraControl = false
        gameView.antialiasingMode = .multisampling4X
        gameView.delegate = self
        mainScene = SCNScene(named: "art.scnassets/EarthStage/Stage1.scn")
        gameView.scene = mainScene
        
        tower = Tower()
        mainScene.rootNode.addChildNode(tower)
        
        falconHeavy = FalconHeavy()
        falconHeavy.scale = SCNVector3Make(1, 1, 1)
        falconHeavy.position = SCNVector3Make(-10.0, 30.0, -10.0)
        mainScene.rootNode.addChildNode(falconHeavy)
        
        cameraNode = mainScene.rootNode.childNode(withName: "camera",recursively: true)!
    }
    
    // solarSystemScene
    @objc private func setupSolarSystem() {
        
        solarSystemScene = SCNScene(named: "art.scnassets/SolarSystem.scn")
        gameView.scene = solarSystemScene
        
        cameraNode2 = solarSystemScene.rootNode.childNode(withName: "camera",recursively: true)!
        
        let cameraAnimation3 = SCNAction.move(to: SCNVector3(x: 80, y: 0, z: 20), duration: 3)
        cameraAnimation3.timingMode = SCNActionTimingMode.easeOut
        cameraNode2.runAction(cameraAnimation3)
        
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.transitionfunc2), userInfo: nil, repeats: false)
        
    }
    
    // gameScene
    @objc private func setupGameScene() {
        
        gameScene = SCNScene(named: "art.scnassets/EarthStage/Stage1.scn")
        gameView.scene = gameScene
        
        gameScene.rootNode.addChildNode(tower)
        
        falconHeavy.scale = SCNVector3Make(1, 1, 1)
        falconHeavy.position = SCNVector3Make(-10.0, 30.0, -10.0)
        gameScene.rootNode.addChildNode(falconHeavy)
        
        cameraNode3 = gameScene.rootNode.childNode(withName: "camera",recursively: false)!
        
        let cameraAnimation3 = SCNAction.move(to: SCNVector3(x: (falconHeavy.emptyFH.presentation.position.x) - 10, y: (falconHeavy.emptyFH.presentation.position.y), z: (falconHeavy.emptyFH.presentation.position.z) + 60), duration: 3)
        cameraAnimation3.timingMode = SCNActionTimingMode.easeOut
        let cameraRotation3 = SCNAction.rotateBy(x: 1.6, y: 0, z: 0, duration: 3)
        cameraRotation3.timingMode = SCNActionTimingMode.easeOut
        let cameraMovement3 = SCNAction.group([cameraRotation3, cameraAnimation3])
        cameraNode3.runAction(cameraMovement3)
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.transitionfunc2), userInfo: nil, repeats: false)
        _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.launch1), userInfo: nil, repeats: false)
        
    }
    
    // transition animations
    @objc func transitionfunc() {
        gameView.transition1()
    }
    @objc func transitionfunc2() {
        gameView.transition2()
    }
    @objc func transitionfunc3() {
        gameView.transition3()
    }
    
    // touches + movement
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches {
            if gameView.getPlayButton().frame.contains(touch.location(in: gameView.getMenuBar())){
                print("Play!")
                gameView.fadeInEarth()
                gameView.moveOutMenu()
                
                let cameraAnimation2 = SCNAction.move(to: SCNVector3(x: 0, y: 350, z: 0), duration: 3)
                cameraAnimation2.timingMode = SCNActionTimingMode.easeOut
                let cameraRotation2 = SCNAction.rotateBy(x: 2, y: 0, z: 0, duration: 3)
                cameraRotation2.timingMode = SCNActionTimingMode.easeOut
                let cameraMovement2 = SCNAction.group([cameraRotation2, cameraAnimation2])
                cameraNode.runAction(cameraMovement2)
                
                _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.setupSolarSystem), userInfo: nil, repeats: false)
                _ = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.transitionfunc), userInfo: nil, repeats: false)
                
            }
            
            if gameView.getEarth().frame.contains(touch.location(in: gameView.overlaySKScene!)){
                print("Earth!")
                gameView.fadeOutEarth()
                
                let cameraAnimation4 = SCNAction.move(to: SCNVector3(x: 80, y: 0, z: 0), duration: 3)
                cameraAnimation4.timingMode = SCNActionTimingMode.easeIn
                cameraNode2 = solarSystemScene.rootNode.childNode(withName: "camera",recursively: true)!
                cameraNode2.runAction(cameraAnimation4)
                
                transitionfunc()
                
                _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.setupGameScene), userInfo: nil, repeats: false)
                
                //tower.towerAnimations()
                
                //_ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.launch1), userInfo: nil, repeats: false)
                
            }
            
            if gameView.getFactoryButton().frame.contains(touch.location(in: gameView.getMenuBar())){
                print("Factory!")
                gameView.moveOutMenu()
                
            }
            
        }
    }
    
    @objc func launch1() {
        print("launched")
        launch = true
    }
    
    func updateCameraAndLights() {
        //Make camera follow rocket
        cameraNode3.position.x = (falconHeavy.emptyFH.presentation.position.x) - 10
        cameraNode3.position.y = (falconHeavy.emptyFH.presentation.position.y)
        cameraNode3.position.z = (falconHeavy.emptyFH.presentation.position.z) + 60
        
    }
    //This is where we apply the force to the falconHeavy based on the accelerometer
    func updateMotionControl() {
        
        motion.getAccelerometerData(interval: 0.1) { (x,y,z) in
            //Applies Torque
            self.falconHeavy.emptyFH.physicsBody?.applyTorque(SCNVector4(-Float(y * 1000), Float(0), -Float(x * 1000), 5000), asImpulse: true)
            self.force = SCNVector3(x: cos(self.falconHeavy.presentation.rotation.x) * 228190, y: 100000, z: 0)
            
            
        }
        
        
                //This is where we apply the force to make it move. Not working as intended
                let position = SCNVector3(x: falconHeavy.emptyFH.presentation.position.x , y: falconHeavy.emptyFH.presentation.position.y, z: falconHeavy.emptyFH.presentation.position.z)
        
                falconHeavy.emptyFH.physicsBody?.applyForce(force,at: position, asImpulse: true)
        
//            }
            
//        }
    }
    
    
}

//This is the equivilent of DidUpdate(_) method in Spritekit. It is constantly running
extension GameViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        
        if launch{
            
            falconHeavy.force()
            updateCameraAndLights()
            updateMotionControl()
            //print(falconHeavy.rotation)
        }
        
    }
}


