//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    //MARK: - External Object References
    let coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
    }
    
    //MARK: - Picker View Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //Number of columns in picker is 1 as only choosing currency
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //Number of rows in picker (currencies)
        return coinManager.currencyArray.count
        }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //Picks element from Picker
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //return coin price when row is selected
        
        let curr : String = coinManager.currencyArray[row]
        coinManager.getCoinPrice(curr)
    }

}

