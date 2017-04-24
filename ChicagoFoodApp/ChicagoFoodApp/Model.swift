//
//  Model.swift
//  ChicagoFoodApp
//
//  Created by zhang  zhihao on 4/23/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import UIKit
import CoreData

class Model {
    // MARK: - Properties
    var managedContext: NSManagedObjectContext?
    
    // MARK: Static
    static var sharedInstance: Model = Model()
    
    // MARK: - Initializer
    init() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let persistentContainer = appDelegate?.persistentContainer
        managedContext = persistentContainer?.viewContext
    }
    
    // MARK: - Core Data Functions
    func loadData() {
        let coreDataLoadedKey = "hasLoadedCoreData"
        
        
        
        guard !UserDefaults.standard.bool(forKey: coreDataLoadedKey) else { return }
        
        
        
        let newsCategories = JSONLoader.load(fileName: "test")
        
        //        for newsCategory in newsCategories {
        //            if let category = Category(title: newsCategory.title) {
        //                for newsArticle in newsCategory.articles {
        //                    if let article = Article(title: newsArticle.title, date: newsArticle.date) {
        //                        category.addToArticles(article)
        //                    }
        //                }
        //            }
        //        }
        //
        //        do {
        //            try self.managedContext?.save()
        //
        //            UserDefaults.standard.set(true, forKey: coreDataLoadedKey)
        //        } catch {
        //            return
        //        }
    }
    
    
}
