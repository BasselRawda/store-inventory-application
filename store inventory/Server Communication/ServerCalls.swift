//
//  DataFetching.swift
//  store inventory
//
//  Created by Jad Rawda on 3/12/19.
//  Copyright © 2019 Rawda. All rights reserved.
//

import Alamofire
import SwiftyJSON

struct device {
   static var ids: [String]!
   static var names: [String]!
   static var prices: [String]!
   static var cpu: [String]!
   static var models: [String]!
   static var images: [String]!
   static var manufacturers: [String]!
}

class ServerCalls {
    let constants = Constants()
    
    func getAll(completion : @escaping ()->()){

        
        let url = constants.address+"/products"
        Alamofire.request(url).responseJSON(completionHandler: {(response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
                device.names = json.arrayValue.map({$0["name"].stringValue})
                device.ids = json.arrayValue.map({$0["_id"].stringValue})
                device.prices = json.arrayValue.map({$0["price"].stringValue})
                device.models = json.arrayValue.map({$0["model"].stringValue})
                device.cpu = json.arrayValue.map({$0["cpu"].stringValue})
                device.manufacturers = json.arrayValue.map({$0["manufacturer"].stringValue})
               
            case .failure(let error):
                print(error.localizedDescription)
        }
            completion()
        })

        }

    

    func getItem(data: String){
        let url = constants.address+"/products/" + "" + data
        Alamofire.request(url).responseJSON(completionHandler: {(response) in
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            print(json)
        case .failure(let error):
            print(error.localizedDescription)
        }
    })
    
}
    func postItem(data: [String],completion : @escaping ()->()){
        
        let url = constants.address+"/products/"
        let price = Double(data[1])
        let parameters: Parameters = [
            "name": data[0],
            "price": price ?? 0,
            "img" : data[2],
            "model": data[3],
            "cpu": data[4],
            "manufacturer": data[5]
        ]
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON(completionHandler: {(response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        })
        
    }
    
    func patchItem(data: String){
        
        let url = constants.address+"/products/" + "" + data
        Alamofire.request(url, method: .patch).responseJSON(completionHandler: {(response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
    }
    
    func deleteItem(data: String, completion : @escaping ()->()){
        let url = constants.address+"/products/" + "" + data
        Alamofire.request(url, method: .delete).responseJSON(completionHandler: {(response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let error):
                print(error.localizedDescription)
            }
            completion()
        })
        
    }

    

}
