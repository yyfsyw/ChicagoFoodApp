//
//  FavoriteTableViewController.swift
//  ChicagoFoodApp
//
//  Created by zhang  zhihao on 5/10/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {

    @IBOutlet var facilityTableView: UITableView!
    
    var facilities: [Facility] = []
    var numOfFavorites = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Model.sharedInstance.loadData()
        facilities = Model.sharedInstance.fetchFacilities()
        print("-------------------")
        print(facilities.count)
        
        
        print(facilities[0].name!)
        print(facilities[0].favorited)
         
        
        
        for facility in facilities {
            if facility.favorited == true{
                numOfFavorites += 1
            }
        }
        print(numOfFavorites)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numOfFavorites
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoritetablecell", for: indexPath)

        if let cell = cell as? FavoriteTableViewCell {
            cell.facilityName.text = facilities[indexPath.row].name ?? "Not available"
            
        }

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController,
            let row = facilityTableView.indexPathForSelectedRow?.row{
            
            destination.facilityName = facilities[row].name ?? "Not available"
            destination.facilityAddress = facilities[row].address ?? "Not available"
            if let riskValue = facilities[row].risk {
                if riskValue == 1 {
                    destination.facilityRisk = "Risk 1 (High)"
                }
                else if riskValue == 2 {
                    destination.facilityRisk = "Risk 2 (Medium)"
                }
                else if riskValue == 3 {
                    destination.facilityRisk = "Risk 3 (Low)"
                }
                else{
                    destination.facilityRisk = "Not applicable"
                }
                
            }
            
            if let inspections = facilities[row].inspectionArray{
                for inspection in inspections{
                    if let violation = inspection.violation{
                        destination.facilityViolations.append(violation)
                    }
                }
            }
            destination.latitude = facilities[row].latitude
            destination.longitude = facilities[row].longitude
            
            
        }
    }
 

}
