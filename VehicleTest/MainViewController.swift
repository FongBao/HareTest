//
//  MainViewController.swift
//  VehicleTest
//
//  Created by TAE on 10/02/2017.
//  Copyright © 2017 OriginalMyth. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    var vehiclesString : String = ""
    var vehiclesGroupsString : String = ""
    
    
    
    @IBAction func parseJsonFile(_ sender: UIButton) {
        
        
        
        let jsonHelper = JsonHelper.sharedInstance
        
        
        do {
            
           // try jsonHelper.parseJson(jsonString: jsonStringVehicles)
            //try jsonHelper.parseJson(jsonString: jsonStringVehicleGroups)
            
            try jsonHelper.parseJson(jsonString: vehiclesString)
            try jsonHelper.parseJson(jsonString: vehiclesGroupsString)
            
        } catch  {
            
        }
        
        
        
//        do {
//            //try parseJson(jsonString: jsonStringVehicles)
//            try parseJson(jsonString: jsonStringVehicleGroups)
//            
//        } catch _ {}
        
    }
    
    

    
    var jsonStringVehicles = "[{\"id\": 7,\"lat\": \"53.665817\",\"lng\": \"-2.62132\",\"status\": \"parked\",\"speed\": \"0\"},{\"id\": 8,\"lat\": \"53.66563\",\"lng\": \"-2.621208\",\"status\": \"parked\",\"speed\": \"0\"},{\"id\": 91,\"lat\": \"53.665462\",\"lng\": \"-2.621323\",\"status\": \"parked\",\"speed\": \"0\"}]"
    
    var jsonStringVehicleGroups = "[{\"id\": 7,\"groups\": \"1,11\"},{\"id\": 8,\"groups\": \"1,11\"},{\"id\": 91,\"groups\": \"8\"}]"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // let jsonFile = [[NSBundle mainBundle] pathForResource("Form JSON" ofType:@"json")
        
        
//        let vehiclesFilePath = Bundle.main.path(forResource: "vehicles", ofType:"json")
//        let vehicleGroupsFilePath = Bundle.main.path(forResource: "vehicle_groups", ofType:"json")
//        
//        retrieveJsonStringFromBundle(filePath: vehiclesFilePath)
//        retrieveJsonStringFromBundle(filePath: vehicleGroupsFilePath)
        
        vehiclesString = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "vehicles", ofType:"json"))
        vehiclesGroupsString = retrieveJsonStringFromBundle(filePath: Bundle.main.path(forResource: "vehicle_groups", ofType:"json"))
        

            
            
            
