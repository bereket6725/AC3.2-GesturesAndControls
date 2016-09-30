//
//  GestureViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Ilmira Estil on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    var correctColorValue = 0.0

    enum ActionGesture: Int {
        case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe
    }
    
    var currentActionGesture: ActionGesture = .tap {
        willSet {
            self.updateLabel(for: newValue)
        }
    }
    
    //don't need the internal prefix
    internal var currentScore: Int = 0 {
        willSet {
            self.score.text = "Score: \(newValue)"
        }
    }
    
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapGesture: UITapGestureRecognizer!
    @IBOutlet var twoFingerGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var prompt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureRecognizer.require(toFail: doubleTapGesture)
        self.currentActionGesture = self.pickRandomActionGesture()
    }
    
    // MARK: - Actions
    
    /* more refractoring with switch case
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        print("tapped me!")
        self.isCorrect(self.currentActionGesture == .tap)
        
        //REFRACTIRUBG
        //        if self.currentActionGesture == .tap {
        //            self.view.backgroundColor = UIColor.green
        //            currentScore += 1
        //        }
        //        else {
        //            self.currentActionGesture = pickRandomActionGesture()
        //            self.view.backgroundColor = UIColor.red
        //            currentScore = 0
        //        }
        //        self.currentActionGesture = pickRandomActionGesture()
    }
    
    @IBAction func swipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        print("swiped right")
        self.isCorrect(self.currentActionGesture == .rightSwipe)
    }
    
    @IBAction func leftSewipeGestureRecognizer(_ sender: AnyObject) {
        print("swiped left")
        self.isCorrect(self.currentActionGesture == .leftSwipe)
    }
    
    @IBAction func doubleTapGesture(_ sender: UITapGestureRecognizer) {
        print("tapped that")
        self.isCorrect(self.currentActionGesture == .doubleTap)
    }
    
    @IBAction func twoFingerGesture(_ sender: UITapGestureRecognizer) {
        print("tapped with two fingers")
        self.isCorrect(self.currentActionGesture == .twoFingerTap)
    }
    */
    
    //?? -> identifying other types of gestures, taps vs. swipes
    @IBAction func didPerformGesture(_ sender: UIGestureRecognizer) {
        if let tapGesture: UITapGestureRecognizer = sender as? UITapGestureRecognizer {
            switch (tapGesture.numberOfTapsRequired, tapGesture.numberOfTouchesRequired) {
            case (1, 1):
                print("Yas was tapped")
                self.isCorrect(self.currentActionGesture == .tap)
                
            case (2, 1):
                print("Double tap")
                self.isCorrect(self.currentActionGesture == .doubleTap)
                
            case (1, 2):
                print("two finger")
                self.isCorrect(self.currentActionGesture == .twoFingerTap)
                
            case (2, 2):
                print("tap type was wrong")
                self.isCorrect(false)
            default:
                print("wrong")
                break
            }
        }
        
        if let swipeGesture: UISwipeGestureRecognizer = sender as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                print("left swipe")
                self.isCorrect(self.currentActionGesture == .leftSwipe)
                
            case UISwipeGestureRecognizerDirection.right:
                print("right swipe")
                self.isCorrect(self.currentActionGesture == .rightSwipe)
                
            default:
                print("was not left/right")
                break
            }
        }
    }
    
    //MARK: Utility Functions
    
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
        
        self.prompt.text = updateText
    }
    
    // a way to randomly get a gesture
    func pickRandomActionGesture() -> ActionGesture {
        let randomInt = Int(arc4random_uniform(5)) // number between 0-4
        return ActionGesture.init(rawValue: randomInt) ?? .tap
    }
    
    func update() {
        self.currentActionGesture = pickRandomActionGesture()
    }
    
    func isCorrect (_ correct: Bool) {
        update()
        
        if correct {
            //fix this to change color gradually
            self.view.backgroundColor = UIColor(hue: CGFloat(Float(self.correctColorValue)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
            self.currentScore += 1
        }
        else {
            self.view.backgroundColor = UIColor.red
            self.currentScore = 0
        }
    }
}
