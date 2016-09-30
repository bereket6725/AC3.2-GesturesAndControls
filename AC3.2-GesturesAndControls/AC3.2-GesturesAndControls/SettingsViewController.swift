//
//  SettingsViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Ilmira Estil on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    //MARK: Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gvc = segue.destination as? GestureViewController {
            gvc.correctColorValue = Double(slider.value)
        }
    }
    //MARK: Functions
    
//    @IBAction func slider(_ sender: UISlider) {
//        if Int(sender.value) == 4  {
//            self.view.backgroundColor = UIColor.green
//        }
//    }
    
    
    
    
    
}
