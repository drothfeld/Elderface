//
//  ButtonColorViewController.swift
//  Elderface
//
//  Created by Dylan Rothfeld on 2/17/18.
//  Copyright © 2018 Dylan Rothfeld. All rights reserved.
//

import UIKit
import AVFoundation

class ButtonColorViewController: UIViewController {
    // UI Elements
    @IBOutlet weak var menuColorLayer: UIImageView!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var magentaButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var grayButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    
    // Controller Elements
    var userElderface: Elderface! = nil
    
    // Run on load
    override func viewDidLoad() {
        super.viewDidLoad()
        elderfaceSetup()
        playButtonColorAudio()
    }
    
    // Play enter name audio file
    func playButtonColorAudio() {
        let path = Bundle.main.path(forResource: "button_color.wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch let error {
            NSLog(error.localizedDescription)
        }
    }
    
    // Replay audio instructions
    @IBAction func playAudioAgain(_ sender: Any) {
        playButtonColorAudio()
    }
    
    // Setup interface based on elderface values
    func elderfaceSetup() {
        menuColorLayer.backgroundColor = userElderface.menuColor
        if (userElderface.menuColor == UIColor.black) {
            blackButton.isHidden = true
        }
        if (userElderface.menuColor == UIColor.red) {
            redButton.isHidden = true
            magentaButton.isHidden = true
        }
        if (userElderface.menuColor == UIColor.blue) {
            blackButton.isHidden = true
            purpleButton.isHidden = true
        }
        if (userElderface.menuColor == UIColor.green) {
            greenButton.isHidden = true
        }
        if (userElderface.menuColor == UIColor.magenta) {
            magentaButton.isHidden = true
            redButton.isHidden = true
        }
        if (userElderface.menuColor == UIColor.purple) {
            purpleButton.isHidden = true
        }
        if (userElderface.menuColor == UIColor.white) {
            whiteButton.isHidden = true
        }
    }
    
    // Prepare segue
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "textColor" {
                let controller = segue.destination as! TextColorViewController
                controller.userElderface = userElderface
            } else if (segue.identifier == "backToBackgroundColor") {
                let controller = segue.destination as! MenuColorViewController
                controller.userElderface = userElderface
            }
        }
    
    // Back button is pressed
    @IBAction func goBackPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToBackgroundColor", sender: self)
    }
    
    // Button color choices
    @IBAction func buttonColorBlack(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.black
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorRed(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.red
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorBlue(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.blue
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorGreen(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.green
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorMagenta(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.magenta
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorPurple(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.purple
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorGray(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.gray
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    @IBAction func buttonColorOrange(_ sender: Any) {
        userElderface.menuButtonColor = UIColor.white
        performSegue(withIdentifier: "textColor", sender: self)
    }
    
    // Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
