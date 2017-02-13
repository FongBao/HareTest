//
//  VehiclesData.swift
//  VehicleTest
//
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
