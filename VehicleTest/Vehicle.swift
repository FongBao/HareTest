//
//  Vehicle.swift
//  VehicleTest
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation


class Vehicle : Hashable {
    
    
    var vehicleId : Int = -1
    var lat : String?
    var lng : String?
    var speed : String?
    var status : String?
    var groups = [Int] ()
 
    
    
    func addValue<T>(_ tagName: String, withValue value: T) {
        
        switch tagName {
            
        case JsonDocTags.VEHICLE_ID_TAG:
            
            
            if value is Int {
                
                vehicleId = (value as? Int)!
            }
            
            
            
            
        case JsonDocTags.LAT_TAG:
            
            
            if value is String {
                                
                let holdingString: String? =  (value as! String)
                
                guard let myString = holdingString, !myString.isEmpty else {
                    print("String is nil or empty.")
                    return
                }
                
                lat = holdingString

            }
            

        case JsonDocTags.LONG_TAG:
            
            
            if value is String {
                
                let holdingString: String? =  (value as! String)
                
                guard let myString = holdingString, !myString.isEmpty else {
                    print("String is nil or empty.")
                    return
                }
                
                lng = holdingString
                
            }
  
        case JsonDocTags.SPEED_TAG:
            
            
            if value is String {
                
                let holdingString: String? =  (value as! String)
                
                guard let myString = holdingString, !myString.isEmpty else {
                    print("String is nil or empty.")
                    return
                }
                
                speed = holdingString
                
            }
            
            
        case JsonDocTags.VEHICLE_GROUP_TAG:

            
            print("in JsonDocTags.VEHICLE_GROUP_TAG")
            

            if value is String {
                
                let holdingString: String? =  (value as! String)
                
                print("holdingString is... ", holdingString ?? "not string" )
                
                guard let myString = holdingString, !myString.isEmpty else {
                    print("String is nil or empty.")
                    return
                }

                addStringToGroupsArray(value: holdingString!)
                
            }
            
            
        case JsonDocTags.STATUS_TAG:

            if value is String {
                
                let holdingString: String? =  (value as! String)
                
                guard let myString = holdingString, !myString.isEmpty else {
                    print("String is nil or empty.")
                    return
                }
                
                status = holdingString

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
    
    
    
    //Functions for Hashale - no longer used
    
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    
    var hashValue: Int {
        get {
            return vehicleId
        }
    }
    


    
    
}

