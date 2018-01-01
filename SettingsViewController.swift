//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Andy Duong on 12/29/17.
//  Copyright © 2017 Andy Duong. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func settingsDidFinish( controller: SettingsViewController, defaultIdx: Int )
}

class SettingsViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var defaultTipPercentageIdx: Int!
    var delegate: SettingsViewControllerDelegate?
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultTipPercentageIdx = 1
        tipControl.selectedSegmentIndex = defaultTipPercentageIdx
        
        // Do not set delegate to nil here because the delegate was already set in the prepare function of the parent vc.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear( _ animated: Bool ) {
        super.viewWillDisappear( animated )
        delegate?.settingsDidFinish( controller: self, defaultIdx: defaultTipPercentageIdx )
    }

    // MARK: Actions
    @IBAction func setDefaultTipPercentageIdx( _ sender: Any ) {
        defaultTipPercentageIdx = tipControl.selectedSegmentIndex
    }
}
