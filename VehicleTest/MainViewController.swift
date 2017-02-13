//
//  MainViewController.swift
//  VehicleTest
//
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    var vehiclesString : String = ""
    var vehiclesGroupsString : String = ""
    
    
    
    @IBAction func parseJsonFile(_ sender: UIButton) {
        
        
        
        //let jsonHelper = JsonHelper.sharedInstance
        let jsonHelper = JsonHelper()
        let vehiclesDataHandler = VehiclesData.sharedInstance
        
        do {

            
            try jsonHelper.parseJson(jsonString: vehiclesString, vehiclesData : vehiclesDataHandler)
            try jsonHelper.parseJson(jsonString: vehiclesGroupsString, vehiclesData : vehiclesDataHandler)
            
//            try jsonHelper.parseJson(jsonString: vehiclesString)
//            try jsonHelper.parseJson(jsonString: vehiclesGroupsString)
            

            
        } catch  {
            
        }
        
        //for i in 0..<vehicles.count {
        
//        for i in 0..<vehiclesDataHandler.vehiclesDict.count {
//            
//            
//        }

        
        print(" vehicles dict count is... ", vehiclesDataHandler.vehiclesDict.count) 
        
//        for (key, element) in vehiclesDataHandler.vehiclesDict {
//            
//           // print(" in vehiclesDataHandler.vehiclesDict ")
//            print(key)
//            print(" \(element.vehicleId)  \(element.lat) \(element.lng) \(element.speed) \(element.status) \(element.groups)")
//            
//            
//        }
        
        
        
        //buildJSON(vehiclesDataHandler.vehiclesDict)
//        let myDict = [JsonDocTags.VEHICLES_TAG:vehiclesDataHandler.vehiclesDict]
//        
//        do {
//           //let jsonSrting = try buildJSON(myDict as AnyObject)
//            let jsonSrting = try buildJSON(vehiclesDataHandler.vehiclesDict)
//            
//            print(jsonSrting)
//            
//        } catch let error {
//
//            
//            print(" error!!!!")
//            print(error.localizedDescription)
//            
//        }
        
//        if let books = (jsonDoc as AnyObject).object(forKey: DocTags.BOOKS_TAG) as? NSArray {
//            
//        }
        
        
//        books is an array
//        let myDict = [DocTags.BOOKS_TAG:books]
//        do {
//            print("Str:  \(try buildJSON(myDict as AnyObject))")
//        } catch {}
        
        
        //var jsonObject = [String : AnyObject]()
        //let jsonObject = NSMutableArray()
        //jsonObject.setValue((55.555, forKey: "lat"), forKey: "7")
        //jsonObject.setValue("blue", forKey: "7")
        
        var vehicle1 = Vehicle()
        
        vehicle1.vehicleId = 9
        vehicle1.speed = "80"
        
        
        var arrayOne = ["one", "two", "three"]
        var jsonObject = [String : AnyObject]()
        //jsonObject[JsonDocTags.VEHICLES_TAG] = arrayOne as AnyObject?
        
        jsonObject[JsonDocTags.VEHICLES_TAG] = vehicle1 as AnyObject?
        
        
        do {
            //let jsonSrting = try buildJSON(myDict as AnyObject)
            let jsonSrting = try buildJSON(jsonObject as AnyObject)
            
            print("built string is...  ", jsonSrting)
            
        } catch let error {
            
            
            print(" error!!!!")
            print(error.localizedDescription)
            
        }
        
        //        "vehicles": {
        //            "7": {
        //                "lat": 55.555,
        //                "lng": 22.222,
        //                "speed": 47.5,
        //                "status": "parked"
        //                "groups": [1, 2]
        //            },
        //            "8": {...},
        //            "9": {...}
        
        
        
        
        
    }
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehiclesString = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "vehicles", ofType:"json"))
        vehiclesGroupsString = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "vehicle_groups", ofType:"json"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 
    

    
    
    
    
    
    
    
    
    //-------------------------
    
    
    func retrieveJsonStringFromBundle(filePath: String?) -> String {
    
    
        if let vehicleData =  try? Data(contentsOf: URL(fileURLWithPath: filePath!), options: Data.ReadingOptions.uncached) {
            
            //vehiclesString = String(data: vehicleData, encoding: .utf8)!
            
            return String(data: vehicleData, encoding: .utf8)!
            
            
        }else {
            print("Invalid filename/path.")
            return ""
            
        }

        
        
    
    }
    
    
    
    
    
    
    
    ///-----------------------
    
    
    
    
    
    func buildJSON(_ value: AnyObject) throws -> String {
        if JSONSerialization.isValidJSONObject(value) {
            let data = try JSONSerialization.data(withJSONObject: value, options: [])
            if let string = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                return string as String
            }
        }
        return "not valid json object"
    }
    
    
    func buildJSON(_ value: Dictionary<Int, Vehicle>) throws -> String {
        
        
        if JSONSerialization.isValidJSONObject(value) {
            let data = try JSONSerialization.data(withJSONObject: value, options: [])
            if let string = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                return string as String
            }
        }
        return "not valid json object"
    }
    
    
    
    
    
    ///-----------------------
   

    

}
