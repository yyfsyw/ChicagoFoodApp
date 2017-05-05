//
//  LoginViewController.swift
//  ChicagoFoodApp
//
//  Created by YUNFEI YANG on 4/26/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    var facilities: [Facility] = []
    @IBAction func moveToTabBar(_ sender: UIButton) {
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = tabBarController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Model.sharedInstance.loadData()
        facilities = Model.sharedInstance.fetchFacilities()
        
        print(facilities.count)
        
        print("-------------------")
        for facility in facilities {
//            print(facility.address ?? "")
//            print(facility.longitude )
//            print(facility.latitude )
            print(facility.favorited)
            facility.favorited = false
            do {
                try facility.managedObjectContext?.save()
            } catch  {
                let saveError = error as NSError
                print(saveError)
            }
            
            
        }
          print("-------------------")
        for facility in facilities{
            print(facility.favorited)
            
        }
        

        // Do any additional setup after loading the view.
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
