//
//  InterfaceController.swift
//  pizzaWatch WatchKit Extension
//
//  Created by Diego Alejandro Cantú Gómez on 01/05/19.
//  Copyright © 2019 Diego Alejandro Cantú Gómez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet weak var sizeLabel: WKInterfaceLabel!
    var size: String = "Chica"
  
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func setSize(_ value: Float) {
        if (value == 1) {
            size = "Chica"
        } else if (value == 2) {
            size = "Mediana"
        } else if (value == 3){
            size = "Grande"
        }
          sizeLabel.setText(size)
    }
    
    @IBAction func next() {
        print(size)
        pushController(withName: "bodyIdentifier", context: size)
    }
}
