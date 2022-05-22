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
    
    @IBOutlet weak var from1: UITextField!
    
    @IBOutlet weak var to1: UITextField!
    @IBOutlet weak var date1: UITextField!
    
    @IBOutlet weak var from2: UITextField!
    
    @IBOutlet weak var to2: UITextField!
    
    @IBOutlet weak var date2: UITextField!
    
    
    var username = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTicketText()
        // Do any additional setup after loading the view.
    }
    
    private func loadTicketText(){
        let x = DataController.GetUserTickets(username: username);
        print(x)
      
        if(x.count == 1){ //I know this is bad but we were running out of time
            from1.text = x[0].from;
            to1.text = x[0].to;
        }
        if(x.count > 2){
            from1.text = x[0].from;
            from2.text = x[1].from;
            to1.text = x[0].to;
            to2.text = x[1].to;
                
        }
            
     


        //print(x[0].to)
        //print(x[0].date)

    }


}


