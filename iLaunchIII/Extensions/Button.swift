//
//  Button.swift
//  Cycles
//
//  Created by Caleb Dubow on 1/12/17.
//  Copyright © 2017 Caleb Dubow. All rights reserved.
//

import SpriteKit
import UIKit

class Button:SKSpriteNode{
    var label = SKLabelNode()
    var xOffset:CGFloat = 0
    var yOffset:CGFloat = 0
    
    init(){
        label = SKLabelNode()
        let texture = SKTexture()
        super.init(texture:texture,color:.clear,size:CGSize(width:0,height:0))
    }
    
    init(zPosition: CGFloat,label:SKLabelNode,buttonTexture:String, alpha: CGFloat, xOffset:CGFloat,yOffset:CGFloat){
        let width = label.frame.width
        let height = label.frame.height
        let texture = SKTexture(imageNamed:buttonTexture)
        super.init(texture:texture,color:.clear,size:CGSize(width:width+xOffset*2,height:height+yOffset*2))
        if label.horizontalAlignmentMode == .center{
            self.position.x = label.position.x
        }
        else if label.horizontalAlignmentMode == .left{
            self.position.x = label.position.x+label.frame.width/2
        }
        else{
            self.position.x = label.position.x-label.frame.width/2
        }
        if label.verticalAlignmentMode == .center{
            self.position.y = label.position.y
        }
        else if label.verticalAlignmentMode == .top{
            self.position.y = label.position.y-label.frame.height/2
        }
        else{
            self.position.y = label.position.x+label.frame.height/2
        }
        self.zPosition = zPosition
        self.xOffset = xOffset
        self.yOffset = yOffset
        self.alpha = alpha
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.position = CGPoint(x:0,y:0)
        label.name = "label"
        self.addChild(label)
    }
    init(zPosition: CGFloat,label:SKLabelNode,buttonColor:UIColor,xOffset:CGFloat,yOffset:CGFloat){
        let width = label.frame.width
        let height = label.frame.height
        let texture = SKTexture()
        super.init(texture:texture,color:buttonColor,size:CGSize(width:width+xOffset*2,height:height+yOffset*2))
        if label.horizontalAlignmentMode == .center{
            self.position.x = label.position.x
        }
        else if label.horizontalAlignmentMode == .left{
            self.position.x = label.position.x+label.frame.width/2
        }
        else{
            self.position.x = label.position.x-label.frame.width/2
        }
        if label.verticalAlignmentMode == .center{
            self.position.y = label.position.y
        }
        else if label.verticalAlignmentMode == .top{
            self.position.y = label.position.y-label.frame.height/2
        }
        else{
            self.position.y = label.position.x+label.frame.height/2
        }
        self.zPosition = zPosition
        self.xOffset = xOffset
        self.yOffset = yOffset
        self.colorBlendFactor = 1
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.position = CGPoint(x:0,y:0)
        label.name = "label"
        self.addChild(label)
    }
    
    func changeText(text:String){
        for node in self.children{
            if node.name == "label"{
                if let theLabel = node as? SKLabelNode{
                    theLabel.text = text
                    let width = theLabel.frame.width
                    let height = theLabel.frame.height
                    self.size = CGSize(width:width+xOffset*2,height:height+yOffset*2)
                    
                }
            }
        }
    }
    
    func changeFontSize(fontSize:CGFloat){
        for node in self.children{
            if node.name == "label"{
                if let theLabel = node as? SKLabelNode{
                    theLabel.fontSize = fontSize
                    let width = theLabel.frame.width
                    let height = theLabel.frame.height
                    self.size = CGSize(width:width+xOffset*2,height:height+yOffset*2)
                    
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
}
