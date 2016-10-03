//
//  SettingsViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Jason Gresh on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var switchOn: Bool = true
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var blue: UISlider!
    @IBOutlet weak var green: UISlider!
    
    @IBOutlet weak var previewColor: UIView!
    @IBOutlet weak var resetScore: UISwitch!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkState(_ sender: UISwitch) -> Bool? {
        if resetScore.isOn {
            switchOn = true
            return true
            
        }
        if resetScore.isOn == false {
            switchOn = false
            return false
        }
        return nil
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gvc = segue.destination as? GesturesViewController {
            gvc.redValue = Double(red.value)
            gvc.blueValue = Double(blue.value)
            gvc.greenValue = Double(green.value)
            self.previewColor.backgroundColor = UIColor(red: CGFloat(self.red.value), green: CGFloat(self.green.value), blue: CGFloat(self.blue.value), alpha: 1.0)
            gvc.switchOn = checkState(resetScore)!
        }
    }
}
