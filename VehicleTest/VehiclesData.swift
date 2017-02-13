//
//  VehiclesData.swift
//  VehicleTest
//
//  Created by TAE on 12/02/2017.
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation


class VehiclesData : VehiclesDataProtocol {
    
    static let sharedInstance = VehiclesData()
    
    var vehiclesDict : [Int: Vehicle]
    
    private init(){
        vehiclesDict = [Int: Vehicle]()
    }
    
    
    
}
