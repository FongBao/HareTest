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
        
        
        do {

            
            try jsonHelper.parseJson(jsonString: vehiclesString, vehiclesData : vehiclesDataHandler)
            try jsonHelper.parseJson(jsonString: vehiclesGroupsString, vehiclesData : vehiclesDataHandler)
            
            
        } catch let error {
            
            
            print(" error!!!!")
            print(error.localizedDescription)
            
        }
        

        //set to main screen to view
        mainTextView.text = jsonHelper.createJsonString()
        
  
        
        
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
