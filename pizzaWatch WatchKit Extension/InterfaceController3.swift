//
//  InterfaceController3.swift
//  pizzaWatch WatchKit Extension
//
//  Created by Diego Alejandro Cantú Gómez on 01/05/19.
//  Copyright © 2019 Diego Alejandro Cantú Gómez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController3: WKInterfaceController {
    
    
    @IBOutlet weak var picker: WKInterfacePicker!
    
    var size:String = ""
    var body:String = ""
    var chesse:String = "Mozzarela"
    

    override func awake(withContext context: Any?){
        super.awake(withContext: context)
        
        if let newContext = context{
            let contextDictionary = newContext as! [String:String]
            self.size = contextDictionary["size"] ?? ""
            self.body = contextDictionary["body"] ?? ""
        }
 
        var items: [WKPickerItem] = [WKPickerItem()]
        let item1 = WKPickerItem()
        item1.title="Mozzarela"
        let item2 = WKPickerItem()
        item2.title="Cheddar"
        let item3 = WKPickerItem()
        item3.title="Parmesano"
        items.append(item1)
        items.append(item2)
        items.append(item3)
        picker.setItems(items)
        picker.setSelectedItemIndex(1)
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func choose(_ value: Int) {
        if (value == 0) {
            chesse = "Mozzarela"
        } else if (value == 1) {
            chesse = "Cheddar"
        } else if (value == 2) {
            chesse = "Parmesano"
        }
    }
    
    @IBAction func next() {

        let contexts:[String:String] =
            [
                "size": self.size,
                "body": self.body,
                "chesse": self.chesse
        ]
        
        pushController(withName: "ingredentsIdentifier", context: contexts)
    }
}
