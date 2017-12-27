//
//  ViewController.swift
//  TipCalc
//
//  Created by Andy Duong on 12/14/17. QA Testing: Brendan Lam, Lucy Zhang, and Michelle Vuong
//  Copyright © 2017 Andy Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Q: What do the dots to the left side that map to specific views on the story board represent?     
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var tipControlSlider: UISlider!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var partyNumberField: UITextField!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Do any additional setup after loading the view, typically from a nib.
        billField.delegate = self;
        partyNumberField.delegate = self;
        billField.becomeFirstResponder();
        tipControlSlider.isHidden = true;
        backButton.isHidden = true;
        calculateTip( Any.self );
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        calculateTip( self );
        calculatePerPerson( self );
    }
    
    // MARK: Actions
    @IBAction func onTap( _ sender: Any ) {
        view.endEditing( true );
    }
    
    @IBAction func onMoreButtonPush( _ sender: Any ) {
        
        // Setting default value of slider.
        tipControlSlider.value = 15.0;
        
        tipControl.isHidden = true;
        moreButton.isHidden = true;
        
        tipControlSlider.isHidden = false;
        backButton.isHidden = false;
        
    }
    
    @IBAction func onBackButtonPush( _ sender: Any ) {
        
        // Setting default index of segmented control.
        tipControl.selectedSegmentIndex = 1;
        
        tipControl.isHidden = false;
        moreButton.isHidden = false;
        
        tipControlSlider.isHidden = true;
        backButton.isHidden = true;
        
        // Q: What is Any.self?
        // Q: What is the difference between delegate methods and actions?
    }
    
    @IBAction func calculateTip( _ sender: Any ) {
        var bill: Double, tip: Double, total: Double;
        let tipPercentages = [0.10, 0.15, 0.18];
        
        bill = Double( billField.text! ) ?? 0;
        
        // Tip based on segmented control.
        if ( tipControlSlider.isHidden ) {
            tipPercentLabel.text = String( format: "%d%%", Int( tipPercentages[ tipControl.selectedSegmentIndex ] * 100 ) );
            tip = bill * tipPercentages[ tipControl.selectedSegmentIndex ];
        }
        // Tip based on slide control.
        // Q: Is there a better way of doing this?
        else {
            tipPercentLabel.text = String( format: "%d%%", Int( tipControlSlider.value ) );
            tip = bill * Double( Int( tipControlSlider.value ) ) / 100;
            
        }
        tipLabel.text = String( format: "%.2f", tip );

        total = bill + tip;
        totalLabel.text = String( format: "%.2f", total );
    }
    
    @IBAction func calculatePerPerson(_ sender: Any) {
        // Q: This is a work-around to a problem that the calculatePerPerson needs to wait for calculateTip to update the total before using it.
        calculateTip( Any.self );
        
        var numPeople: Int;
        var total: Double;
        
        numPeople = Int( partyNumberField.text! ) ?? 0;
        total = Double( totalLabel.text! ) ?? 0;
        
        if ( numPeople == 0 ) {
            perPersonLabel.text = "";
        }
        else {
             perPersonLabel.text = String( format: "%.2f", total / Double( numPeople ) );
        }
    }
}

