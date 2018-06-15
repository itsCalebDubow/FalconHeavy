//
//  LabelNodeExtension.swift
//  Cycles
//
//  Created by Caleb Dubow on 1/12/17.
//  Copyright © 2017 Caleb Dubow. All rights reserved.
//

import SpriteKit

extension SKLabelNode{
    convenience init(position pos:CGPoint,zPosition zPos:CGFloat,text:String,fontColor color:UIColor,fontName:String,fontSize:CGFloat,verticalAlignmentMode vAM:SKLabelVerticalAlignmentMode,horizontalAlignmentMode hAM:SKLabelHorizontalAlignmentMode){
        self.init(fontNamed:fontName)
        self.position = pos
        self.zPosition = zPos
        self.text = text
        self.fontColor = color
        self.fontSize = fontSize
        self.verticalAlignmentMode = vAM
        self.horizontalAlignmentMode = hAM
    }
}
