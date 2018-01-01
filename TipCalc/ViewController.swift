//
//  ViewController.swift
//  TipCalc
//
//  Created by Andy Duong on 12/14/17. QA Testing: Brendan Lam, Lucy Zhang, and Michelle Vuong
//  Copyright © 2017 Andy Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsViewControllerDelegate {
    
    // MARK: Properties
    // Q: What do the dots to the left side that map to specific elements on the story board represent?
    // A: Those show which element of the storyboard is connected to each variable. If there is a blue bookmark, that is a breakpoint that can be set by clicking on a specific line in the margins.
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
    @IBOutlet weak var settingsBarButtonItem: UIBarButtonItem!
    
    let tipPercentages: [Float] = [0.10, 0.15, 0.18]
    var defaultTipPercentageIdx: Int!
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "TipCalc"
        billField.becomeFirstResponder()
        tipControlSlider.isHidden = true
        backButton.isHidden = true
        defaultTipPercentageIdx = 1
        
        calculateTip( self )
        calculatePerPerson( self )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // I stayed up until 6 am because I did not realize the prepare function of this view controller is called before the viewDidLoad function of the settings view controller. In the viewDidLoad function of the settings vc, I set its delegate to nil, after I had set its delegate to this, meaning that this vc's delegate method would never be called.
    override func prepare( for segue: UIStoryboardSegue, sender: Any! ) {
        if let vc = segue.destination as? SettingsViewController {
            vc.delegate = self
        }
    }
    
    // MARK: SettingsViewControllerDelegate
    func settingsDidFinish( controller: SettingsViewController, defaultIdx: Int ) {
        
        defaultTipPercentageIdx = defaultIdx
        
        // Setting default value of slider.
        tipControlSlider.value = tipPercentages[ defaultTipPercentageIdx ] * 100
        // Setting default index of segmented control.
        tipControl.selectedSegmentIndex = defaultTipPercentageIdx
        calculateTip( self )
        calculatePerPerson( self )
    }
    
    // MARK: Actions
    @IBAction func onTap( _ sender: Any ) {
        view.endEditing( true )
    }
    
    @IBAction func onMoreButtonPush( _ sender: Any ) {
        
        // Setting default value of slider.
        tipControlSlider.value = tipPercentages[ defaultTipPercentageIdx ] * 100
        
        tipControl.isHidden = true
        moreButton.isHidden = true
        
        tipControlSlider.isHidden = false
        backButton.isHidden = false
        
        calculateTip( self )
        calculatePerPerson( self )
        
    }
    
    @IBAction func onBackButtonPush( _ sender: Any ) {
        
        // Setting default index of segmented control.
        tipControl.selectedSegmentIndex = defaultTipPercentageIdx
        
        tipControl.isHidden = false
        moreButton.isHidden = false
        
        tipControlSlider.isHidden = true
        backButton.isHidden = true
        
        // Q: What is Any.self?
        // Q: What is the difference between delegate methods and actions?
        calculateTip( self )
        calculatePerPerson( self )
    }
    
    @IBAction func calculateTip( _ sender: Any ) {
        var bill: Float, tip: Float, total: Float
        
        bill = Float( billField.text! ) ?? 0
        
        // Tip based on segmented control.
        if ( tipControlSlider.isHidden ) {
            tipPercentLabel.text = String( format: "%d%%", Int( tipPercentages[ tipControl.selectedSegmentIndex ] * 100 ) )
            tip = bill * tipPercentages[ tipControl.selectedSegmentIndex ]
        }
        // Tip based on slide control.
        // Q: Is there a better way of doing this?
        else {
            tipPercentLabel.text = String( format: "%d%%", Int( tipControlSlider.value ) )
            tip = bill * ( tipControlSlider.value / 100.0 )
            
        }
        tipLabel.text = String( format: "%.2f", tip )

        total = bill + tip
        totalLabel.text = String( format: "%.2f", total )
    }
    
    @IBAction func calculatePerPerson(_ sender: Any) {
        // Q: This is a work-around to a problem that the calculatePerPerson needs to wait for calculateTip to update the total before using it. Is this good practice?
        calculateTip( self )
        
        var numPeople: Int
        var total: Float
        
        numPeople = Int( partyNumberField.text! ) ?? 0
        total = Float( totalLabel.text! ) ?? 0
        
        if ( numPeople == 0 ) {
            perPersonLabel.text = "0.00"
        }
        else {
             perPersonLabel.text = String( format: "%.2f", total / Float( numPeople ) )
        }
    }
}