//            if let vehicleData =  try? Data(contentsOf: URL(fileURLWithPath: filePath!), options: Data.ReadingOptions.uncached) {
//
//                
//                vehiclesString = String(data: vehicleData, encoding: .utf8)!
//                
//                print("filePath is \(vehiclesString)" )
//                
//
//                
//                
//            }else {
//                print("Invalid filename/path.")
//        }
        
            

        
        

        
        
        
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
 
    

    
    
    
    
    
    
    func parseJson(jsonString: String) throws {
        
        
        var mVehicle: [Vehicle] = []
        
    //    if JSONSerialization.isValidJSONObject(jsonStringVehicles) {
            
        
        
        //let jsonData = jsonStringVehicles.data(using: String.Encoding.utf8)
        let jsonData = jsonString.data(using: String.Encoding.utf8)

        
        if let data = jsonData {
            
            let jsonDoc : Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            
            let vehicles: NSArray = jsonDoc as! NSArray
            
            
            //print("the array vehicles is... ", vehicles)
            
            for i in 0..<vehicles.count {
                if let dict = vehicles[i] as? NSDictionary {
                
                let vehicle = Vehicle()
                    
                    print("dict is  ", dict.description)
                    
//                    print(" dictionary vehicle tag actual is...  ",JsonDocTags.VEHICLE_ID_TAG)
//                    print(" dictionary vehicle tag is...  ",(dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as? Int) ?? "empty??")
//                    print(" dictionary VEHICLE_GROUP_TAG is...  ",(dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as? String) ?? "empty??")
                
                addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_ID_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as AnyObject))
               // addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_ID_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_ID_TAG) as? Int))
                
                    
                    addElementToVehicle(vehicle, elementName: JsonDocTags.LAT_TAG, elementValue: (dict.object(forKey: JsonDocTags.LAT_TAG) as AnyObject))
                    addElementToVehicle(vehicle, elementName: JsonDocTags.LONG_TAG, elementValue: (dict.object(forKey: JsonDocTags.LONG_TAG) as AnyObject))
                    addElementToVehicle(vehicle, elementName: JsonDocTags.STATUS_TAG, elementValue: (dict.object(forKey: JsonDocTags.STATUS_TAG) as AnyObject))
                    addElementToVehicle(vehicle, elementName: JsonDocTags.SPEED_TAG, elementValue: (dict.object(forKey: JsonDocTags.SPEED_TAG) as AnyObject))
                    
                    
                    
//                    for field in json?["Language"]??["Field"] as? [AnyObject] ?? [] {
//                        if let number = field["Number"] as? String {
//                            print(number)
//                        }
//                    }
                    
                    
//                    for JsonDocTags.VEHICLE_GROUP_TAG as?  [AnyObject] ?? [] {
//                        
//                        }
//                        
//                        
//                        (dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as? [Int])
                    
//
//                    
//                    addElementToVehicle(vehicle, elementName: JsonDocTags.VEHICLE_GROUP_TAG, elementValue: (dict.object(forKey: JsonDocTags.VEHICLE_GROUP_TAG) as AnyObject))

                    
                    
                mVehicle.append(vehicle)
                    
                    
                }
                
                
            }
            
            
//            for i in 0..<mVehicle.count {
//            print("***** the array mVehicle is... ", [i].description)
//            
//            }

            for item in mVehicle {
                
                
                
                
                print("vehicle id is...  ", item.vehicleId)
                print("vehicle lat is...  ", item.lat)
                print("vehicle long is...  ", item.lng)
                print("vehicle status is...  ", item.status)
                print("vehicle speed is...  ", item.speed)
                
                
                if item.groups.isEmpty {
                    print("vehicle GROUP is... EMPTY!!!!!  ")
                } else {
                    print("vehicle GROUP is...  ", item.groups[0])
                    
                }
                
                //print(item.)
                
                
            }
            
            
            
            
//            //if let vehicles = (jsonDoc as AnyObject).object(forKey: DocTags.BOOKS_TAG) as? NSArray {
//            if let vehicles = jsonDoc as! [AnyObject] {
//            
//            
//                for i in 0 ..< vehicles.count {
//                    if let dict = vehicles[i] as? NSDictionary {
//                        let vehicle = Vehicle()
//                        
//                        addElementToBook(book, elementName: DocTags.AUTHOR_TAG, elementValue: (dict.object(forKey: DocTags.AUTHOR_TAG) as? String))
//                        
//                        
//                        mVehicle.append(vehicle)
//                    }
//                }
//                
//                for book in mVehicle {
//                    print("Found - \(book.name) \(book.author)")
//                }
//                
//                
//                let myDict = [DocTags.BOOKS_TAG:books]
//                do {
//                    print("Str:  \(try buildJSON(myDict as AnyObject))")
//                } catch {}
//                
//                
//            }
            
            
            
        }
            
            
//        } else {
//            
//            //NSLog("Is not a valid JSON Object!!!!")
//            
//            print("Is not a valid JSON Object!!!!")
//            
//        }
        
    }
    

    
