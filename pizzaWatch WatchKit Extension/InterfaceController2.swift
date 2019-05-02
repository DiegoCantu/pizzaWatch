//
//  InterfaceController2.swift
//  pizzaWatch WatchKit Extension
//
//  Created by Diego Alejandro Cantú Gómez on 01/05/19.
//  Copyright © 2019 Diego Alejandro Cantú Gómez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController2: WKInterfaceController {
    
    @IBOutlet weak var picker: WKInterfacePicker!
    var body:String = "Delgada"
    var size:String = ""
    
    override func awake(withContext context: Any?){
        super.awake(withContext: context)
        if let newContext = context{
            self.size = newContext as! String
            print(self.size)
        }
        
        var items: [WKPickerItem] = [WKPickerItem()]
        let item1 = WKPickerItem()
        item1.title="Delgada"
        let item2 = WKPickerItem()
        item2.title="Crujiente"
        let item3 = WKPickerItem()
        item3.title="Gruesa"
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
            body = "Delgada"
        } else if (value == 1) {
            body = "Crujiente"
        } else if (value == 2) {
            body = "Gruesa"
        }
    }
    
    @IBAction func next() {
        let contexts:[String:String] =
            [
            "size": self.size,
            "body": self.body
            ]
        
        pushController(withName: "chesseIdentifier", context: contexts)
    }
}
