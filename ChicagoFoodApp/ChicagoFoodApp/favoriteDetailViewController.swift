//
//  favoriteDetailViewController.swift
//  ChicagoFoodApp
//
//  Created by Chaewon Yun on 5/5/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit

class favoriteDetailViewController: UIViewController {
    var favorite: String = ""
    
    @IBOutlet weak var detail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detail.text = favorite
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
