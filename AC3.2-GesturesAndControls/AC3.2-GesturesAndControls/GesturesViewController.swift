//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Eric Chang on 9/29/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
  
  var correctColorValue = 0.0
  
  enum ActionGesture: Int {
    case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe
  }
  
  internal var currentScore: Int = 0 {
    willSet {
      self.scoreLabel.text = "Sore: \(newValue)"
    }
  }
  // MARK: - Properties
  
  @IBOutlet weak var actionToPerformLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  
  @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
  @IBOutlet var swipeRightGestureRecognizer: UISwipeGestureRecognizer!
  @IBOutlet var swipeLeftGestureRecognizer: UISwipeGestureRecognizer!
  @IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
  @IBOutlet var twoFingerTapGestureRecognizer: UITapGestureRecognizer!
  
  var currentActionGesture: ActionGesture = .tap {
    willSet {
      self.updateLabel(for: newValue)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
    case .leftSwipe: updateText = "swipe left"
    case .rightSwipe: updateText = "swipe right"
    }
    
    self.actionToPerformLabel.text = updateText
  }
  
  // a way to randomly get a gesture
  func pickRandomActionGesture() -> ActionGesture {
    let randomInt = Int(arc4random_uniform(5)) // number between 0-4
    return ActionGesture.init(rawValue: randomInt) ?? .tap
  }
  
  
  
  // MARK: - Action
  @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
    print("Ouch!")
    self.isCorrect(self.currentActionGesture == .tap)
  }
  
  @IBAction func didSwipeRightView(_ sender: UISwipeGestureRecognizer) {
    print("Teehee~")
    self.isCorrect(self.currentActionGesture == .rightSwipe)
  }
  
  @IBAction func didSwipeLeftView(_ sender: UISwipeGestureRecognizer) {
    print("Heetee~")
    self.isCorrect(self.currentActionGesture == .leftSwipe)
  }
  
  @IBAction func didDoubleTapView(_ sender: UITapGestureRecognizer) {
    print("Taptap~")
    self.isCorrect(self.currentActionGesture == .doubleTap)
  }
  
  @IBAction func didTwoFingerTapView(_ sender: UITapGestureRecognizer) {
    print("DoubleRainbow!")
    self.isCorrect(self.currentActionGesture == .twoFingerTap)
  }
  
  @IBAction func didPerformGesture(_ sender: UIGestureRecognizer) {
    if let tapGesture: UITapGestureRecognizer = sender as? UITapGestureRecognizer {
      switch (tapGesture.numberOfTapsRequired, tapGesture.numberOfTouchesRequired) {
        
      case (1, 1):
        print("heck yea I was tapped")
        self.isCorrect(self.currentActionGesture == .tap)
        
      case (2, 1):
        print("Double Tap!")
        self.isCorrect(self.currentActionGesture == .doubleTap)
        
      case (1, 2):
        print("Two Finger Tap!")
        self.isCorrect(self.currentActionGesture == .twoFingerTap)
        
      default:
        print("Tap type was wrong!")
        self.isCorrect(false)
      }
    }
    
    if let swipeGesture: UISwipeGestureRecognizer = sender as? UISwipeGestureRecognizer {
      switch swipeGesture.direction {
        
      case UISwipeGestureRecognizerDirection.left:
        print("swipy swipey left")
        
      case UISwipeGestureRecognizerDirection.right:
        print("right right right")
        
      default:
        print("wrong :c")
      }
    }
  }
  
  func isCorrect(_ correct: Bool){
    self.currentActionGesture = pickRandomActionGesture()
    if correct {
      //self.view.backgroundColor = .green
      self.currentScore += 1
    } else {
      //self.view.backgroundColor = .red
      currentScore = 0
    }
  }
  
}
