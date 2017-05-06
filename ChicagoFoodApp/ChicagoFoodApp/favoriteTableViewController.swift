//
//  favoriteTableViewController.swift
//  ChicagoFoodApp
//
//  Created by Chaewon Yun on 5/5/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit

class favoriteTableViewController: UITableViewController {
    @IBOutlet var favoriteTable: UITableView!
    
    var favorites = ["ResturantA", "ResturantB", "ResturantC"]


    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteTable.delegate = self
        favoriteTable.dataSource = self
        self.title = "Favorite"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = favorites[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let row = tableView.indexPathForSelectedRow?.row {
            let favorite = favorites[row]
            print("Selected cell \(favorite)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? favoriteDetailViewController,
            let row = favoriteTable.indexPathForSelectedRow?.row {
            destination.favorite = favorites[row]
        }
    }


}
