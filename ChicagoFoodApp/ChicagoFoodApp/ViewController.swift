//
//  ViewController.swift
//  ChicagoFoodApp
//
//  Created by YUNFEI YANG on 4/10/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var facilities: [Facility] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.sharedInstance.loadData()
        facilities = Model.sharedInstance.fetchCategories()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

