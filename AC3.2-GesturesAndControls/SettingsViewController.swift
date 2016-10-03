//
//  SettingsViewController.swift
//  AC3.2-GesturesAndControls
//
//  Created by Jason Gresh on 9/29/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    var correctColorComponents = (red: 0.0, green: 1.0, blue: 0.0)
    var incorrectColorComponents = (red: 1.0, green: 0.0, blue: 0.0)
    
    @IBOutlet weak var rightWrongSegmentedControl: UISegmentedControl!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var colorPreviewView: UIView!
    
    @IBOutlet weak var resetSwitch: UISwitch!
    @IBOutlet weak var scoreStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializePreviewColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Utility
    func buildCorrectColor() {
        let red = Double(redSlider.value)
        let green = Double (greenSlider.value)
        let blue = Double(blueSlider.value)

        if self.rightWrongSegmentedControl.selectedSegmentIndex == 0 {
            correctColorComponents = (red: red, green: green, blue: blue)
        }
        else {
            incorrectColorComponents = (red: red, green: green, blue: blue)
        }
        
        colorPreviewView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha:1.0)
    }

    func initializePreviewColor() {
        if self.rightWrongSegmentedControl.selectedSegmentIndex == 0 {
            colorPreviewView.backgroundColor = UIColor(red: CGFloat(correctColorComponents.red), green: CGFloat(correctColorComponents.green), blue: CGFloat(correctColorComponents.blue), alpha:1.0)
            
            self.redSlider.value = Float(correctColorComponents.red)
            self.greenSlider.value = Float(correctColorComponents.green)
            self.blueSlider.value = Float(correctColorComponents.blue)
        }
        else {
            colorPreviewView.backgroundColor = UIColor(red: CGFloat(incorrectColorComponents.red), green: CGFloat(incorrectColorComponents.green), blue: CGFloat(incorrectColorComponents.blue), alpha:1.0)
            
            self.redSlider.value = Float(incorrectColorComponents.red)
            self.greenSlider.value = Float(incorrectColorComponents.green)
            self.blueSlider.value = Float(incorrectColorComponents.blue)        }
    }
    
    // MARK: - Actions
    @IBAction func sliderChanged(_ sender: UISlider) {
        buildCorrectColor()
    }
    
    @IBAction func rightWrongChanged(_ sender: UISegmentedControl) {
        initializePreviewColor()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gvc = segue.destination as? GesturesViewController {
            gvc.correctColor = UIColor(red: CGFloat(correctColorComponents.red),
                                       green: CGFloat(correctColorComponents.green),
                                       blue: CGFloat(correctColorComponents.blue),
                                       alpha: 1.0)
            gvc.incorrectColor = UIColor(red: CGFloat(incorrectColorComponents.red),
                                       green: CGFloat(incorrectColorComponents.green),
                                       blue: CGFloat(incorrectColorComponents.blue),
                                       alpha: 1.0)
            gvc.resetOnIncorrect = self.resetSwitch.isOn
            gvc.scoreToWin = Int(self.scoreStepper.value)
        }
    }
}
