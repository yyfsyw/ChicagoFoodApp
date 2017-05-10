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
    @IBOutlet weak var favoriteButton: UIButton!
    
  
    var facilityName: String = ""
    var facilityAddress: String = ""
    var facilityRisk: String = ""
    var facilityViolations: [String] = []
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Changes to Favorite Button Look */
//        if(facility.favorite == true){
//            favoriteButton.setImage(UIImage(named: "Hearts-25"), for: UIControlState.normal)
//        }
//        else{
//            favoriteButton.setImage(UIImage(named: "Hearts-25White"), for: UIControlState.normal)
//        }
        
        name.text = facilityName
        address.text = facilityAddress
        print(facilityAddress)
        risk.text = facilityRisk
        for violation in facilityViolations {
            violations.text = violation
        }
        if violations.text == "" {
            violations.text = "No comments about violations"
        }
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* Get Directions */
    @IBAction func getDirections(_ sender: UIButton) {
    }

    
    /* Favorite/Track a restuarant */
    @IBAction func favorited(_ sender: UIButton) {
//        if(facility.favorite == false){
//            facility.favorite = true
//            do{
//                try facility.managedObjectContext?.save()
//            } catch {
//                let saveError = error as NSError
//                print(saveError)
//            }
//            favoriteButton.setImage(UIImage(named: "Hearts-25"), for: UIControlState.normal)
//        }
//        else{
//            facility.favorite = false
//            do{
//                try facility.managedObjectContext?.save()
//            } catch {
//                let saveError = error as NSError
//                print(saveError)
//            }
//            favoriteButton.setImage(UIImage(named: "Hearts-25White"), for: UIControlState.normal)
//        }
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
