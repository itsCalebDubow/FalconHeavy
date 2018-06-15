//
//  File.swift
//  iLaunchIII
//
//  Created by Wendell Li on 6/7/18.
//  Copyright © 2018 Wendell Li. All rights reserved.
//

import Foundation
import CoreMotion

class CoreMotionHelper {
    
    let motionManager = CMMotionManager()
    
    init() {
    }
    
    func getAccelerometerData(interval: TimeInterval = 0.1, closure: ((_ x: Double, _ y: Double, _ z: Double) -> ())? ){
        
        if motionManager.isAccelerometerAvailable {
            
            motionManager.accelerometerUpdateInterval = interval
            
            motionManager.startAccelerometerUpdates(to: OperationQueue(), withHandler: {
                (data: CMAccelerometerData?, error: Error?) -> Void in
                
                if closure != nil{
                    closure!(data!.acceleration.x, data!.acceleration.y, data!.acceleration.z)
                }
                
            }
            )
        }
    }
}
