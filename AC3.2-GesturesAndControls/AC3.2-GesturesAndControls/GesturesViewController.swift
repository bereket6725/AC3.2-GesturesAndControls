//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Ana Ma on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    var correctColorValue = 0.0
    
    enum ActionGesture: Int { //make it to have a raw value
        case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe
    }
    
    //every time tapped, will set and call a function called update label
    var currentActionGesture: ActionGesture = .tap {
        willSet {
            self.updateLabel(for: newValue)
        }
    }
    
    var currentScore: Int = 0 {
        willSet {
            self.scoreLabel.text = "Score: \(newValue)"
        }
    }
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var twoFingerTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
    
    // label to display current gesture to perform
    @IBOutlet weak var actionToPerformLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
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
    
    func isCorrect (_ correct: Bool) {
        self.currentActionGesture = pickRandomActionGesture()
        
        if correct {
            self.view.backgroundColor = UIColor.green
            currentScore += 1
        } else {
            self.view.backgroundColor = UIColor.red
            currentScore = 0
        }
        
    }
    
    //MARK: - Actions
    //put everything in one action
    @IBAction func didPerformGesture(_ sender: UIGestureRecognizer) {
        if let tapGesture: UITapGestureRecognizer = sender as?
            UITapGestureRecognizer{
            switch (tapGesture.numberOfTapsRequired, tapGesture.numberOfTouchesRequired) {
            case (1, 1) :
                print("Heck year I was tapped")
                self.isCorrect(self.currentActionGesture == .tap)
            case (2, 1) :
                print("double tap!")
                self.isCorrect(self.currentActionGesture == .doubleTap)
            case (1, 2) :
                print("two finger tap!")
                self.isCorrect(self.currentActionGesture == .twoFingerTap)
            default:
                print("tap type was wrong!")
                self.isCorrect(false)
            }
        }
        if let swipeGesture: UISwipeGestureRecognizer = sender as?
            UISwipeGestureRecognizer{
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.left:
                print("did swipe left")
                self.isCorrect(self.currentActionGesture == .leftSwipe)
            case UISwipeGestureRecognizerDirection.right:
                print("did swipe right")
                self.isCorrect(self.currentActionGesture == .rightSwipe)
            default:
                print("Swipe type was wrong!")
                self.isCorrect(false)
            }
        }
        
    }
    /*
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        print("I was tapped")
        self.isCorrect(self.currentActionGesture == .tap)
//        if self.currentActionGesture == .tap {
//            self.view.backgroundColor = UIColor.green
//            currentScore += 1
//        } else {
//            self.view.backgroundColor = UIColor.red
//            currentScore = 0
//        }
//        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
        print("Swipped right")
        self.isCorrect(self.currentActionGesture == .rightSwipe)
//        if self.currentActionGesture == .rightSwipe{
//            self.view.backgroundColor = UIColor.green
//            currentScore += 1
//        } else {
//            self.view.backgroundColor = UIColor.red
//            currentScore = 0
//        }
//        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        print("Swipped left")
        self.isCorrect(self.currentActionGesture == .leftSwipe)
//        if self.currentActionGesture == .leftSwipe {
//            self.view.backgroundColor = UIColor.green
//            currentScore += 1
//        } else {
//            self.view.backgroundColor = UIColor.red
//            currentScore = 0
//        }
//        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
        print("Did double tap view")
        self.isCorrect(self.currentActionGesture == .doubleTap)
//        if self.currentActionGesture == .doubleTap {
//            self.view.backgroundColor = UIColor.green
//            currentScore += 1
//        } else {
//            self.view.backgroundColor = UIColor.red
//            currentScore = 0
//        }
//        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
        print("Did two finger tap view")
        self.isCorrect(self.currentActionGesture == .twoFingerTap)
//        if self.currentActionGesture == .twoFingerTap {
//            self.view.backgroundColor = UIColor.green
//            currentScore += 1
//        } else {
//            self.view.backgroundColor = UIColor.red
//            currentScore = 0
//        }
//        self.currentActionGesture = pickRandomActionGesture()
    }
 */
    
}
