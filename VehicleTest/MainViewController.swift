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
    
    let jsonHelper = JsonHelper()
    let vehiclesDataHandler = VehiclesData.sharedInstance
    let operationQueue = OperationQueue()
    
    @IBOutlet weak var mainTextView: UITextView!
    
    
    @IBAction func parseJsonFile(_ sender: UIButton) {
        
        operationQueue.maxConcurrentOperationCount = 1
        
        let serialQueue = DispatchQueue(label: "json")
        
        
        
     
            
//        }
//        
        operationQueue.addOperation {

        
            
//               serialQueue.async {
            
        do {
            try self.jsonHelper.parseJson(jsonString: self.vehiclesString, vehiclesData : self.vehiclesDataHandler)
            
        } catch let error {
            print(error.localizedDescription)
            }
        }
        
       // serialQueue.async {
        operationQueue.addOperation {
        
        do {
            try self.jsonHelper.parseJson(jsonString: self.vehiclesGroupsString, vehiclesData : self.vehiclesDataHandler)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
        
        
    //serialQueue.async {
        operationQueue.addOperation {
        //set to main screen to view
        let completeJsonString = self.jsonHelper.createJsonString()
        
        DispatchQueue.main.async {
            self.mainTextView.text = completeJsonString
        }
        
        
        }
        
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
     Loads test data from local storage
     */
    func retrieveJsonStringFromBundle(filePath: String?) -> String {
    
    
        if let vehicleData =  try? Data(contentsOf: URL(fileURLWithPath: filePath!), options: Data.ReadingOptions.uncached) {
            
            return String(data: vehicleData, encoding: .utf8)!
            
        }else {
            print("Invalid filename/path.")
            return ""
            
        }

        
        
    
    }
    

    
    

   

    

}
