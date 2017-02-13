//
//  Vehicle.swift
//  VehicleTest
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation


class Vehicle {
    
    
    var vehicleId : Int = -1
    var lat : Double?
    var lng : Double?
    var speed : Double?
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
                
                lat = Double(holdingString!)

            }
            

        case JsonDocTags.LONG_TAG:
            
            
            if value is String {
                
                let holdingString: String? =  (value as! String)
                
                guard let myString = holdingString, !myString.isEmpty else {
                    print("String is nil or empty.")
                    return
                }
                
                lng = Double(holdingString!)

                
            }
  
        case JsonDocTags.SPEED_TAG:
            
            
            if value is String {
                
                let holdingString: String? =  (value as! String)
                
                guard let myString = holdingString, !myString.isEmpty else {
                    print("String is nil or empty.")
                    return
                }
                
                speed = Double(holdingString!)
                
            }
            
            
        case JsonDocTags.VEHICLE_GROUP_TAG:

            if value is String {
                
                let holdingString: String? =  (value as! String)
                
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
            groups.append(Int(item.trimmingCharacters(in: .whitespaces))!)
        }
    
    }
    
    
    
    //maps class members to json
    //func vehicleToJsonObject() -> String {
    func vehicleToJsonObject() -> [String : AnyObject] {

        var jsonObject = [String : AnyObject]()
        var jsonObject2 = [String : AnyObject]()
        
        jsonObject2[JsonDocTags.LAT_TAG] = lat as AnyObject?
        jsonObject2[JsonDocTags.LONG_TAG] = lng as AnyObject?
        jsonObject2[JsonDocTags.SPEED_TAG] = speed as AnyObject?
        jsonObject2[JsonDocTags.STATUS_TAG] = status as AnyObject?
        jsonObject2[JsonDocTags.VEHICLE_GROUP_TAG] = groups as AnyObject?
        
        jsonObject[String(vehicleId)] = jsonObject2 as AnyObject?

        return jsonObject
        
    }
    
    
    
    
    
    
    

    


    
    
}

