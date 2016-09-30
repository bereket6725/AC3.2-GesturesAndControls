//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Ana Ma on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    enum ActionGesture: Int {
        case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe
    }
    
    //every time tapped, will set and call a function called update label
    var currentActionGesture: ActionGesture = .tap {
        willSet {
            self.updateLabel(for: newValue)
        }
    }
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var twoFingerTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
    
    // label to display current gesture to perform
    @IBOutlet weak var actionToPerformLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Why we put it in view did load
        tapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
        self.currentActionGesture = self.pickRandomActionGesture()
    }
    
    //MARK: - Utility
    // update our label for each gesture
    func updateLabel(for actionGes: ActionGesture) {
        var updateText: String = ""
        switch actionGes {
        case .tap: updateText = "tap"
        case .doubleTap: updateText = "double tap"
        case .twoFingerTap: updateText = "two finger tap"
        case .leftSwipe: updateText = "swift left"
        case .rightSwipe: updateText = "swipe right"
        }
        
        self.actionToPerformLabel.text = updateText
    }
    
    // a way to randomly get a gesture
    func pickRandomActionGesture() -> ActionGesture {
        let randomInt = Int(arc4random_uniform(5)) // number between 0-4
        return ActionGesture.init(rawValue: randomInt) ?? .tap
    }
    
    //MARK: - Actions
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        print("I was tapped")
        if self.currentActionGesture == .tap {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
        print("Swipped right")
        if self.currentActionGesture == .rightSwipe{
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        print("Swipped left")
        if self.currentActionGesture == .leftSwipe {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
    @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
        print("Did double tap view")
        if self.currentActionGesture == .doubleTap {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
        print("Did two finger tap view")
        if self.currentActionGesture == .twoFingerTap {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
    
    
    
}
