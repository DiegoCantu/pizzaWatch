//
//  InterfaceController4.swift
//  pizzaWatch WatchKit Extension
//
//  Created by Diego Alejandro Cantú Gómez on 01/05/19.
//  Copyright © 2019 Diego Alejandro Cantú Gómez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController4: WKInterfaceController {
    
    
    @IBOutlet weak var Hawaiana: WKInterfaceSwitch!
    
    @IBOutlet weak var Ranchera: WKInterfaceSwitch!
    
    var size:String = ""
    var body:String = ""
    var chesse:String = ""
    var selectedIngredientes: [String] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let newContext = context{
            let contextDictionary = newContext as! [String:String]
            self.size = contextDictionary["size"] ?? ""
            self.body = contextDictionary["body"] ?? ""
            self.chesse = contextDictionary["chesse"] ?? ""
        }
     
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func choose1(_ value: Bool) {
        if (value){
            selectedIngredientes.append("Hawaiana")
        } else {
            if let index = selectedIngredientes.index(of: "Hawaiana") {
                selectedIngredientes.remove(at: index)
            }
        }
    }
    
    @IBAction func choose2(_ value: Bool) {
        if (value){
            selectedIngredientes.append("Ranchera")
        } else {
            if let index = selectedIngredientes.index(of: "Ranchera") {
                selectedIngredientes.remove(at: index)
            }
        }
    }
    
    @IBAction func next() {
        
        
        let contexts:[String:Any] =
            [
                "size": self.size,
                "body": self.body,
                "chesse": self.chesse,
                "selectedIngredientes": self.selectedIngredientes
          ]
        print(contexts)
        pushController(withName: "ordenIdentifier", context: contexts)
        
    }
    
   
}
