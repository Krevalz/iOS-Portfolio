//
//  ViewController.swift
//  megaPill
//
//  Created by Joshua Ramos on 7/30/17.
//  Copyright © 2017 Krevalent. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var stateSelectionPicker: UIPickerView!
    @IBOutlet weak var stateSelectionButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var buyNowButton: UIButton!
    
    let stateNames = ["Hawaii", "California", "New York", "Nevada", "Washington"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stateSelectionPicker.dataSource = self
        stateSelectionPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateButtonPressed(_ sender: UIButton) {
        countryLabel.isHidden = true
        countryField.isHidden = true
        zipcodeLabel.isHidden = true
        zipcodeField.isHidden = true
        buyNowButton.isHidden = true
        stateSelectionPicker.isHidden = false
    }

    @IBAction func buyNowButtonPressed(_ sender: UIButton) {
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stateNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stateNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateSelectionButton.setTitle(stateNames[row], for: UIControlState.normal)
        stateSelectionPicker.isHidden = true
        countryLabel.isHidden = false
        countryField.isHidden = false
        zipcodeLabel.isHidden = false
        zipcodeField.isHidden = false
        buyNowButton.isHidden = false
    }
    
    
}

