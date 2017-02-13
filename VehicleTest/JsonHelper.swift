//
//  JsonHelper.swift
//  VehicleTest
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation



class JsonHelper {
    
    
    //Protocol
    

    
    
    //func parseJson(jsonString: String) throws -> [Vehicle] {
    func parseJson(jsonString: String, vehiclesData : VehiclesDataProtocol?) throws {
        
        //var mVehicle: [Vehicle] = []
        
        //vehiclesData.getVehicles()
        
       // var vehiclesData = vehiclesData.vehiclesDict
        

        let jsonData = jsonString.data(using: String.Encoding.utf8)
        
        
        if let data = jsonData {
            
            let jsonDoc : Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            
            let vehicles: NSArray = jsonDoc as! NSArray

            
            for i in 0..<vehicles.count {
                if let dict = vehicles[i] as? NSDictionary {
                    
                    //var vehicle = Vehicle()
//                    
//                    print("dict is  ", dict.description)
//                    
////                    print(" dictionary vehicle tag actual is...  ",JsonDocTags.VEHICLE_ID_TAG)
////                    print(" dictionary vehicle tag is...  ",(dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as? Int) ?? "empty??")
////                    print(" dictionary VEHICLE_GROUP_TAG is...  ",(dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as? String) ?? "empty??")
//                    
//                    addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_ID_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as AnyObject))
//                    addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_GROUP_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as AnyObject))
//                    
//                    addElementToVehicle(vehicle, elementName: JsonDocTags.LAT_TAG, elementValue: (dict.object(forKey: JsonDocTags.LAT_TAG) as AnyObject))
//                    addElementToVehicle(vehicle, elementName: JsonDocTags.LONG_TAG, elementValue: (dict.object(forKey: JsonDocTags.LONG_TAG) as AnyObject))
//                    addElementToVehicle(vehicle, elementName: JsonDocTags.STATUS_TAG, elementValue: (dict.object(forKey: JsonDocTags.STATUS_TAG) as AnyObject))
//                    addElementToVehicle(vehicle, elementName: JsonDocTags.SPEED_TAG, elementValue: (dict.object(forKey: JsonDocTags.SPEED_TAG) as AnyObject))

                    
                    //mVehicle.append(vehicle)
                    
                    
                    let dictKey = dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as? Int ?? -1
                    
                    //if vehicle.vehicleId != -1 {
                    if dictKey != -1 {
                        
                       //if (vehiclesData as VehiclesDataProtocol!) != nil {
                        if var vehiclesData = vehiclesData as VehiclesDataProtocol! {
//                            
//
//                            
//                            
////                            if let vehicle = vehiclesData.vehiclesDict[dictKey] {
////                                
////                            }else {
////                                
////                            var vehicle = Vehicle()
////                                
//                            }

                            

                            var vehicle : Vehicle
                            
                           let vehicleX = vehiclesData.vehiclesDict[dictKey]
                            
                            
                            if vehicleX != nil {
                                print("Its vehicleX!!!!  ")
                                vehicle = vehicleX!
                            } else {
                                vehicle = Vehicle()
                                addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_ID_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as AnyObject))
                                
                                print("Its a vehicle  ")
                            }
                            
                            addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_GROUP_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as AnyObject))
                            addElementToVehicle(vehicle, elementName: JsonDocTags.LAT_TAG, elementValue: (dict.object(forKey: JsonDocTags.LAT_TAG) as AnyObject))
                            addElementToVehicle(vehicle, elementName: JsonDocTags.LONG_TAG, elementValue: (dict.object(forKey: JsonDocTags.LONG_TAG) as AnyObject))
                            addElementToVehicle(vehicle, elementName: JsonDocTags.STATUS_TAG, elementValue: (dict.object(forKey: JsonDocTags.STATUS_TAG) as AnyObject))
                            addElementToVehicle(vehicle, elementName: JsonDocTags.SPEED_TAG, elementValue: (dict.object(forKey: JsonDocTags.SPEED_TAG) as AnyObject))
                            
                         vehiclesData.vehiclesDict[vehicle.vehicleId] = vehicle
                        
                        
                        }
                            
                        }
                        
                        
                    }
                    
                    
//                    
//                        if var vehiclesData = vehiclesData as VehiclesDataProtocol! {
//                            
//                            
//                            
//                            if let vehicle = vehiclesData.vehiclesDict[vehicle.vehicleId] {
//                                
//                                
//                            } else {
//                                
//                                
//                                
//                            }
                    
                            
//                            
//                            vehiclesData.vehiclesDict.
//                            
//                            vehiclesData.vehiclesDict[vehicle.vehicleId] = vehicle
//                            
//                            var originalVehicle = vehiclesData.vehiclesDict.updateValue(vehicle, forKey: vehicle.vehicleId)
//                            
//                            if originalVehicle != nil {
//                                
//                                
//                            }
                            
//                        }
//
//                        
//                    }
                
                    
            //    }
                
            }

        
            
        }
        
        
    }


            private func addElementToVehicle(_ vehicle: Vehicle, elementName: String, elementValue: AnyObject?) {
                if let value = elementValue {
                    
                    vehicle.addValue(elementName, withValue: value)
                }
            }



    
    
    //--------Create a JSON Document
    
    func buildJSON(_ value: AnyObject) throws -> String {
        if JSONSerialization.isValidJSONObject(value) {
            let data = try JSONSerialization.data(withJSONObject: value, options: [])
            if let string = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                return string as String
            }
        }
        return ""
    }
    
    
    

}
