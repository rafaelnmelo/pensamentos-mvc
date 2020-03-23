//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Rafael Melo on 23/03/20.
//  Copyright © 2020 Rafael Melo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var autoRefresh: UISwitch!
    @IBOutlet weak var colorScheme: UISegmentedControl!
    @IBOutlet weak var timeInterval: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
    }
    @IBAction func changeTimeInterval(_ sender: UISlider) {
    }
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
    }
    
}
