//
//  ViewController.swift
//  tippy
//
//  Created by Alan Young on 8/7/17.
//  Copyright © 2017 Alan Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UITextField!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UITextField!
    
    @IBOutlet weak var billTextLabel: UILabel!
    @IBOutlet weak var tipTextLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = UserDefaults.standard
        let tipSelection = defaults.integer(forKey: "tipIndex") ?? 1
        let themeSelection = defaults.integer(forKey: "themeIndex") ?? 0
        
        if (themeSelection != 0) {
            self.view.backgroundColor = UIColor.darkGray
            billTextLabel.textColor = UIColor.white
            tipTextLabel.textColor = UIColor.white
            totalTextLabel.textColor = UIColor.white
        } else {
            self.view.backgroundColor = UIColor.white
            billTextLabel.textColor = UIColor.black
            tipTextLabel.textColor = UIColor.black
            totalTextLabel.textColor = UIColor.black
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
}

