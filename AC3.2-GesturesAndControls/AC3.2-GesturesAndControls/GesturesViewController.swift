//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Eric Chang on 9/29/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
  // MARK: Properties
  @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
  @IBOutlet var swipeRightGestureRecognizer: UISwipeGestureRecognizer!
  @IBOutlet var swipeLeftGestureRecognizer: UISwipeGestureRecognizer!
  @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
  @IBOutlet var twoFingerTapGestureRecognizer: UITapGestureRecognizer!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  // MARK: Action
  @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
    print("Ouch!")
  }
  
  @IBAction func didSwipeRightView(_ sender: UISwipeGestureRecognizer) {
    print("Teehee~")
  }

  @IBAction func didSwipeLeftView(_ sender: UISwipeGestureRecognizer) {
    print("Heetee~")
  }

  @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
  }
  
  @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
  }
}
