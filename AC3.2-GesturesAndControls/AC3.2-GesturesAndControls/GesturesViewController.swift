//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Tom Seymour on 9/29/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    
    var correctColorValue = 0.0
    
    enum ActionGesture: Int {
        case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe, upSwipe, downSwipe
    }
    
    var currentActionGesture: ActionGesture = .tap {
        willSet {
            self.updateLabel(for: newValue)
        }
    }
    var currentScore = 0 {
        willSet {
            self.scoreCard.text = "Score: \(newValue)"
        }
    }
    
    
    @IBOutlet var twoFingerTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
 
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var swipeLeftGestRec: UISwipeGestureRecognizer!
    @IBOutlet var swipeRightGestRec: UISwipeGestureRecognizer!
    @IBOutlet var swipeUpGestRec: UISwipeGestureRecognizer!
    @IBOutlet var swipeDownGestRec: UISwipeGestureRecognizer!
    
    @IBOutlet weak var actionToPerformLabel: UILabel!

    
    @IBOutlet weak var scoreCard: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
        self.currentActionGesture = self.pickRandomActionGesture()
    }

 

    // update our label for each gesture
    func updateLabel(for actionGes: ActionGesture) {
        var updateText: String = ""
        switch actionGes {
        case .tap: updateText = "tap"
        case .doubleTap: updateText = "double tap"
        case .twoFingerTap: updateText = "two finger tap"
        case .leftSwipe: updateText = "swift left"
        case .rightSwipe: updateText = "swipe right"
        case .upSwipe: updateText = "swipe up"
        case .downSwipe: updateText = "swipe down"
        }
        
        self.actionToPerformLabel.text = updateText
    }
    
    // a way to randomly get a gesture
    func pickRandomActionGesture() -> ActionGesture {
        let randomInt = Int(arc4random_uniform(7)) // number between 0-6
        return ActionGesture.init(rawValue: randomInt) ?? .tap
    }
    
    func isCorrect(_ correct: Bool) {
        self.currentActionGesture = pickRandomActionGesture()
        if correct {
            self.view.backgroundColor = .green
            currentScore += 1
        } else {
            self.view.backgroundColor = .red
            currentScore = 0
        }
    }
    
    @IBAction func didPerformGesture(_ sender: UIGestureRecognizer) {
        if let tapGesture: UITapGestureRecognizer = sender as? UITapGestureRecognizer {
            switch (tapGesture.numberOfTapsRequired, tapGesture.numberOfTouchesRequired) {
            case (1, 1):
                self.isCorrect(self.currentActionGesture == .tap)
            case (2, 1):
                self.isCorrect(self.currentActionGesture == .doubleTap)
            case (1, 2):
                self.isCorrect(self.currentActionGesture == .twoFingerTap)
            default:
                break
            }
        }
        if let swipeGesture: UISwipeGestureRecognizer = sender as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                self.isCorrect(self.currentActionGesture == .leftSwipe)
            case UISwipeGestureRecognizerDirection.right:
                self.isCorrect(self.currentActionGesture == .rightSwipe)
            case UISwipeGestureRecognizerDirection.up:
                self.isCorrect(self.currentActionGesture == .upSwipe)
            case UISwipeGestureRecognizerDirection.down:
                self.isCorrect(self.currentActionGesture == .downSwipe)
            default:
                break
            }
        }
    }
}

