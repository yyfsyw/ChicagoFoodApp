//
//  allTableViewController.swift
//  ChicagoFoodApp
//
//  Created by Chaewon Yun on 5/6/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit

class allTableViewController: UITableViewController {
    @IBOutlet var allTable: UITableView!

    var resturant = ["ResturantA", "ResturantB", "ResturantC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTable.delegate = self
        allTable.dataSource = self
        self.title = "All"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resturant.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allCell = tableView.dequeueReusableCell(withIdentifier: "allCell", for: indexPath)
        allCell.textLabel?.text = resturant[indexPath.row]
        
        return allCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let row = tableView.indexPathForSelectedRow?.row {
            let allResturant = resturant[row]
            print("Selected cell \(allResturant)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? allDetailViewController,
            let row = allTable.indexPathForSelectedRow?.row {
            destination.allResturant = resturant[row]
        }
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
