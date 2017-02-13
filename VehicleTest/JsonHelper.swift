//
//  JsonHelper.swift
//  VehicleTest
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import Foundation



class JsonHelper {
    
    
    
    func parseJson(jsonString: String, vehiclesData : VehiclesDataProtocol?) throws {
        

        let jsonData = jsonString.data(using: String.Encoding.utf8)
        
        
        if let data = jsonData {
            
            let jsonDoc : Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            
            let vehicles: NSArray = jsonDoc as! NSArray

            
            for i in 0..<vehicles.count {
                if let dict = vehicles[i] as? NSDictionary {
                    

                    
                    let dictKey = dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as? Int ?? -1
                    
                    if dictKey != -1 {
                        
                        if var vehiclesData = vehiclesData as VehiclesDataProtocol! {

                            var vehicle : Vehicle
                            
                           let vehicleX = vehiclesData.vehiclesDict[dictKey]
                            
                            
                            if vehicleX != nil {

                                vehicle = vehicleX!
                            } else {
                                vehicle = Vehicle()
                                addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_ID_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as AnyObject))
                                

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
                    
                
                
            }

        
            
        }
        
        
    }

    
    
    
    
    
    private func addElementToVehicle(_ vehicle: Vehicle, elementName: String, elementValue: AnyObject?) {
        if let value = elementValue {
            
            vehicle.addValue(elementName, withValue: value)
        }
    }



    
    
    
    
    
    
    func createJsonString() -> String {
        
        let vehiclesDataHandler = VehiclesData.sharedInstance
        
        var statusOneCount = 0
        var statusTwoCount = 0
        var statusThreeCount = 0
        var statusFourCount = 0
        var unknownCount = 0
        
        
        
        var jsonVehicleObject2 = [String : AnyObject]()
        
        var vehicleDict = [String : AnyObject]()
        
        for (_, element) in vehiclesDataHandler.vehiclesDict {
            
            
            
            switch element.status! {
            case "parked":
                statusOneCount += 1
                
            case "moving":
                statusTwoCount += 1
                
            case "idle":
                statusThreeCount += 1
                
            case "ign":
                statusFourCount += 1
                
            default:
                unknownCount += 1
                
            }
            
            
            
            for (key, value) in element.vehicleToJsonObject() {
                vehicleDict[key] = value
            }
            
            
        }
        
        
        jsonVehicleObject2[JsonDocTags.VEHICLES_TAG] = (vehicleDict as AnyObject)
        
        
        var jsonVehiclesSrting = ""
        
        do {
            
            
            jsonVehiclesSrting = try buildJSON(jsonVehicleObject2 as AnyObject)
            print("built string is...  ", jsonVehiclesSrting)
            
            
            
            
        } catch let error {
            
            
            print(" error!!!!")
            print(error.localizedDescription)
            
        }
        
        
        
        //--------------
        
        let sumStatus = statusOneCount + statusTwoCount + statusThreeCount + statusFourCount
        
        var jsonStatusObject = [String : Int]()
        
        
        jsonStatusObject[JsonDocTags.STATUS_ONE_TAG] = statusOneCount
        jsonStatusObject[JsonDocTags.STATUS_TWO_TAG] = statusTwoCount
        jsonStatusObject[JsonDocTags.STATUS_THREE_TAG] = statusThreeCount
        jsonStatusObject[JsonDocTags.STATUS_FOUR_TAG] = statusFourCount
        jsonStatusObject[JsonDocTags.STATUS_TOTAL_TAG] = sumStatus
        
        
        var jsonStatusObject2 = [String : AnyObject]()
        jsonStatusObject2[JsonDocTags.VEHICLE_STATS_TAG] = jsonStatusObject as AnyObject
        
        
        var jsonStatusSrting = ""
        
        do {
            
            jsonStatusSrting = try buildJSON(jsonStatusObject2 as AnyObject)
            print("built string is...  ", jsonStatusSrting)
            
            
            
        } catch let error {
            
            
            print(" error!!!!")
            print(error.localizedDescription)
            
        }
        
        
        return jsonVehiclesSrting + jsonStatusSrting
        
        
        
    }
    

    
    
    
    /*
 Creates a JSON Document
 */
    
    func buildJSON(_ value: AnyObject) throws -> String {
        if JSONSerialization.isValidJSONObject(value) {
            //let data = try JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions.prettyPrinted)
            let data = try JSONSerialization.data(withJSONObject: value, options: [])
            
            if let string = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                return string as String
            }
        }
        return ""
    }
    
    
    

}
