//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Sabrina Ip on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        print("I was tapped")
    }

    @IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
        print("swiped right")
    }
    
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        print("swiped left")
    }
}
