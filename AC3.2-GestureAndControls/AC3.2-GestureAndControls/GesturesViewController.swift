//
//  GesturesViewController.swift
//  AC3.2-GestureAndControls
//
//  Created by Annie Tung on 9/29/16.
//  Copyright © 2016 Annie Tung. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
    
    var correctColorValue = 0.0
    
    enum ActionGesture: Int {
        case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe
    }
    
    var currentActionGesture: ActionGesture = .tap { //everytime this var is changed it will call the helper function updateLabel
        willSet {
            self.updateLabel(for: newValue)
        }
    }

    var currentScore: Int = 0 {
        willSet {
            self.scoreLabel.text = "Score: \(newValue)"
        }
    }

    @IBOutlet var twoFingerGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var tapGestureRecoginzer: UITapGestureRecognizer!
    @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet weak var actionToPerformLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureRecoginzer.require(toFail: doubleTapGestureRecognizer) //It looks for double tap first, if double tap fails then do tap gesture
        self.currentActionGesture = self.pickRandomActionGesture() //setting up the game, save current action gesture as the random gesture
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
        let randomInt = Int(arc4random_uniform(5)) // number between 0-4 from raw value in our enum
        return ActionGesture (rawValue: randomInt) ?? .tap
    }

    //MARK: - Actions
//    @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
//        print("Did double tap view")
//        self.isCorrectGesture(self.currentActionGesture == .doubleTap)
//    }
//    
//    @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
//        print("Did two finger tap view")
//        self.isCorrectGesture(self.currentActionGesture == .twoFingerTap)
//    }
//    
//    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
//        print("I was tapped")
//        self.isCorrectGesture(self.currentActionGesture == .tap)
//        
//    }
//    
//    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
//        print("Swiped left")
//        self.isCorrectGesture(self.currentActionGesture == .leftSwipe)
//    }
//    
//    @IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
//        print("Swiped Right")
//        self.isCorrectGesture(self.currentActionGesture == .rightSwipe)
//    }
    
    //check for taps/swipes
    @IBAction func didPerformGesture(_ sender: UIGestureRecognizer) {
        if let tapGesture: UITapGestureRecognizer = sender as? UITapGestureRecognizer { //operation returns an options, may or may not suceed
            switch (tapGesture.numberOfTapsRequired, tapGesture.numberOfTouchesRequired) { //tap gesture recoginzer as tuples
            case (1,1):
                print("Oh yea I was tapped")
                self.isCorrectGesture(self.currentActionGesture == .tap)
            case (2,1):
                print("double tap!")
                self.isCorrectGesture(self.currentActionGesture == .doubleTap)
            case (1,2):
                print("two finger tap!")
                self.isCorrectGesture(self.currentActionGesture == .twoFingerTap)
            default:
                print("tap type was wrong!")
                break
            }
        }
        //if not we will cast it as a swipe
        if let swipeGesture: UISwipeGestureRecognizer = sender as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                print("did swipe left")
                self.isCorrectGesture(currentActionGesture == .leftSwipe)
            case UISwipeGestureRecognizerDirection.right:
                print("did swipe right")
                self.isCorrectGesture(currentActionGesture == .rightSwipe)
            default:
                print("swipe direction was wrong!")
                self.isCorrectGesture(false) //OR BREAK
            }
        }
    }

    func isCorrectGesture(_ correct: Bool) {
        self.currentActionGesture = pickRandomActionGesture()
        
        if correct {
            self.view.backgroundColor = .green
            self.currentScore += 1
        } else {
            self.view.backgroundColor = .red
            self.currentScore -= 1
        }
    }
    
}
