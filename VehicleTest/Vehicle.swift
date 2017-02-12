//
//  Vehicle.swift
//  VehicleTest
//
//  Created by TAE on 10/02/2017.
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation


class Vehicle : Hashable {
    
    
    var vehicleId : Int = 0
//    var lat : Float = 0
//    var lng : Double = 0
//    var speed : Double = 0

    var lat = ""
    var lng = ""
    var speed = ""
    
    
    var groups = [Int] ()
    var status = ""
    

    

    
    
    
    func addValue<T>(_ tagName: String, withValue value: T) {
        
        switch tagName {
            
        case JsonDocTags.VEHICLE_ID_TAG:
            
            
            if value is Int {
                
                vehicleId = (value as? Int)!
            }
            
            
            
            
        case JsonDocTags.LAT_TAG:
            
            
            if value is String {
                
                lat = (value as? String)!
            }
            
//            self.lat = value
//            
        case JsonDocTags.LONG_TAG:
            
            
            if value is String {
                
                lng = (value as? String)!
            }
  
        case JsonDocTags.SPEED_TAG:
            
            
            if value is String {
                
                speed = (value as? String)!
            }
            
            
        case JsonDocTags.VEHICLE_GROUP_TAG:

            
            print("in JsonDocTags.VEHICLE_GROUP_TAG")
            

            if value is String {

                addStringToGroupsArray(value: (value as? String)!)
                
            }
            
            
        case JsonDocTags.STATUS_TAG:

            if value is String {
                
                status = (value as? String)!
            }
            
        default:
            print("Unknown element \(tagName)")
            
        }
        
    }
    
    
    /*
     Takes a String as a param and seperates it by commas into an array
     each element is then trimmed for whitespace before before added to the groups array
     
     Assumption: vales are added to groups (Does not replace original values)!
     
     */
    func addStringToGroupsArray(value: String) {
    
        
        let groupsStringArray = value.components(separatedBy: ",")
        
        for item in groupsStringArray {
            
            //print("item added to groupsStringArray is..... \(item)")
            
            groups.append(Int(item.trimmingCharacters(in: .whitespaces))!)
        }
    
    }
    
    
    
    //Functions for Hashale
    
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    
    var hashValue: Int {
        get {
            return vehicleId
        }
    }
    


    
    
}

