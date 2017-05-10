//
//  DetailsViewController.swift
//  ChicagoFoodApp
//
//  Created by zhang  zhihao on 5/9/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var risk: UILabel!
    @IBOutlet weak var violations: UITextView!
    
  
    var facilityName: String = ""
    var facilityAddress: String = ""
    var facilityRisk: String = ""
    var facilityViolations: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = facilityName
        address.text = facilityAddress
//        risk.text = ""

   
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

}
