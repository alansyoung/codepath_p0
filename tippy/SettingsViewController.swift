//
//  SettingsViewController.swift
//  tippy
//
//  Created by Alan Young on 8/14/17.
//  Copyright © 2017 Alan Young. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    @IBOutlet weak var defaultTheme: UISegmentedControl!
    @IBOutlet weak var defaultCurrency: UIPickerView!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // load defaults, if not set, then initialize
        pickerData = ["Default", "$", "¥"]
        
        let defaults = UserDefaults.standard
        let currencySelection = defaults.object(forKey: "currencyCode") ?? "$"
        let tipSelection = defaults.integer(forKey: "tipIndex") ?? 1
        let themeSelection = defaults.integer(forKey: "themeIndex") ?? 0
        
        defaults.set(tipSelection, forKey: "tipIndex")
        defaults.set(themeSelection, forKey: "themeIndex")
        defaults.set(currencySelection, forKey: "currencyCode")
        defaults.synchronize()
        
        defaultTip.selectedSegmentIndex = tipSelection
        defaultTheme.selectedSegmentIndex = themeSelection
        //defaultCurrency.setValue(currencySelection, forUndefinedKey: <#T##String#>);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "tipIndex")
        defaults.synchronize()
        
    }
    
    @IBAction func setTheme(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTheme.selectedSegmentIndex, forKey: "themeIndex")
        defaults.synchronize()
        
    }
    
    @IBAction func setCurrency(_ sender: Any) {
        let defaults = UserDefaults.standard
        //defaults.set(defaultCurrency.selectedRow(inComponent: <#T##Int#>), forKey: "currencyCode")
        defaults.synchronize()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
