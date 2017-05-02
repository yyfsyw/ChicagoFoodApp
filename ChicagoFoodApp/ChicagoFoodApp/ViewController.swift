//
//  ViewController.swift
//  ChicagoFoodApp
//
//  Created by YUNFEI YANG on 4/10/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TestingLabel: UILabel!

    
    var facilities: [Facility] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.sharedInstance.loadData()
        facilities = Model.sharedInstance.fetchFacilities()
        
         print("-------------------")
        print(facilities.count)
        
//        print("-------------------")
//        for facility in facilities {
//            print("address: \(facility.address ?? "")")
//            print("the risk value: \(facility.risk ?? 0)")
//            print("Type of facility: \(facility.type ?? "")")
//            print("license ID: \(facility.license )")
//            print("the Name: \(facility.name ?? "")")
//            print("latitude: \(facility.latitude )")
//            print("longitude: \(facility.longitude )")
//            print("~~~~here are inpsections")
//            print("num of inspection: \(facility.inspectionArray?.count ?? -1)")
//            for inspection in facility.inspectionArray! {
//                print("the date is: \(String(describing: inspection.date))")
//                print("Inspect ID: \(inspection.id)")
//                print("inspect type: \(String(describing: inspection.type))")
//                print("result: \(String(describing: inspection.results))")
//                print("viloation description: \(String(describing: inspection.violation))")
//                
//            }
//             print("-------------------")
        
          
//        }
        
        TestingLabel.text = facilities[0].address
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

