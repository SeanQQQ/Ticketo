//
//  FlightDetailController.swift
//  Ticketo
//
//  Created by Sean Savanah on 16/5/2022.
//

import Foundation
import UIKit

class FlightDetailController: UIViewController {

    var currentFlight : flightStruct? = nil;
    
    
    @IBOutlet weak var from: UITextField!
    
    @IBOutlet weak var to: UITextField!
    
    @IBOutlet weak var date: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        from.text = currentFlight?.from;
        to.text = currentFlight?.to;
        date.text = currentFlight?.date;// Do any additional setup after loading the view.
    }

    @IBAction func buyNowClicked(_ sender: Any) {
    
        DataController.AddUserTicket(username: "Test", flightId: currentFlight?.id ?? 0	);
    
    }
    
}
