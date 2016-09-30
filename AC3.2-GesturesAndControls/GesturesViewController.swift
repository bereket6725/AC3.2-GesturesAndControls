//
//  GesturesViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Victor Zhong on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class GesturesViewController: UIViewController {
	
	var correctColorValue = 0.0
	
	enum ActionGesture: Int {
		case tap, doubleTap, twoFingerTap, leftSwipe, rightSwipe
	}
	
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
	
	// label to display current gesture to perform
	@IBOutlet weak var actionToPerformLabel: UILabel!
	
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
		return ActionGesture(rawValue: randomInt) ?? .tap
	}
	
	@IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
	@IBOutlet var rightSwipeGestureRecognizer: UISwipeGestureRecognizer!
	@IBOutlet var leftSwipeGestureRecognizer: UISwipeGestureRecognizer!
	@IBOutlet var doubleTapGestureRecognizer: UITapGestureRecognizer!
	@IBOutlet var twoFingerTapGestureRecognizer: UITapGestureRecognizer!
	@IBOutlet weak var scoreLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		tapGestureRecognizer.require(toFail: doubleTapGestureRecognizer)
		self.currentActionGesture = self.pickRandomActionGesture()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func didTapView(_ sender: UITapGestureRecognizer) {
		self.isCorrect(self.currentActionGesture == .tap)
		//		if self.currentActionGesture == .tap {
		//			self.view.backgroundColor = .green
		//			currentScore += 1
		//		} else {
		//			self.view.backgroundColor = .red
		//		}
		//		self.currentActionGesture = pickRandomActionGesture()
	}
	
	
	@IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
		self.isCorrect(self.currentActionGesture == .rightSwipe)
	}
	
	@IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
		self.isCorrect(self.currentActionGesture == .leftSwipe)
	}
	
	@IBAction func doubleTap(_ sender: UITapGestureRecognizer) {
		self.isCorrect(self.currentActionGesture == .doubleTap)
	}
	
	@IBAction func twoFingerTap(_ sender: UITapGestureRecognizer) {
		self.isCorrect(self.currentActionGesture == .twoFingerTap)
	}
	
	@IBAction func didPerformGesutre(_ sender: UIGestureRecognizer) {
		if let tapGesture: UITapGestureRecognizer = sender as? UITapGestureRecognizer {
			switch (tapGesture.numberOfTapsRequired, tapGesture.numberOfTouchesRequired) {
			case (1, 1):
				print("Heck yeah I was tapped")
				self.isCorrect(self.currentActionGesture == .tap)
			case (2, 1):
				print("double tap!")
				self.isCorrect(self.currentActionGesture == .doubleTap)
			case (1, 2):
				print("Two finger tap")
				self.isCorrect(self.currentActionGesture == .twoFingerTap)
			default:
				print("Tap type was wrong!")
				self.isCorrect(false)
			}
		}
		
		if let swipeGesture: UISwipeGestureRecognizer = sender as? UISwipeGestureRecognizer {
			switch (swipeGesture.direction) {
			case UISwipeGestureRecognizerDirection.left:
				print("Swiped left")
				self.isCorrect(self.currentActionGesture == .leftSwipe)
			case UISwipeGestureRecognizerDirection.right:
				print("Swiped right")
				self.isCorrect(self.currentActionGesture == .rightSwipe)
			default:
				print("Swipe type was wrong!")
				self.isCorrect(false)
			}
		}
	}

//	func isCorrect(_ correct: Bool){
//		self.currentActionGesture = pickRandomActionGesture()
//		if correct {
//			self.view.backgroundColor = .green
//			self.currentScore += 1
//		} else {
//			self.view.backgroundColor = .red
//			currentScore = 0
//		}
//	}

	func isCorrect(_ correct: Bool) {
		self.currentActionGesture = pickRandomActionGesture()
		
		if correct {
			self.view.backgroundColor = UIColor(hue: CGFloat(Float(self.correctColorValue)), saturation: 1.0, brightness: 1.0, alpha: 1.0)
			self.currentScore += 1
		}
		else {
			self.view.backgroundColor = UIColor.red
			self.currentScore = 0
		}
	}
}
