//
//  ViewController.swift
//  store inventory
//
//  Created by Jad Rawda on 3/9/19.
//  Copyright © 2019 Rawda. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class TableViewController: UITableViewController{

    var dataReceived = false
    var deleted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        getAllData()
    }
    
    func getAllData(){
        ServerCalls().getAll(completion: {
            print(device.ids)
            self.dataReceived = true
            self.loadList()
        })

    }
    
    @objc func loadList(){
       tableView.reloadData()
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else {
            return TableViewCell()
        }
        if(dataReceived){
           
            cell.nameLBL.text = "Name: " + device.names[indexPath.row]
            cell.priceLBL.text = "Price: " + device.prices[indexPath.row]
            cell.modelLBL.text = "Model: " + device.models[indexPath.row]
            cell.cpuLBL.text = "CPU: " + device.cpu[indexPath.row]
            cell.manufacturerLBL.text = "Manufacturer: " + device.manufacturers[indexPath.row]
            let url = "https://via.placeholder.com/300"
            cell.imgView.contentMode = .scaleAspectFit
            cell.imgView.layoutIfNeeded()
            if let url = URL( string:url)
            {
                DispatchQueue.global().async {
                    if let data = try? Data( contentsOf:url)
                    {
                        DispatchQueue.main.async {
                            cell.imgView.image = UIImage( data:data)
                        }
                    }
                }
            }
        
    }
        return cell
    }
    
    

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(dataReceived){
            return device.ids.count
        }else{
            return 1
            
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch  editingStyle {
        case .delete:
            ServerCalls().deleteItem(data: device.ids[indexPath.row], completion:{
                self.getAllData()
                print("deleted")
                self.loadList()
            })
            
        default:
            print("nothing")
        }
        }
    
    
    
    @IBAction func addBtn(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: self)
    }
 
}

