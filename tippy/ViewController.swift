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
    
    @IBOutlet weak var bottomHalfView: UIView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
        self.billField.becomeFirstResponder()
        self.billField.keyboardType = UIKeyboardType.decimalPad
        
        totalTextLabel.isHidden = true
        totalLabel.isHidden = true
    
        let defaults = UserDefaults.standard
        let tipSelection = defaults.integer(forKey: "tipIndex") ?? 1
        tipControl.selectedSegmentIndex = tipSelection
        let billAmt = defaults.string(forKey: "billAmount")
        billField.text = billAmt
        
        if (billAmt != nil) {
            calculateTip(Any)
        }

        //self.view.sendSubview(toBack: bottomHalfView)
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tipIndex")
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        let currencyCode = defaults.object(forKey: "currencyCode") as! String
        
        defaults.set(billField.text! , forKey: "billAmount")
        defaults.synchronize()
        
        let separatedTip = NumberFormatter.localizedString(from: NSNumber(value: tip), number: NumberFormatter.Style.currency)
        //print(separatedTip)
        let separatedTotal = NumberFormatter.localizedString(from: NSNumber(value: total), number: NumberFormatter.Style.currency)
        
        tipLabel.text = separatedTip //currencyCode + String(format: "%.2f", tip)
        
        totalLabel.text = separatedTotal //currencyCode + String(format: "%.2f", total)
        
        
        UIView.animate(withDuration: 0.5) {
            self.totalTextLabel.isHidden = false
            self.totalLabel.isHidden = false
        }
        
    }

    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    func loadScreen() {
        let defaults = UserDefaults.standard
        let billAmount = defaults.double(forKey: "billAmount") ?? 0
        let tipSelection = defaults.integer(forKey: "tipIndex") ?? 1
        tipControl.selectedSegmentIndex = tipSelection
        
        let themeSelection = defaults.integer(forKey: "themeIndex") ?? 0
        //print("theme: " + String(themeSelection))
        if (themeSelection != 0) {
            //print("background was \(self.view.backgroundColor)")
            self.view.backgroundColor = UIColor.darkGray
            //print("background is now \(self.view.backgroundColor)")
            
            billTextLabel.textColor = UIColor.white
            tipTextLabel.textColor = UIColor.white
            totalTextLabel.textColor = UIColor.white
            tipControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: UIControlState.selected)
            
        } else {
            self.view.backgroundColor = UIColor.white
            billTextLabel.textColor = UIColor.blue
            tipTextLabel.textColor = UIColor.blue
            totalTextLabel.textColor = UIColor.blue
            tipControl.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blue], for: UIControlState.selected)
            
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        loadScreen()
        let displayLink = CADisplayLink(target: self, selector: #selector(loadScreen))
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)

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

