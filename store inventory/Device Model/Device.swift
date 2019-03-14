//
//  Device.swift
//  store inventory
//
//  Created by Jad Rawda on 3/13/19.
//  Copyright © 2019 Rawda. All rights reserved.
//

import UIKit

class Device: Codable{
    
    let name: String
    let price: Int
    let img: String
    let model: String
    let cpu: String
    let manufacturer: String
    
    init(name: String, price: Int, img: String, model: String, cpu: String, manufacturer: String) {
        self.name = name
        self.price = price
        self.img = img
        self.model = model
        self.cpu = cpu
        self.manufacturer = manufacturer
    }
    
}
