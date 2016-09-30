//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Ana Ma on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {

    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var twoFingerTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Why we put it in view did load
        tapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        print("I was tapped")
    }

    @IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
        print("Swipped right")
    }
   
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        print("Swipped left")
    }
    @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
        print("Did double tap view")
    }
    
    @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
        print("Did two finger tap view")
    }
    

}
