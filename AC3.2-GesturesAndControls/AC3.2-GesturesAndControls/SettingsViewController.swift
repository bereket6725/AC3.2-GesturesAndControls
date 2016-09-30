//
//  SettingsViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Eric Chang on 9/29/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var colorSlider: UISlider!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

          // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let gvc = segue.destination as? GesturesViewController {
        gvc.correctColorValue = Double(colorSlider.value)
      }
    }
  
}
