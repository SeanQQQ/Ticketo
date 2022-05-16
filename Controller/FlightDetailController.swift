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
    
    @IBOutlet weak var lbl_flightname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        lbl_flightname.text = currentFlight?.from;
        // Do any additional setup after loading the view.
    }

    @IBAction func buyNowClicked(_ sender: Any) {
    
        DataController.AddUserTicket(username: "Test", flightId: currentFlight?.id ?? 0	);
    
    }
    
}
