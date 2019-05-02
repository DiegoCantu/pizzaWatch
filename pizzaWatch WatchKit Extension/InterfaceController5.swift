//
//  InterfaceController5.swift
//  pizzaWatch WatchKit Extension
//
//  Created by Diego Alejandro Cantú Gómez on 01/05/19.
//  Copyright © 2019 Diego Alejandro Cantú Gómez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController5: WKInterfaceController {
    

    @IBOutlet weak var table: WKInterfaceTable!
    
    var productos: [String] = []
    var size:String = ""
    var body:String = ""
    var chesse:String = ""
    var selectedIngredientes: [String] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let newContext = context{
            let contextDictionary = newContext as! [String:Any]
            self.size = contextDictionary["size"] as! String
            self.body = contextDictionary["body"] as! String
            self.chesse = contextDictionary["chesse"] as! String
            self.selectedIngredientes += contextDictionary["selectedIngredientes"] as! [String]
        
            productos.append(self.size)
            productos.append(self.body)
            productos.append(self.chesse)
            productos += self.selectedIngredientes
            
            table.setNumberOfRows(productos.count,withRowType: "OrderItemTableRowController")
            
            for i in 0 ... productos.count - 1 {
                let row = table.rowController(at: i) as! OrderItemTableRowController
                row.item.setText(productos[i])
                print(row.item)
            }
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
}
