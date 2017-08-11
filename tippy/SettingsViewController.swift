//
//  SettingsViewController.swift
//  tippy
//
//  Created by Alan Young on 8/7/17.
//  Copyright © 2017 Alan Young. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    
    @IBOutlet weak var defaultCurrency: UIPickerView!
    
    @IBOutlet weak var defaultTheme: UISegmentedControl!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Connect data:
        self.defaultCurrency.delegate = self
        self.defaultCurrency.dataSource = self
        
        pickerData = ["$", "€", "¥", "£"]
        
        
        let defaults = UserDefaults.standard // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
        let defaultTipVal = defaults.object(forKey: "defaultTip")
        let defaultThemeVal = defaults.object(forKey: "defaultTheme")
        let defaultCurrencyVal = defaults.object(forKey: "defaultCurrency")
        
        if (defaultTipVal == nil) {
                // index value 1 -> .20
                defaults.set(1, forKey: "defaultTip")
        }
        
        if (defaultCurrencyVal == nil) {
            defaults.set(1, forKey: "defaultCurrency")
        }
        
        if (defaultThemeVal == nil) {
            defaults.set(1, forKey: "defaultTheme")
        }
        
        defaults.synchronize()
        
        defaultTip.selectedSegmentIndex = defaults.object(forKey: "defaultTip") as! Int
        let currentThemeSelection = defaults.object(forKey: "defaultTheme")
        print("theme ")
        print (currentThemeSelection)
        defaultTheme.selectedSegmentIndex = defaults.object(forKey: "defaultTip") as! Int
        let currentySelection = defaults.object(forKey: "defaultCurrency")
        defaultCurrency.selectRow(0, inComponent: 0 , animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    
    
    @IBAction func setTheme(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: "defaultTheme")
        defaults.synchronize()
    }
    
    @IBAction func setTip(_ sender: Any) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let defaults = UserDefaults.standard
        defaults.set(tipPercentages[defaultTip.selectedSegmentIndex], forKey: "defaultTip")
        defaults.synchronize()
    }
    

    
    
    /*
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation be
     
     fore navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
