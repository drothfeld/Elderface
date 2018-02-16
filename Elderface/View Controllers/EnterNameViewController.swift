//
//  EnterNameViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/15/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class EnterNameViewController: UIViewController {
    // UI Elements
    @IBOutlet weak var EnterNameTextField: UITextField!
    @IBOutlet weak var ContinueButton: UIButton!
    
    // Controller Elements
    var continueButtonIsAnimating: Bool = false
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        playEnterNameAudio()
        validateTextField()
    }
    
    // Play enter name audio file
    func playEnterNameAudio() {
        let path = Bundle.main.path(forResource: "enter_name.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Check for text field change
    @IBAction func textFieldChanged(_ sender: Any) {
        validateTextField()
    }
    
    // Continue button is pressed
    @IBAction func continueButtonPressed(_ sender: Any) {
        //TODO: Implement segue with Elderface object carried over
    }
    
    // Check text field value for validation
    func validateTextField() {
        NSLog(String(continueButtonIsAnimating))
        if (EnterNameTextField.text == nil || EnterNameTextField.text == "") {
            NSLog("Text Field empty")
            ContinueButton.isEnabled = false
            continueButtonIsAnimating = false
            ContinueButton.backgroundColor = UIColor.white
            ContinueButton.stopAnimation()
            return
        } else {
            NSLog("Text Field NOT Empty")
            if (continueButtonIsAnimating == false) {
                ContinueButton.backgroundColor = UIColor.white
                continueButtonIsAnimating = true
                ContinueButton.startAnimation()
                ContinueButton.isEnabled = true
                
            }
            return
        }
    }
    
}

// UIButton extension to enable validation animation
extension UIButton {
    // Start animation
    func startAnimation() {
        UIView.animate(withDuration: 1.0,
                       delay:0.0,
                       options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: {self.alpha = 0.75; self.backgroundColor = UIColor.green },
                       completion: nil)
    }
    // Stop animation
    func stopAnimation() {
        layer.removeAllAnimations()
        self.alpha = 0.5
        backgroundColor = UIColor.red
    }
}

