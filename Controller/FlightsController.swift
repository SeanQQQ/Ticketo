//
//  FlightsController.swift
//  Ticketo
//
//  Created by Sean Savanah on 16/5/2022.
//

import Foundation
import UIKit

class FlightsController: UIViewController {

    @IBOutlet weak var StackView_Flight1: UIStackView!
    
    @IBOutlet weak var txt_origin1: UITextField!
    @IBOutlet weak var txt_destination1: UITextField!
    @IBOutlet weak var txt_date1: UITextField!
    @IBOutlet weak var btn_flight1nav: UIButton!
    
    var currentpage = 0;
    let PAGE_COUNT = 2;
    

    var flight1 = DataController.getFlight(id: 1);
    var flight2 = DataController.getFlight(id: 2);
    var flight3 = DataController.getFlight(id: 3);
    var flight4 = DataController.getFlight(id: 4);
    
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

        txt_origin1.text = flight1?.from;
        txt_destination1.text = flight1?.to;
        txt_date1.text = flight1?.date;
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "flight1segue"){
            let VC = segue.destination as! FlightDetailController;
            VC.currentFlight = flight1;
        }
    }
    
}
