//
//  JsonHelper.swift
//  VehicleTest
//
//  Created by TAE on 10/02/2017.
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation



class JsonHelper {
    
    
    //Protocol
    
    
    
    
    static let sharedInstance = JsonHelper()
    
    private init(){}
    
    
    func parseJson(jsonString: String) throws {
        
        
        var mVehicle: [Vehicle] = []

        let jsonData = jsonString.data(using: String.Encoding.utf8)
        
        
        if let data = jsonData {
            
            let jsonDoc : Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            
            let vehicles: NSArray = jsonDoc as! NSArray

            
            for i in 0..<vehicles.count {
                if let dict = vehicles[i] as? NSDictionary {
                    
                    let vehicle = Vehicle()
                    
                    print("dict is  ", dict.description)
                    
//                    print(" dictionary vehicle tag actual is...  ",JsonDocTags.VEHICLE_ID_TAG)
//                    print(" dictionary vehicle tag is...  ",(dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as? Int) ?? "empty??")
//                    print(" dictionary VEHICLE_GROUP_TAG is...  ",(dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as? String) ?? "empty??")
                    
                    addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_ID_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as AnyObject))
                    addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_GROUP_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as AnyObject))
                    
                    addElementToVehicle(vehicle, elementName: JsonDocTags.LAT_TAG, elementValue: (dict.object(forKey: JsonDocTags.LAT_TAG) as AnyObject))
                    addElementToVehicle(vehicle, elementName: JsonDocTags.LONG_TAG, elementValue: (dict.object(forKey: JsonDocTags.LONG_TAG) as AnyObject))
                    addElementToVehicle(vehicle, elementName: JsonDocTags.STATUS_TAG, elementValue: (dict.object(forKey: JsonDocTags.STATUS_TAG) as AnyObject))
                    addElementToVehicle(vehicle, elementName: JsonDocTags.SPEED_TAG, elementValue: (dict.object(forKey: JsonDocTags.SPEED_TAG) as AnyObject))

                    
                    mVehicle.append(vehicle)
                    
                    
                }
                
                
            }
            
            
            for item in mVehicle {
                
                print("vehicle id is...  ", item.vehicleId)
                print("vehicle lat is...  ", item.lat)
                print("vehicle long is...  ", item.lng)
                print("vehicle status is...  ", item.status)
                print("vehicle speed is...  ", item.speed)
                
                
                if item.groups.isEmpty {
                    print("vehicle GROUP is... EMPTY!!!!!  ")
                } else {
                  //  print("vehicle GROUP is...  ", item.groups[0])
                    
                    for item in item.groups {
                        print("vehicle  group is.. ", item)
                    }
                    
                    
                }
                
                
                
            }
        }
        
    }


            private func addElementToVehicle(_ vehicle: Vehicle, elementName: String, elementValue: AnyObject?) {
                if let value = elementValue {
                    vehicle.addValue(elementName, withValue: value)
                }
            }




}