//    func addElementToVehicle(_ vehicle: Vehicle, elementName: String, elementValue: String?) {
//        if let value = elementValue {
//            vehicle.addValue(elementName, withValue: value)
//        }
//    }
    
    
            func addElementToVehicle(_ vehicle: Vehicle, elementName: String, elementValue: AnyObject?) {
                if let value = elementValue {
                    vehicle.addValue(elementName, withValue: value)
                }
            }
    
    
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
        return ""
    }
    
    
    
    
    
    ///-----------------------
    
    
    
    
    
    
    
    
//       func parseJson() throws {
//     
//        
//        var mVehicle: [Vehicle] = []
//        
//        
//        let jsonData = jsonString.data(using: String.Encoding.utf8)
//        if let data = jsonData {
//            let jsonDoc : Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
//            
//            if let vehicles = (jsonDoc as AnyObject).object(forKey: DocTags.BOOKS_TAG) as? NSArray {
//                
//                for i in 0 ..< vehicles.count {
//                    if let dict = vehicles[i] as? NSDictionary {
//                        let vehicle = Vehicle()
//                        
//                        addElementToBook(book, elementName: DocTags.AUTHOR_TAG, elementValue: (dict.object(forKey: DocTags.AUTHOR_TAG) as? String))
//                        
//                     
//                        mVehicle.append(vehicle)
//                    }
//                }
//                
//                for book in mVehicle {
//                    print("Found - \(book.name) \(book.author)")
//                }
//                
//                
//                let myDict = [DocTags.BOOKS_TAG:books]
//                do {
//                    print("Str:  \(try buildJSON(myDict as AnyObject))")
//                } catch {}
//                
//                
//            }
//            
//        
//        
//    }
    
        
        
        
        
        
//        func addElementToVehicle(_ book: Book, elementName: String, elementValue: String?) {
//            if let value = elementValue {
//                book.addValue(elementName, withValue: value)
//            }
//        }
    
    
        
        
        //-----------------------
        
        
        
    
//    func parseJson() throws {
//        var myBooks: [Book] = []
//        let jsonData = jsonString.data(using: String.Encoding.utf8)
//        if let data = jsonData {
//            let jsonDoc : Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
//            
//            if let books = (jsonDoc as AnyObject).object(forKey: DocTags.BOOKS_TAG) as? NSArray {
//                
//                for i in 0 ..< books.count {
//                    if let dict = books[i] as? NSDictionary {
//                        let book = Book()
//                        addElementToBook(book, elementName: DocTags.AUTHOR_TAG, elementValue: (dict.object(forKey: DocTags.AUTHOR_TAG) as? String))
//                        addElementToBook(book, elementName: DocTags.CATEGORY_TAG, elementValue: (dict.object(forKey: DocTags.CATEGORY_TAG) as? String))
//                        addElementToBook(book, elementName: DocTags.DESCRIPTION_TAG, elementValue: (dict.object(forKey: DocTags.DESCRIPTION_TAG) as? String))
//                        addElementToBook(book, elementName: DocTags.NAME_TAG, elementValue: (dict.object(forKey: DocTags.NAME_TAG) as? String))
//                        addElementToBook(book, elementName: DocTags.PUBLISHER_TAG, elementValue: (dict.object(forKey: DocTags.PUBLISHER_TAG) as? String))
//                        myBooks.append(book)
//                    }
//                }
//                
//                for book in myBooks {
//                    print("Found - \(book.name) \(book.author)")
//                }
//                
//                
//                let myDict = [DocTags.BOOKS_TAG:books]
//                do {
//                    print("Str:  \(try buildJSON(myDict as AnyObject))")
//                } catch {}
//            }
//        }
//    }
//    
//    func addElementToBook(_ book: Book, elementName: String, elementValue: String?) {
//        if let value = elementValue {
//            book.addValue(elementName, withValue: value)
//        }
//    }
//    
//    
//    func buildJSON(_ value: AnyObject) throws -> String {
//        if JSONSerialization.isValidJSONObject(value) {
//            let data = try JSONSerialization.data(withJSONObject: value, options: [])
//            if let string = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
//                return string as String
//            }
//        }
//        return ""
//    }

    

}
