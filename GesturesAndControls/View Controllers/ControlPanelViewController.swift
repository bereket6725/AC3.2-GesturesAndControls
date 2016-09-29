//
//  ControlPanelViewController.swift
//  GesturesAndControls
//
//  Created by Jason Gresh on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ControlPanelViewController: UIViewController {
    // we're going to change this based on the slider
    // it will drive the color of the background
    var successColor: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func successColorSlider(_ sender: UISlider) {
        print(sender.value)
        self.successColor = sender.value
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gvc = segue.destination as? GestureViewController {
            gvc.backgroundColor = self.successColor
        }
    }
}
