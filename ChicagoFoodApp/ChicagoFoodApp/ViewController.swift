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
        
        print(facilities.count)
        
        print("-------------------")
        for facility in facilities {
            print(facility.address ?? "")
            print(facility.longitude )
            print(facility.latitude )
        }
        
        TestingLabel.text = facilities[0].address
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

