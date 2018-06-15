//
//  UIColorExtension.swift
//  Cycles
//
//  Created by Robert Zhang on 5/20/17.
//  Copyright © 2017 Caleb Dubow. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(random:Bool){
        let r = CGFloat(arc4random_uniform(255))
        let g = CGFloat(arc4random_uniform(255))
        let b = CGFloat(arc4random_uniform(255))
        self.init(red:r,green:g,blue:b,alpha:1)
    }
}
