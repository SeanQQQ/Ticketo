//
//  FlightsController.swift
//  Ticketo
//
//  Created by Sean Savanah on 16/5/2022.
//

import Foundation
import UIKit

class FlightsController: UIViewController {

    @IBOutlet weak var to1: UILabel!
    @IBOutlet weak var from1: UILabel!
    @IBOutlet weak var date1: UILabel!
    
    @IBOutlet weak var from2: UILabel!
    @IBOutlet weak var to2: UILabel!
    @IBOutlet weak var date2: UILabel!
    
    @IBOutlet weak var date3: UILabel!
    @IBOutlet weak var to3: UILabel!
    @IBOutlet weak var from3: UILabel!
    
    @IBOutlet weak var from4: UILabel!
    @IBOutlet weak var to4: UILabel!
    @IBOutlet weak var date4: UILabel!
    
    @IBOutlet weak var from5: UILabel!
    @IBOutlet weak var to5: UILabel!
    @IBOutlet weak var date5: UILabel!
    
    @IBOutlet weak var from6: UILabel!
    @IBOutlet weak var to6: UILabel!
    @IBOutlet weak var date6: UILabel!
    
    var currentpage = 0;
    let PAGE_COUNT = 2;
    
    var flight1 = DataController.getFlight(id: 1);
    var flight2 = DataController.getFlight(id: 2);
    var flight3 = DataController.getFlight(id: 3);
    var flight4 = DataController.getFlight(id: 4);
    var flight5 = DataController.getFlight(id: 5);
    var flight6 = DataController.getFlight(id: 6);
    var flight7 = DataController.getFlight(id: 7);
    var flight8 = DataController.getFlight(id: 8);
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFlightText();
        
        // Do any additional setup after loading the view.
    }

    private func nextPage(){
        if(currentpage < PAGE_COUNT-1){
            currentpage+=1;
        }
    }
    
    private func prevPage(){
        if(currentpage > 0){
            currentpage -= 1
        }
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        nextPage()
        loadFlightText();
    }
    
    @IBAction func prevButtonClicked(_ sender: Any) {
        prevPage();
        loadFlightText();
    }
    
    
    
    private func loadFlightText(){
        flight1 = DataController.getFlight(id: 1 + currentpage*4);
        flight2 = DataController.getFlight(id: 2 + currentpage*4);
        flight3 = DataController.getFlight(id: 3 + currentpage*4);
        flight4 = DataController.getFlight(id: 4 + currentpage*4);

        to1.text = flight1?.from;
        from1.text = flight1?.to;
        date1.text = flight1?.date;
        
        
        to2.text = flight2?.from;
        from2.text = flight2?.to;
        date2.text = flight2?.date;

        
        to3.text = flight3?.from;
        from3.text = flight3?.to;
        date3.text = flight3?.date;
        
        
        to4.text = flight4?.from;
        from4.text = flight4?.to;
        date4.text = flight3?.date;
        
        to5.text = flight5?.from;
        from5.text = flight5?.to;
        date5.text = flight5?.date;
        
        to6.text = flight6?.from;
        from6.text = flight6?.to;
        date6.text = flight6?.date;
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "flight1segue"){
            let VC = segue.destination as! FlightDetailController;
            VC.currentFlight = flight1;
        }
        if(segue.identifier == "flight2segue"){
            let VC = segue.destination as! FlightDetailController;
            VC.currentFlight = flight2;
        }
        if(segue.identifier == "flight3segue"){
            let VC = segue.destination as! FlightDetailController;
            VC.currentFlight = flight3;
        }
        if(segue.identifier == "flight4segue"){
            let VC = segue.destination as! FlightDetailController;
            VC.currentFlight = flight4;
        }
        if(segue.identifier == "flight5segue"){
            let VC = segue.destination as! FlightDetailController;
            VC.currentFlight = flight5;
        }
        if(segue.identifier == "flight6segue"){
            let VC = segue.destination as! FlightDetailController;
            VC.currentFlight = flight6;
        }
    }
    
}
