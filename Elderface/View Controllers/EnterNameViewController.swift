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
    var userElderface: Elderface! = nil
    
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
    
    // Prepare segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "textSize" {
            let controller = segue.destination as! TextSizeViewController
            controller.userElderface = userElderface
        }
    }
    
    // Continue button is pressed
    @IBAction func continueButtonPressed(_ sender: Any) {
        //TODO: Implement segue with Elderface object carried into TextSizeViewController
        userElderface = Elderface(user: (EnterNameTextField.text)!)
        performSegue(withIdentifier: "textSize", sender: self)
    }
    
    // Check text field value for validation
    func validateTextField() {
        if (EnterNameTextField.text == nil || EnterNameTextField.text == "") {
            ContinueButton.isEnabled = false
            continueButtonIsAnimating = false
            ContinueButton.backgroundColor = UIColor.white
            ContinueButton.stopAnimation()
            return
        } else {
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

