//
//  JSONParser.swift
//  ChicagoFoodApp
//
//  Created by zhang  zhihao on 4/23/17.
//  Copyright © 2017 YUNFEI YANG. All rights reserved.
//

import Foundation

class JSONParser {
    
    static let dateFormatter = DateFormatter()

    
    class func parse(_ data: Data) -> [FoodFacility] {
        var foodfacilities = [FoodFacility]()
      
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let dataNodes = root["data"] as? [[Any]]
        {
            for dataNode in dataNodes{
                if let address = dataNode[14] as? String,
                   let name = dataNode[9] as? String,
                   let type = dataNode[12] as? String,
                   let li = dataNode[11] as? String, let license = Int(li),
                   let riskvalue = dataNode[13] as? String,
                   let la = dataNode[22] as? String, let latitude = Double(la),
                   let lo = dataNode[23] as? String, let longitude = Double(lo)
                {
                        let risk: Decimal
                        //manually check risk value
                        if(riskvalue == "Risk 1 (High)") {
                            risk = 1
                        }
                        else if(riskvalue == "Risk 2 (Medium)") {
                            risk = 2
                        }
                        else if(riskvalue == "Risk 3 (Low)") {
                            risk = 3
                        }
                        else{
                            risk = 0
                        }
                        var newFacility = FoodFacility(address: address, name: name, type: type, license: license, risk: risk, latitude: latitude, longitude: longitude)

                            print("address: \(newFacility.address)")
                            print("the risk value: \(newFacility.risk)")
                            print("Type of facility: \(newFacility.type)")
                            print("license ID: \(newFacility.license)")
                            print("the Name: \(newFacility.name)")
                            print("latitude: \(newFacility.latitude)")
                            print("longitude: \(newFacility.longitude)")
                    
                    //parse inspection
                    if let inspectID = dataNode[8] as? String, let id = Int(inspectID),
                       let dateStr = dataNode[18] as? String,
                       let inspectType = dataNode[19] as? String,
                       let result = dataNode[20] as? String
                       {
                        //get date, month, and year from dateStr
                        let str_index = dateStr.index(dateStr.startIndex, offsetBy: 10)
                        let realDate = dateStr.substring(to: str_index)
                        print("the sub is: \(realDate)")
                        dateFormatter.dateFormat = "yyyy/MM/dd"
                        let storedDate = dateFormatter.date(from: realDate)
                        
                        //for check violation when it returns nil
                        let violation = dataNode[21] as? String ?? ""
                        
                        if let date = storedDate {
                            newFacility.inspections.append(FoodInspection(type: inspectType, result: result, violation: violation, id: id, date: date))
                        }
                        print("the date is: \(newFacility.inspections[0].date)")
                        print("Inspect ID: \(newFacility.inspections[0].id)")
                        print("inspect type: \(newFacility.inspections[0].type)")
                        print("result: \(newFacility.inspections[0].result)")
                        print("viloation description: \(newFacility.inspections[0].violation)")
                    }
                   foodfacilities.append(newFacility)
                    
                }
            }
            
        }
        return foodfacilities
    }
}
