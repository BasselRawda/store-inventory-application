//
//  AddViewController.swift
//  store inventory
//
//  Created by Jad Rawda on 3/13/19.
//  Copyright © 2019 Rawda. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class AddViewController: UIViewController {



    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var cpuTextField: UITextField!
    
    @IBOutlet weak var modelTextField: UITextField!
    
    @IBOutlet weak var manufacturerTextField: UITextField!
    
    @IBAction func backBtn(_ sender: Any) {
        performSegue(withIdentifier: "backToMain", sender: self)
    }
    @IBAction func addBtn(_ sender: Any) {
        if(nameTextField.text == "" || priceTextField.text is Numeric || cpuTextField.text == "" || modelTextField.text == "" || manufacturerTextField.text == ""){
            
            let alert = UIAlertController(title: "Oops, Something Went Wrong", message: "One or more fields are empty", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }else{
            
            let data: [String] = [nameTextField.text!,priceTextField.text!,"https://via.placeholder.com/300",modelTextField.text!,cpuTextField.text!,manufacturerTextField.text!]
            ServerCalls().postItem(data: data, completion:{
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
            })
         
        }
    }
    @IBAction func choseImage(_ sender: Any) {
        ImagePickerManager().pickImage(self){ image in
            print(image)
        }
    }

    
}
