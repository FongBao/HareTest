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
    
    @IBOutlet weak var mainTextView: UITextView!
    
    
    @IBAction func parseJsonFile(_ sender: UIButton) {
        
        let serialQueue = DispatchQueue(label: "jsonQueue")
        
    
        serialQueue.async {
            
        do {
            try self.jsonHelper.parseJson(jsonString: self.vehiclesString, vehiclesData : self.vehiclesDataHandler)
            
        } catch let error {
            print(error.localizedDescription)
            }
        }
        
       serialQueue.async {

        
        do {
            try self.jsonHelper.parseJson(jsonString: self.vehiclesGroupsString, vehiclesData : self.vehiclesDataHandler)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
        
        
    serialQueue.async {
    
        let completeJsonString = self.jsonHelper.createJsonString()
        
        //set to main screen to view
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
