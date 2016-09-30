//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Sabrina Ip on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    enum ActionGesture: Int {
        case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe
    }
    
    var currentActionGesture: ActionGesture = .tap {
        willSet {
            self.updateLabel(for: newValue)
        }
    }
    
    @IBOutlet weak var actionToPerformLabel: UILabel!
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var twoFingerTapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
        self.currentActionGesture = self.pickRandomActionGesture()
    }
    
    // MARK: - Utility
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
        print("swiped right")
        if self.currentActionGesture == .rightSwipe {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        print("swiped left")
        if self.currentActionGesture == .leftSwipe {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func doubleTapped(_ sender: UITapGestureRecognizer) {
        print("double tapped")
        if self.currentActionGesture == .doubleTap {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func twoFingerTapped(_ sender: UITapGestureRecognizer) {
        print("Two finger tapped")
        if self.currentActionGesture == .twoFingerTap {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        self.currentActionGesture = pickRandomActionGesture()
    }
}
