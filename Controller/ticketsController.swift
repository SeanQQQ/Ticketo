//
//  ticketsController.swift
//  Ticketo
//
//  Created by Shanglin Jiang on 12/5/2022.
//

import Foundation
import UIKit

class ticketsController: UIViewController {

    @IBOutlet weak var haha: UIStackView!
    
    @IBOutlet weak var txt_origin1: UITextField!
    
    var username = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTicketText()
        // Do any additional setup after loading the view.
    }
    
    private func loadTicketText(){
        let x = DataController.GetUserTickets(username: username);
        print(x)
        //print(x[0].from)
        //print(x[0].to)
        //print(x[0].date)

    }


}


