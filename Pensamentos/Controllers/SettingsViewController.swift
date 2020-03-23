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
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatView()
    }
    
    func formatView() {
        autoRefresh.setOn(config.autoRefresh, animated: false)
        timeSlider.setValue(Float(config.timeInterval), animated: false)
        colorScheme.selectedSegmentIndex = config.colorScheme
        changeTimeInterval(with: config.timeInterval)
    }
    
    func changeTimeInterval(with value: Double) {
        timeInterval.text = "Mudar após \(Int(value)) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeInterval(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
}
